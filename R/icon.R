library(hexSticker)
# library(tidyverse)
library(ggplot2)

p <- readRDS(file = "data-raw/hs_utils.rds") +
  theme_void() +
  theme_transparent() +
  theme(
    title = element_blank(),
    legend.position = "none"
  )


s <- sticker(p,
             package="pcqolutilities", p_size=12,
             s_x=.8, s_y=.8, s_width=1.4, s_height=1.2,
             h_fill="#009FE3", h_color="#124C7B",
             spotlight  = TRUE,
             filename="inst/figures/baseplot.png")
s
