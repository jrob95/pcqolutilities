# Expected response on from raw dataframe non-standard columns names

    Code
      pcqol_utilities(pcqol_raw2, colnames = c(upset = "ups", scare = "sca", overp = "ove",
        leave = "lwo", leada = "lnl", awake = "awa"))
    Output
      # A tibble: 7 x 7
          ups   awa   lwo   lnl   sca   ove utility
        <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>   <dbl>
      1     1     1     1     1     1     1   0.215
      2     2     2     2     2     2     2   0.523
      3     3     3     3     3     3     3   0.600
      4     4     4     4     4     4     4   0.793
      5     5     5     5     5     5     5   0.861
      6     6     6     6     6     6     6   0.967
      7     7     7     7     7     7     7   1    

