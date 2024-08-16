data("raw", envir = environment())
data("recoded1", envir = environment())

test_that("Recode works", {
  expect_equal(pcqol_recode(raw), recoded1)
})


hi <- pcqol_recode(raw)
