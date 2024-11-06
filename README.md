
# pcqolutilities <img src="man/figures/logo.png" align="right" height="139" alt="" />
 

<!-- badges: start -->
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/jrob95/pcqolutilities/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/jrob95/pcqolutilities/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->
The goal of pcqolutilities is to facilitate the easy estimation of health utilities for the PC-QoL

## Installation

You can install the development version of pcqolutilities from [GitHub](https://github.com/) with:

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
   awake = "awa"))
```

