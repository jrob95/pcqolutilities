# Test correct output

test_that("Expected response on from raw dataframe standard settings", {
  pcqol_utility_out <- dplyr::mutate(pcqol_utility_out, dplyr::across(dplyr::everything(), ~ round(.x, digits = 4)))
  pcqol_utility_new <- dplyr::mutate(pcqol_utilities(pcqol_raw), dplyr::across(dplyr::everything(), ~ round(.x, digits = 4)))
  expect_identical(pcqol_utility_new, pcqol_utility_out)
})


test_that("Expected response on from raw dataframe non-standard columns names", {
  expect_snapshot(pcqol_utilities(
    pcqol_raw2,
    colnames = c(
      upset = "ups",
      scare = "sca",
      overp = "ove",
      leave = "lwo",
      leada = "lnl",
      awake = "awa"
    )
  ))
})


# Test error messages
test_that("Expected response on from raw dataframe non-standard column names", {
  expect_error(pcqol_utilities(
    pcqol_raw2,
    colnames = c(
      upset = "ups",
      scare = "sca",
      overp = "ove",
      leave = "lwo",
      awake = "awa"
    )
  )) # , regexp = "Incorrect number of elements in the `colnames` argument, ensure it matches the form `c(upset = \"x\", scare = \"x\", overp = \"x\", leave = \"x\", leada = \"x\", awake = \"x\")`")
})

test_that("Expected response on from raw dataframe non-standard columns names", {
  expect_error(pcqol_utilities(
    "pcqol_raw2",
    colnames = c(
      upset = "ups",
      scare = "sca",
      overp = "ove",
      leave = "lwo",
      leada = "lnl",
      awake = "awa"
    )
  ), regexp = "\"pcqol_raw2\" is not a data frame, or not coercible to one.")
})
