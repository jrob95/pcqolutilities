#' Launch the PCQoL Utilities Shiny App
#'
#' @returns A shiny app for quick and easy estimation of PC-QoL utilities.
#'
#' @examplesIf interactive()
#' run_pcqol_utilities_app()
#'
#' @export
run_pcqol_utilities_app <- function() {
  app_dir <- system.file("shiny-apps", "pcqol_utilities_app", package = "pcqolutilities")
  if (app_dir == "") {
    stop("Could not find example directory. Try re-installing `pcqolutilities`.", call. = FALSE)
  }
  shiny::runApp(app_dir, display.mode = "normal")
}



