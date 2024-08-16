# recode the given data
pcqol_recode <- function(data,
                         colnames = list(upset = "upset", scare = "scare", overp = "overp", leave = "leave", leada = "leada", awake = "awake")) {
  data |> dplyr::mutate(
    awakeRec = recode3(!!sym(colnames$awake)),
    leaveRec = recode2(!!sym(colnames$leave)),
    leadaRec = recode1(!!sym(colnames$leada)),
    scareRec = recode1(!!sym(colnames$scare)),
    upsetRec = recode1(!!sym(colnames$scare)),
    overpRec = recode1(!!sym(colnames$overp))
  )
}


# with dynamic names.
# pcqol_recode <- function(data, colnames = list(upset = "upset", scare = "scare", overp = "overp", leave = "leave", leada = "leada", awake = "awake")) {
#   data |> dplyr::mutate(
#     !!paste0(colnames$awake, "Rec") := recode3(!!sym(colnames$awake)),
#     !!paste0(colnames$leave, "Rec") := recode2(!!sym(colnames$leave)),
#     !!paste0(colnames$leada, "Rec") := recode1(!!sym(colnames$leada)),
#     !!paste0(colnames$scare, "Rec") := recode1(!!sym(colnames$scare)),
#     !!paste0(colnames$upset, "Rec") := recode1(!!sym(colnames$upset)),
#     !!paste0(colnames$overp, "Rec") := recode1(!!sym(colnames$overp))
#   )
# }
