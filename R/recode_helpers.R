# functions to recode depending on appropriate scheme from https://doi.org/10.1007/s11136-024-03652-w
recode1 <- function(item) {
  item = dplyr::case_when(item == 1 | item == 2 ~ 1,
                          item == 3 | item == 4 ~ 2,
                          item == 5 | item == 6 ~ 3,
                          item == 7 ~ 4,
                          TRUE ~ NA)
}

recode2 <- function(item) {
  item = dplyr::case_when(item == 1 | item == 2 ~ 1,
                          item == 3 | item == 4 | item == 5 ~ 2,
                          item == 6 ~ 3,
                          item == 7 ~ 4,
                          TRUE ~ NA)
}

recode3 <- function(item) {
  item = dplyr::case_when(item == 1 ~ 1,
                          item == 2 | item == 3 ~ 2,
                          item == 4 | item == 5 ~ 3,
                          item == 6 | item == 7 ~ 4,
                          TRUE ~ NA)
}
