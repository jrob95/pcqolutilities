# UI ####
shiny::fluidPage(
  shiny::titlePanel("PCQoL Utility Calculator"),

  shiny::sidebarLayout(
    shiny::sidebarPanel(
        shiny::fileInput("file_input", "Upload CSV or XLSX File", accept = c(".csv", ".xlsx")),
        shiny::actionButton("reset_button", "Reset Session"),

        shiny::helpText(
          "When coding values please ensure:",
          shiny::tags$ul(
            shiny::tags$li("1 = the more frequent/ greater worry/ concern level, e.g., 'All the time'."),
            shiny::tags$li("7 = the less frequent/ lesser worry/ concern level, e.g., 'None of the time'."),
            shiny::tags$li("Alternatively, labelled data can be uploaded as long as the labels match the text in the 2008 Newcombe et al. article. Labels are not case sensitive.")
          )
        ),

        shiny::h3("Manual Input"),
        shiny::numericInput("upset", "Upset", value = NA, min = 1, max = 7),
        shiny::numericInput("scare", "Scared", value = NA, min = 1, max = 7),
        shiny::numericInput("overp", "Overprotective", value = NA, min = 1, max = 7),
        shiny::numericInput("leave", "Leave child with others", value = NA, min = 1, max = 7),
        shiny::numericInput("leada", "Lead a normal life", value = NA, min = 1, max = 7),
        shiny::numericInput("awake", "Awakened during the night", value = NA, min = 1, max = 7),
        shiny::actionButton("add_row", "Add Row"),

        shiny::actionButton("calculate", "Calculate Utilities"),
        shiny::downloadButton("download_output", "Download Output")
      ),



    shiny::mainPanel(
      shiny::tabPanel("Inputs and outputs",
                      shiny::h3("Inputs and outputs"),
                      shiny::tableOutput("input_table"),
                      shiny::tableOutput("output_table")),
      shiny::tabPanel("Examples",
                      shiny::h3("Download Example Data Files"),
                      shiny::p("Click on the links below to download example data files."),

                      shiny::downloadButton("download_labelled_xlsx", "Download labelled.xlsx"),
                      shiny::downloadButton("download_labelled_csv", "Download labelled.csv"),
                      shiny::downloadButton("download_unlabelled_xlsx", "Download unlabelled.xlsx"),
                      shiny::downloadButton("download_unlabelled_csv", "Download unlabelled.csv")
      )
    )
  )
)



