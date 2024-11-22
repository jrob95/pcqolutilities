test_that("Recode works, replaced columns", {
  expect_identical(pcqol_recode(pcqol_raw, replace_cols = TRUE), pcqol_recoded1)
})
test_that("Recode works, unreplaced columns", {
  expect_identical(pcqol_recode(pcqol_raw, replace_cols = FALSE), pcqol_recoded2)
})
test_that("Recode works, replace columns not specified", {
  expect_identical(pcqol_recode(pcqol_raw), pcqol_recoded2)
  expect_snapshot(pcqol_recode(pcqol_raw))
})
