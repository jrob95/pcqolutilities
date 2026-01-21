#' Convert Text Labels to Numeric Values for PCQoL Utilities
#'
#' This function maps textual responses in the PCQoL questionnaire
#' to their corresponding numeric values (1-7).
#'
#' @param data A data frame containing columns with PCQoL responses, either in numeric form or as text labels.
#'
#' @return A data frame with text labels converted to numeric values.
#' @examples
#' data <- data.frame(
#'   upset = c("All the time", "Quite often", "None of the time"),
#'   scare = c("Very worried/ concerned", "Not worried/ concerned", "Somewhat worried/ concerned")
#' )
#' pcqol_preprocess_labels(data)
#'
#' # Example usage:
#' data <- data.frame(
#' upset = c("All the time", "Quite often", "None of the time"),
#'   scare = c("Very worried/ concerned", "Not worried/ concerned", "Somewhat worried/ concerned"),
#'   overp = c("Once in a while", "All the time", "Quite often"),
#'   leave = c("Hardly any of the time", "None of the time", "All the time"),
#'   leada = c("Very worried/ concerned", "Fairly worried/ concerned", "Not worried/ concerned"),
#'   awake = c("All the time", "Hardly any of the time", "Some of the time")
#' )
#'
#' # Convert text labels to numeric
#' processed_data <- pcqol_preprocess_labels(data)
#'
#' # Use the processed data in pcqol_utilities
#' utilities <- pcqol_utilities(processed_data)

#' @export
pcqol_preprocess_labels <- function(data) {
  # Define the mapping from text labels to numeric values
  label_mapping <- list(
    "All the time" = 1, "Most of the time" = 2, "Quite often" = 3,
    "Some of the time" = 4, "Once in a while" = 5,
    "Hardly any of the time" = 6, "None of the time" = 7,
    "Very, very worried/ concerned" = 1, "Very worried/ concerned" = 2,
    "Fairly worried/ concerned" = 3, "Somewhat worried/ concerned" = 4,
    "A little worried/ concerned" = 5, "Hardly worried/ concerned" = 6,
    "Not worried/ concerned" = 7
  )

  # Helper function to convert text to sentence case
  to_sentence_case <- function(text) {
    if (is.na(text)) return(NA_character_)
    text <- tolower(text)
    paste0(toupper(substring(text, 1, 1)), substring(text, 2))
  }

  # Process each column
  for (col in names(data)) {
    if (is.character(data[[col]]) || is.factor(data[[col]])) {
      # Convert to character and force sentence case
      data[[col]] <- as.character(data[[col]])
      data[[col]] <- sapply(data[[col]], to_sentence_case)

      # Recode to numeric
      data[[col]] <- as.numeric(dplyr::recode(data[[col]], !!!label_mapping))
    }
  }
  return(data)
}
