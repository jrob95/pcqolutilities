# functions to recode depending on appropriate scheme from https://doi.org/10.1007/s11136-024-03652-w
recode1 <- function(item) {
  dplyr::case_when(
    item == 7 | item == 6 ~ 1,
    item == 5 | item == 4 ~ 2,
    item == 3 | item == 2 ~ 3,
    item == 1 ~ 4,
    .default = NA
  )
}

recode2 <- function(item) {
  dplyr::case_when(
    item == 7 | item == 6 ~ 1,
    item == 5 | item == 4 | item == 3 ~ 2,
    item == 2 ~ 3,
    item == 1 ~ 4,
    .default = NA
  )
}

recode3 <- function(item) {
  dplyr::case_when(
    item == 7 ~ 1,
    item == 6 | item == 5 ~ 2,
    item == 4 | item == 3 ~ 3,
    item == 2 | item == 1 ~ 4,
    .default = NA
  )
}
