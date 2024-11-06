#' Recode PC-QoL data
#'
#' `pcqol_recode()` recodes raw PC-QoL data in preparation for estimation of
#' health utilities. It is intended as a helper for [pcqol_utilities()], but is
#' available for use on its' own if the user wishes.
#'
#' @param data Input data. should be either a dataframe or tibble object.
#' @param colnames A list contain the name bindings for each PC-QoL item
#' @param replace_cols replace columns or create new columns?
#' * `TRUE` (default): columns will be replaced
#' * `FALSE`: new columns will be appended on to the dataframe.
#'
#' @returns A dataframe with each of the recoded fields, either where columns
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
  # errors



  # check if `data` is dataframe or coercible to one?

  # check if `colnames` is a named list and the names of the list are correct.


  # with dynamic names. - maybe look at setting names earlier so we only need to mutate once? probably not a major issue though.
  if (replace_cols == FALSE) {
    data <- data |> dplyr::mutate(
      !!paste0(colnames["awake"], "Rec") := recode3(!!rlang::sym(colnames["awake"])),
      !!paste0(colnames["leave"], "Rec") := recode2(!!rlang::sym(colnames["leave"])),
      !!paste0(colnames["leada"], "Rec") := recode1(!!rlang::sym(colnames["leada"])),
      !!paste0(colnames["scare"], "Rec") := recode1(!!rlang::sym(colnames["scare"])),
      !!paste0(colnames["upset"], "Rec") := recode1(!!rlang::sym(colnames["upset"])),
      !!paste0(colnames["overp"], "Rec") := recode1(!!rlang::sym(colnames["overp"]))
    )
  }
  if (replace_cols == TRUE) {
    data <- data |> dplyr::mutate(
      !!rlang::sym(colnames["upset"]) := recode1(!!rlang::sym(colnames["upset"])),
      !!rlang::sym(colnames["awake"]) := recode3(!!rlang::sym(colnames["awake"])),
      !!rlang::sym(colnames["leave"]) := recode2(!!rlang::sym(colnames["leave"])),
      !!rlang::sym(colnames["leada"]) := recode1(!!rlang::sym(colnames["leada"])),
      !!rlang::sym(colnames["scare"]) := recode1(!!rlang::sym(colnames["scare"])),
      !!rlang::sym(colnames["overp"]) := recode1(!!rlang::sym(colnames["overp"]))
    )
  }

  data
}
