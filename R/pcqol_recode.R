

#' @export
# recode the given data
pcqol_recode <- function(data,
                         colnames = list(
                           upset = "upset",
                           scare = "scare",
                           overp = "overp",
                           leave = "leave",
                           leada = "leada",
                           awake = "awake"
                         ),
                         dynamic_names = FALSE) {
  if (dynamic_names == FALSE) {
    data |> dplyr::mutate(
      awakeRec = recode3(!!rlang::sym(colnames$awake)),
      leaveRec = recode2(!!rlang::sym(colnames$leave)),
      leadaRec = recode1(!!rlang::sym(colnames$leada)),
      scareRec = recode1(!!rlang::sym(colnames$scare)),
      upsetRec = recode1(!!rlang::sym(colnames$scare)),
      overpRec = recode1(!!rlang::sym(colnames$overp))
    )
  }
  # with dynamic names.
  if (dynamic_names == TRUE) {
    data |> dplyr::mutate(
      !!paste0(colnames$awake, "Rec") := recode3(!!rlang::sym(colnames$awake)),
      !!paste0(colnames$leave, "Rec") := recode2(!!rlang::sym(colnames$leave)),
      !!paste0(colnames$leada, "Rec") := recode1(!!rlang::sym(colnames$leada)),
      !!paste0(colnames$scare, "Rec") := recode1(!!rlang::sym(colnames$scare)),
      !!paste0(colnames$upset, "Rec") := recode1(!!rlang::sym(colnames$upset)),
      !!paste0(colnames$overp, "Rec") := recode1(!!rlang::sym(colnames$overp))
    )
  }
}
