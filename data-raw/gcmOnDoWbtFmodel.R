# coefficients
coefs <- readRDS("data/gcmOnDoWbtFmodel.rda") |>
  mutate(
    item = substr(attribute, 1, 5),
    level = substr(attribute, 6, length(attribute)),
    level_num = dplyr::case_when(
      level == "Always" ~ 4,
      level == "Often" ~ 3,
      level == "Sometimes" ~ 2,
      level == "Never" ~ 1
    )
  )

saveRDS(coefs, "data/gcmOnDoWbtFmodelClean.rda")
usethis::use_data(coefs,
  overwrite = TRUE,
  internal = TRUE
)
