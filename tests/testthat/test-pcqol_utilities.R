# Test correct output

test_that("Expected response on from raw dataframe standard settings", {
  expect_equal(pcqol_utilities(raw), utility_out)
})


test_that("Expected response on from raw dataframe non-standard columns names",
          {
            expect_equal(pcqol_utilities(
              raw2,
              colnames = c(
                upset = "ups",
                scare = "sca",
                overp = "ove",
                leave = "lwo",
                leada = "lnl",
                awake = "awa"
              )
            ), utility_out2)
          })


# Test error messages
test_that("Expected response on from raw dataframe non-standard column names",
          {
            expect_error(pcqol_utilities(
              raw2,
              colnames = c(
                upset = "ups",
                scare = "sca",
                overp = "ove",
                leave = "lwo",
                awake = "awa"
              )
            )) # , regexp = "Incorrect number of elements in the `colnames` argument, ensure it matches the form `c(upset = \"x\", scare = \"x\", overp = \"x\", leave = \"x\", leada = \"x\", awake = \"x\")`")
          })

test_that("Expected response on from raw dataframe non-standard columns names",
          {
            expect_error(pcqol_utilities(
              "raw2",
              colnames = c(
                upset = "ups",
                scare = "sca",
                overp = "ove",
                leave = "lwo",
                leada = "lnl",
                awake = "awa"
              )
            ), regexp = "\"raw2\" is not a data frame, or not coercible to one.")
          })
