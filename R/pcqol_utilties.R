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
#' colnames = c(
#'   upset = "ups",
#'   scare = "sca",
#'   overp = "ove",
#'   leave = "lwo",
#'   leada = "lnl",
#'   awake = "awa"))
#' @export
pcqol_utilities <- function(data,
                            recode = TRUE,
                            colnames = c(upset = "upset", scare = "scare", overp = "overp", leave = "leave", leada = "leada", awake = "awake"),
                            value_set = "roberts2024",
                            return_df = TRUE) {

  # Errors
  ## data frame is not a data frame
  if(!is.data.frame(data)) {
    stop(paste0(deparse(substitute(data)), " is not a data frame, or not coercible to one."))
  }

  ## colnames
  if(length(colnames) != 6){
    stop("Incorrect number of elements in the `colnames` argument, ensure it matches the form `c(upset = \"x\", scare = \"x\", overp = \"x\", leave = \"x\", leada = \"x\", awake = \"x\")`")
  }

  if(!is.character(colnames)){
    stop("`Colnames` argument is not a character vector. It should be of the form `c(upset = \"x\", scare = \"x\", overp = \"x\", leave = \"x\", leada = \"x\", awake = \"x\")`")
  }

  ## names in colnames
  if(any(names(colnames) != c("upset", "scare", "overp", "leave", "leada", "awake"))){
    stop("`Colnames` argument is not in specified form. It should be of the form `c(upset = \"x\", scare = \"x\", overp = \"x\", leave = \"x\", leada = \"x\", awake = \"x\")`")
  }

  ## colnames not in dataframe
  if(!any(colnames %in% names(data))){
    stop(paste0("Elements given in `colnames` argument do not exist in ",deparse(substitute(data))))
  }

  ## value set is not included
  value_sets <- c("roberts2024")
  if(!value_set %in% value_sets){
    stop("`value_set` given does not exist.")
  }

  ## values are out of range
  # If statement to check if all values in specified columns are between 1 and 7
  if (!all(sapply(data[colnames], function(x) all(dplyr::between(x, 1, 7))))) {
    stop("Some values are outside the range of 1 to 7, please check the coding is correct.")
  }

  # Set value set - add more as/ if they become available
  # value set from:
  if (value_set == "roberts2024") {
    disutil_coefs <- gcmOnDoWbtFmodelClean
  }

  data2 <- data
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

    # Update data2 column names
    data2 <- data2[, corrected_colnames, drop = FALSE]
    names(data2) <- names(corrected_colnames)

    # change colnames to the correct names for future reference - the way I have done this I think is a bit redundant
    colnames <- names(corrected_colnames)
    names(colnames) <- names(corrected_colnames)

  }

  # add rowid to data.
  data2 <- tibble::rowid_to_column(data2)

  # recode according to https://doi.org/10.1007/s11136-024-03652-w
  if (recode == TRUE) {
    data2 <- pcqol_recode(data2, colnames = colnames, replace_cols = TRUE)
  }

  # make transformations.
  data2 <- data2 |>
    tidyr::pivot_longer(as.vector(colnames)) |>
    dplyr::left_join(disutil_coefs, dplyr::join_by(name == item, value == level_num)) |>
    dplyr::group_by(rowid) |>
    dplyr::summarise(utility = 1- sum(coef))

  if (return_df == TRUE){
    data2 <- data2 |>
      dplyr::full_join(tibble::rowid_to_column(data), dplyr::join_by(rowid))
  }

  # method if it is all in one column?

  # return result
  data2 <- data2 |>
    dplyr::select(-rowid) |>
    dplyr::relocate(utility, .after = dplyr::last_col())
  return(data2)
}
