## code to prepare `DATASET` dataset goes here
# raw for test
raw <- data.frame(
  upset = c(1, 2, 3, 4, 5, 6, 7),
  awake = c(1, 2, 3, 4, 5, 6, 7),
  leave = c(1, 2, 3, 4, 5, 6, 7),
  leada = c(1, 2, 3, 4, 5, 6, 7),
  scare = c(1, 2, 3, 4, 5, 6, 7),
  overp = c(1, 2, 3, 4, 5, 6, 7)
)


# recoded for test
recoded1 <- data.frame(
  upset = c(1, 2, 3, 4, 5, 6, 7),
  awake = c(1, 2, 3, 4, 5, 6, 7),
  leave = c(1, 2, 3, 4, 5, 6, 7),
  leada = c(1, 2, 3, 4, 5, 6, 7),
  scare = c(1, 2, 3, 4, 5, 6, 7),
  overp = c(1, 2, 3, 4, 5, 6, 7),
  awakeRec = c(1, 2, 2, 3, 3, 4, 4),
  leaveRec = c(1, 1, 2, 2, 2, 3, 4),
  leadaRec = c(1, 1, 2, 2, 3, 3, 4),
  scareRec = c(1, 1, 2, 2, 3, 3, 4),
  upsetRec = c(1, 1, 2, 2, 3, 3, 4),
  overpRec = c(1, 1, 2, 2, 3, 3, 4)
)


recoded2 <- data.frame(
  awakeRec = c(1, 2, 2, 3, 3, 4, 4),
  leaveRec = c(1, 1, 2, 2, 2, 3, 4),
  leadaRec = c(1, 1, 2, 2, 3, 3, 4),
  scareRec = c(1, 1, 2, 2, 3, 3, 4),
  upsetRec = c(1, 1, 2, 2, 3, 3, 4),
  overpRec = c(1, 1, 2, 2, 3, 3, 4)
)

usethis::use_data(raw, recoded1, recoded2, overwrite = TRUE)

