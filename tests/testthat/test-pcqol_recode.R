# data("raw", envir = environment())
# data("recoded1", envir = environment())
# data("recoded2", envir = environment())

#
test_that("Recode works, replaced columns", {
  expect_equal(pcqol_recode(pcqol_raw, replace_cols = TRUE), pcqol_recoded1)
})
test_that("Recode works, unreplaced columns", {
  expect_equal(pcqol_recode(pcqol_raw, replace_cols = FALSE), pcqol_recoded2)
})
test_that("Recode works, replace columns not specified", {
  print(pcqol_recode(pcqol_raw))
  print(pcqol_recoded2)
  expect_equal(pcqol_recode(pcqol_raw), pcqol_recoded2)
})
