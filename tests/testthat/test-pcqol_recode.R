data("raw", envir = environment())
data("recoded1", envir = environment())
data("recoded2", envir = environment())

#
test_that("Recode works, replaced columns", {
  expect_equal(pcqol_recode(raw, replace_cols = TRUE), recoded1)
})
test_that("Recode works, unreplaced columns", {
  expect_equal(pcqol_recode(raw, replace_cols = FALSE), recoded2)
})
test_that("Recode works, replace columns not specified", {
  expect_equal(pcqol_recode(raw), recoded2)
})


# hi <- pcqol_recode(raw)
