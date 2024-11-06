#' Recode PC-QoL data
#'
#' `pcqol_recode()` recodes raw PC-QoL data in preparation for estimation of
#' health utilities. It is intended as a helper for `pcqol_utilities()`, but is
#' available for use on its' own if the user wishes.
#'
#' @param data Input data. should be either a `data.frame` or tibble object.
#' @param colnames A list contain the name bindings for each PC-QoL item
#' @param replace_cols replace columns or create new columns?
#' * `TRUE`: columns will be replaced
#' * `FALSE`(default): new columns will be appended on to the `data.frame`
#'
#' @returns A `data.frame` with each of the recoded fields, either where columns
#'   replaced by recoded, or in addition to the
#' @export
#'
#' @examples
#' # replacing cols
#' pcqol_recode(pcqol_raw, replace_cols = TRUE)
#' # vs not replace cols
#' pcqol_recode(pcqol_raw, replace_cols = FALSE)
pcqol_recode <- function(data,
                         colnames = c(
                           upset = "upset",
                           scare = "scare",
                           overp = "overp",
                           leave = "leave",
                           leada = "leada",
                           awake = "awake"
                         ),
                         replace_cols = FALSE) {

  # TODO: @returns line in docs looks to be incomplete.

  # validate args
  assertthat::assert_that(inherits(data, "data.frame"))
  lapply(colnames, \(.x) assertthat::assert_that(assertthat::is.string(.x)))
  assertthat::assert_that(assertthat::are_equal(length(colnames), 6))
  lapply(expected_colnames(), \(.x) assertthat::assert_that(assertthat::has_name(colnames, .x)))
  assertthat::assert_that(assertthat::is.flag(replace_cols))

  # with dynamic names. - maybe look at setting names earlier so we only need to mutate once?
  # probably not a major issue though.
  if (replace_cols) {
    data <- data |> dplyr::mutate(
      !!rlang::sym(colnames["upset"]) := recode1(!!rlang::sym(colnames["upset"])),
      !!rlang::sym(colnames["awake"]) := recode3(!!rlang::sym(colnames["awake"])),
      !!rlang::sym(colnames["leave"]) := recode2(!!rlang::sym(colnames["leave"])),
      !!rlang::sym(colnames["leada"]) := recode1(!!rlang::sym(colnames["leada"])),
      !!rlang::sym(colnames["scare"]) := recode1(!!rlang::sym(colnames["scare"])),
      !!rlang::sym(colnames["overp"]) := recode1(!!rlang::sym(colnames["overp"]))
    )
  } else {
    data <- data |> dplyr::mutate(
      !!paste0(colnames["awake"], "Rec") := recode3(!!rlang::sym(colnames["awake"])),
      !!paste0(colnames["leave"], "Rec") := recode2(!!rlang::sym(colnames["leave"])),
      !!paste0(colnames["leada"], "Rec") := recode1(!!rlang::sym(colnames["leada"])),
      !!paste0(colnames["scare"], "Rec") := recode1(!!rlang::sym(colnames["scare"])),
      !!paste0(colnames["upset"], "Rec") := recode1(!!rlang::sym(colnames["upset"])),
      !!paste0(colnames["overp"], "Rec") := recode1(!!rlang::sym(colnames["overp"]))
    )
  }

  data
}

expected_colnames <- function() {
  c(
    "upset",
    "scare",
    "overp",
    "leave",
    "leada",
    "awake"
  )
}
