## code to prepare `DATASET` dataset goes here
# raw for test
pcqol_raw <- data.frame(
  upset = c(1, 2, 3, 4, 5, 6, 7),
  awake = c(1, 2, 3, 4, 5, 6, 7),
  leave = c(1, 2, 3, 4, 5, 6, 7),
  leada = c(1, 2, 3, 4, 5, 6, 7),
  scare = c(1, 2, 3, 4, 5, 6, 7),
  overp = c(1, 2, 3, 4, 5, 6, 7)
)

pcqol_raw2 <- data.frame(
  ups = c(1, 2, 3, 4, 5, 6, 7),
  awa = c(1, 2, 3, 4, 5, 6, 7),
  lwo = c(1, 2, 3, 4, 5, 6, 7),
  lnl = c(1, 2, 3, 4, 5, 6, 7),
  sca = c(1, 2, 3, 4, 5, 6, 7),
  ove = c(1, 2, 3, 4, 5, 6, 7)
)

# recoded for test
pcqol_recoded1 <- data.frame(
  upset = c(4, 3, 3, 2, 2, 1, 1),
  awake = c(4, 4, 3, 3, 2, 2, 1),
  leave = c(4, 3, 2, 2, 2, 1, 1),
  leada = c(4, 3, 3, 2, 2, 1, 1),
  scare = c(4, 3, 3, 2, 2, 1, 1),
  overp = c(4, 3, 3, 2, 2, 1, 1)
)

pcqol_recoded2 <- data.frame(
  upset = c(1, 2, 3, 4, 5, 6, 7),
  awake = c(1, 2, 3, 4, 5, 6, 7),
  leave = c(1, 2, 3, 4, 5, 6, 7),
  leada = c(1, 2, 3, 4, 5, 6, 7),
  scare = c(1, 2, 3, 4, 5, 6, 7),
  overp = c(1, 2, 3, 4, 5, 6, 7),
  awakeRec = c(4, 4, 3, 3, 2, 2, 1),
  leaveRec = c(4, 3, 2, 2, 2, 1, 1),
  leadaRec = c(4, 3, 3, 2, 2, 1, 1),
  scareRec = c(4, 3, 3, 2, 2, 1, 1),
  upsetRec = c(4, 3, 3, 2, 2, 1, 1),
  overpRec = c(4, 3, 3, 2, 2, 1, 1)
)

# output for pcqol_utilities test
pcqol_utility_out <- tibble::tibble(
  upset = c(1, 2, 3, 4, 5, 6, 7),
  awake = c(1, 2, 3, 4, 5, 6, 7),
  leave = c(1, 2, 3, 4, 5, 6, 7),
  leada = c(1, 2, 3, 4, 5, 6, 7),
  scare = c(1, 2, 3, 4, 5, 6, 7),
  overp = c(1, 2, 3, 4, 5, 6, 7),
  utility = c(
    0.214662222490407,
    0.522875735504497,
    0.599676583390056,
    0.793470379957854,
    0.861278713368514,
    0.967212544439924,
    1
  )
)

pcqol_utility_out2 <- tibble::tibble(
  ups = c(1, 2, 3, 4, 5, 6, 7),
  awa = c(1, 2, 3, 4, 5, 6, 7),
  lwo = c(1, 2, 3, 4, 5, 6, 7),
  lnl = c(1, 2, 3, 4, 5, 6, 7),
  sca = c(1, 2, 3, 4, 5, 6, 7),
  ove = c(1, 2, 3, 4, 5, 6, 7),
  utility = c(
    0.214662222490407,
    0.522875735504497,
    0.599676583390056,
    0.793470379957854,
    0.861278713368514,
    0.967212544439924,
    1
  )
)


# coefficients
# load("data/gcmOnDoWbtFmodel.rda")
gcmOnDoWbtFmodel <- structure(
  list(
    attribute = c(
      "upsetAlways",
      "upsetOften",
      "upsetSometimes",
      "upsetNever",
      "scareAlways",
      "scareOften",
      "scareSometimes",
      "scareNever",
      "overpAlways",
      "overpOften",
      "overpSometimes",
      "overpNever",
      "leaveAlways",
      "leaveOften",
      "leaveSometimes",
      "leaveNever",
      "leadaAlways",
      "leadaOften",
      "leadaSometimes",
      "leadaNever",
      "awakeAlways",
      "awakeOften",
      "awakeSometimes",
      "awakeNever",
      "asc_1",
      "asc_2",
      "delta"
    ),
    coef = c(
      upsetAlways_a = 0.135050138166526,
      upsetOften_a = 0.0743397870379712,
      upsetSometimes_a = 0.0364330678379271,
      0,
      scareAlways_a = 0.141972270708138,
      scareOften_a = 0.066952796059743,
      0,
      0,
      overpAlways_a = 0.0722222599882766,
      overpOften_a = 0.0427278539970807,
      0,
      0,
      leaveAlways_a = 0.113837065508331,
      leaveOften_a = 0.0568903105238797,
      leaveSometimes_a = 0.0311429898535399,
      0,
      leadaAlways_a = 0.170606726952366,
      leadaOften_a = 0.0845642006908733,
      leadaSometimes_a = 0.038357773379943,
      0,
      awakeAlways_a = 0.151649316185955,
      awakeOften_a = 0.100595788970736,
      awakeSometimes_a = 0.032787455560076,
      0,
      0,
      asc_2 = 0.0163328127587511,
      delta_a = 0.0516868659084685
    )
  ),
  row.names = c(NA, -27L),
  class = c("broom.helpers",                                                                                                                                                    "tbl_df", "tbl", "data.frame"), exponentiate = FALSE, conf.level = 1.96, coefficients_type = "generic", coefficients_label = "Beta")

gcmOnDoWbtFmodelClean <- gcmOnDoWbtFmodel |>
  tibble::tibble() |>
  dplyr::mutate(
    item = substr(attribute, 1, 5),
    level = substr(attribute, 6, length(attribute)),
    level_num = dplyr::case_when(
      level == "Always" ~ 4,
      level == "Often" ~ 3,
      level == "Sometimes" ~ 2,
      level == "Never" ~ 1
    )
  )

# saveRDS(coefs, "data/gcmOnDoWbtFmodelClean.rds")
# usethis::use_data(coefs,
#   overwrite = TRUE,
#   internal = TRUE
# )

# internal data, typically for testing
usethis::use_data(pcqol_recoded1,
                  pcqol_recoded2,
                  pcqol_utility_out,
                  pcqol_utility_out2,
                  gcmOnDoWbtFmodelClean,
                  overwrite = TRUE,
                  internal = TRUE
)

# external data
usethis::use_data(pcqol_raw,
                  pcqol_raw2,
                  overwrite = TRUE,
                  internal = FALSE
)


# make hex sticker
p <- readRDS(file = "data-raw/hs_utils.rds") +
  ggplot2::theme_void() +
  ggimage::theme_transparent() +
  ggplot2::theme(
    title = ggplot2::element_blank(),
    legend.position = "none"
  )

s <- hexSticker::sticker(p,
  package = "pcqolutilities", p_size = 12,
  s_x = .8, s_y = .8, s_width = 1.4, s_height = 1.2,
  h_fill = "#009FE3", h_color = "#124C7B",
  spotlight = TRUE,
  filename = here::here("inst/figures/baseplot.png")
)
s
usethis::use_logo(here::here("inst/figures/baseplot.png"), geometry = "240x278", retina = TRUE)
