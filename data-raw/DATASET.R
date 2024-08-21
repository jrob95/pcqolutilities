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

raw2 <- data.frame(
  ups = c(1, 2, 3, 4, 5, 6, 7),
  awa = c(1, 2, 3, 4, 5, 6, 7),
  lwo = c(1, 2, 3, 4, 5, 6, 7),
  lnl = c(1, 2, 3, 4, 5, 6, 7),
  sca = c(1, 2, 3, 4, 5, 6, 7),
  ove = c(1, 2, 3, 4, 5, 6, 7)
)

# recoded for test
recoded1 <- data.frame(
  upset = c(1, 1, 2, 2, 3, 3, 4),
  awake = c(1, 2, 2, 3, 3, 4, 4),
  leave = c(1, 1, 2, 2, 2, 3, 4),
  leada = c(1, 1, 2, 2, 3, 3, 4),
  scare = c(1, 1, 2, 2, 3, 3, 4),
  overp = c(1, 1, 2, 2, 3, 3, 4)
)

recoded2 <- data.frame(
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

# output for pcqol_utilities test
utility_out <- tibble(
  upset = c(1, 2, 3, 4, 5, 6, 7),
  awake = c(1, 2, 3, 4, 5, 6, 7),
  leave = c(1, 2, 3, 4, 5, 6, 7),
  leada = c(1, 2, 3, 4, 5, 6, 7),
  scare = c(1, 2, 3, 4, 5, 6, 7),
  overp = c(1, 2, 3, 4, 5, 6, 7),
  utility = c(
    1,
    0.967212544439924,
    0.861278713368514,
    0.793470379957854,
    0.599676583390056,
    0.522875735504497,
    0.214662222490407
  )
)

utility_out2 <- tibble(
  ups = c(1, 2, 3, 4, 5, 6, 7),
  awa = c(1, 2, 3, 4, 5, 6, 7),
  lwo = c(1, 2, 3, 4, 5, 6, 7),
  lnl = c(1, 2, 3, 4, 5, 6, 7),
  sca = c(1, 2, 3, 4, 5, 6, 7),
  ove = c(1, 2, 3, 4, 5, 6, 7),
  utility = c(
    1,
    0.967212544439924,
    0.861278713368514,
    0.793470379957854,
    0.599676583390056,
    0.522875735504497,
    0.214662222490407
  )
)


usethis::use_data(raw,
                  recoded1,
                  recoded2,
                  utility_out,
                  utility_out2,
                  raw2,
                  overwrite = TRUE)
