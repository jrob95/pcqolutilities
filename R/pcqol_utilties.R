#' Estimate utilities
#'
#' @param data A data frame containing fields `upset`, `scare`, `overp`, `leave`, `leada`, `awake`, or fields specified in `colnames`.
#' @param recode Do the columns need to be recoded, from the 1-7 Likert scale, to the 1-4 Likert scale.
#' @param colnames A named character vector of fields of interest.
#' @param value_set A character from which value set should utilities be estimated.
#' @param return_df Logical. should the calculated utilities be appended to the originally input data frame.
#'
#' @returns A tibble of utility values, with or without original data.
#' @examples
#' # with a simple data frame
#' pcqol_utilities(pcqol_raw)
#' # a data frame with non-standard column names
#' pcqol_utilities(pcqol_raw2,
#'   colnames = c(
#'     upset = "ups",
#'     scare = "sca",
#'     overp = "ove",
#'     leave = "lwo",
#'     leada = "lnl",
#'     awake = "awa"
#'   )
#' )
#' @export
pcqol_utilities <- function(data,
                            recode = TRUE,
                            colnames = c(
                              upset = "upset",
                              scare = "scare",
                              overp = "overp",
                              leave = "leave",
                              leada = "leada",
                              awake = "awake"
                            ),
                            value_set = "roberts2024",
                            return_df = TRUE) {
  # Errors
  # validate args
  assertthat::assert_that(inherits(data, "data.frame"))
  lapply(colnames, \(.x) assertthat::assert_that(assertthat::is.string(.x)))
  assertthat::assert_that(assertthat::are_equal(length(colnames), 6))
  lapply(expected_colnames(), \(.x) assertthat::assert_that(assertthat::has_name(colnames, .x)))
  lapply(colnames, \(.x) assertthat::assert_that(assertthat::has_name(data, .x)))
  assertthat::assert_that(assertthat::is.flag(return_df))
  assertthat::assert_that(assertthat::is.flag(recode))

  ## value set is not included
  # TODO: while there is only one value set, I think it's probably worth just removing the `value_set` arg.
  # have changed to using match arg. If you want to add more value sets, add them to the value_set default arg vector.
  # i.e. `value_set = c("roberts2024", "randi2025")`
  value_set <- match.arg(value_set)
  if (value_set == "roberts2024") {
    disutil_coefs <- gcmOnDoWbtFmodelClean
  }


  ## values are out of range
  # If statement to check if all values in specified columns are between 1 and 7
  if (!all(sapply(data[colnames], function(x) all(dplyr::between(x, 1, 7))))) {
    stop("Some values are outside the range of 1 to 7, please check the coding is correct.")
  }

  data_orig <- data
  # TODO: I think this statement below should be removed.
  # Force the user to use the correct names for the arg and include assertions (as I have above) instead

  # If you really don't want to remove it, make it a separate function and call it within the pipe below to
  # make this function a bit more readable

  # Correct column names if they differ from the expected ones
  if (!all(colnames == c(upset = "upset", scare = "scare", overp = "overp", leave = "leave", leada = "leada", awake = "awake"))) {
    corrected_colnames <- unlist(lapply(names(colnames), function(colname) {
      if (colname %in% names(colnames)) {
        return(colnames[[colname]])
      } else {
        return(colname)
      }
    }))
    names(corrected_colnames) <- names(colnames)

    # Update column names
    data <- data[, corrected_colnames, drop = FALSE]
    names(data) <- names(corrected_colnames)

    # change colnames to the correct names for future reference - the way I have done this I think is a bit redundant
    colnames <- names(corrected_colnames)
    names(colnames) <- names(corrected_colnames)
  }

  data |>
    tibble::rowid_to_column() |>
    (\(data) {
      # recode according to https://doi.org/10.1007/s11136-024-03652-w
      if (recode) {
        data <- pcqol_recode(data, colnames = colnames, replace_cols = TRUE)
      }
      data
    })() |>
    tidyr::pivot_longer(as.vector(colnames)) |>
    dplyr::left_join(disutil_coefs, dplyr::join_by(name == item, value == level_num)) |>
    dplyr::group_by(rowid) |>
    dplyr::summarise(utility = 1 - sum(coef)) |>
    (\(data) {
      if (return_df) {
        data <- dplyr::full_join(data, tibble::rowid_to_column(data_orig), dplyr::join_by(rowid))
      }
      data
    })() |>
    dplyr::select(-rowid) |>
    dplyr::relocate(utility, .after = dplyr::last_col())
}
