# recode the given data
pcqol_recode <- function(data,
                         colnames = list(upset = "upset", scare = "scare", overp = "overp", leave = "leave", leada = "leada", awake = "awake")) {
  data |> dplyr::mutate(
    awakeRec = recode3(awake),
    leaveRec = recode2(leave),
    leadaRec = recode1(leada),
    scareRec = recode1(scare),
    upsetRec = recode1(upset),
    overpRec = recode1(overp)
  )
}
