
#' @export
# Estimate utilities
pcqol_utilities <- function(data,
                            recode = FALSE,
                            colnames = list(upset = "upset", scare = "scare", overp = "overp", leave = "leave", leada = "leada", awake = "awake"),
                            value_set = "roberts2024") {

  if (value_set == "roberts 2024") {
    coefs = readRDS("data/gcmOnDoWbtFmodelClean.rds")}

  data
  if (recode == TRUE) {
    data2 <- pcqol_recode(data)
  }

  data <- data |>
    tibble::rowid_to_column() |>
    tidyr::pivot_longer(tidyr::ends_with("Rec")) |>
    dplyr::mutate("name" = string::str_remove("name", "Rec")) |>
    dplyr::left_join(coefs, dplyr::join_by("name" == "item", "value" == "level_num")) |>
    # remove evidence of coefficients
    dplyr::select(-names(coefs)) |>
    dplyr::group_by("rowid") |>
    dplyr::summarise(utility = 1 - sum(coef))
}
