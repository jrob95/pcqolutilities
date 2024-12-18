
<!-- README.md is generated from README.Rmd. Please edit that file -->

# pcqolutilities <a href="https://github.com/jrob95/pcqolutilities"><img src="man/figures/logo.png" align="right" height="120" alt="pcqolutilities logo" /></a>

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/jrob95/pcqolutilities/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/jrob95/pcqolutilities/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of pcqolutilities is to facilitate the easy estimation of
health utilities for the PC-QoL

## Installation

You can install the development version of pcqolutilities from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("jrob95/pcqolutilities")
```

## Example

You might have a data frame with columns named ready for the package

``` r
library(pcqolutilities)

# with a simple data frame
pcqol_utilities(pcqol_raw)
#> # A tibble: 7 × 7
#>   upset awake leave leada scare overp utility
#>   <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>   <dbl>
#> 1     1     1     1     1     1     1   0.215
#> 2     2     2     2     2     2     2   0.523
#> 3     3     3     3     3     3     3   0.600
#> 4     4     4     4     4     4     4   0.793
#> 5     5     5     5     5     5     5   0.861
#> 6     6     6     6     6     6     6   0.967
#> 7     7     7     7     7     7     7   1
```

Or maybe you need to specify which columns match the PC-QoL items

``` r
library(pcqolutilities)

# a data frame with non-standard column names
pcqol_utilities(pcqol_raw2,
  colnames = c(
    upset = "ups",
    scare = "sca",
    overp = "ove",
    leave = "lwo",
    leada = "lnl",
    awake = "awa"
  )
)
#> # A tibble: 7 × 7
#>     ups   awa   lwo   lnl   sca   ove utility
#>   <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>   <dbl>
#> 1     1     1     1     1     1     1   0.215
#> 2     2     2     2     2     2     2   0.523
#> 3     3     3     3     3     3     3   0.600
#> 4     4     4     4     4     4     4   0.793
#> 5     5     5     5     5     5     5   0.861
#> 6     6     6     6     6     6     6   0.967
#> 7     7     7     7     7     7     7   1
```

## Using the shiny app

If you install the package, you can use the shiny app locally for a
simple, no frills interface to estimating utilities.

``` r
run_pcqol_utilities_app()
```
