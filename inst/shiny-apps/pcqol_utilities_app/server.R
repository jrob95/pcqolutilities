# Server ####
shiny::shinyServer(function(input, output, session) {
  data_reactive <- shiny::reactiveVal(data.frame(
    upset = numeric(),
    scare = numeric(),
    overp = numeric(),
    leave = numeric(),
    leada = numeric(),
    awake = numeric()
  ))

  shiny::observeEvent(input$reset_button, {
    session$reload()  # Reloads the session
  })

  shiny::observeEvent(input$file_input, {
    shiny::req(input$file_input)
    ext <- tools::file_ext(input$file_input$name)

    uploaded_data <- if (ext == "csv") {
      utils::read.csv(input$file_input$datapath)
    } else if (ext == "xlsx") {
      readxl::read_excel(input$file_input$datapath)
    }

    # Preprocess uploaded data to convert text labels to numeric values
    processed_data <- pcqol_preprocess_labels(uploaded_data)
    data_reactive(processed_data)
  })

  shiny::observeEvent(input$add_row, {
    new_row <- data.frame(
      upset = input$upset,
      scare = input$scare,
      overp = input$overp,
      leave = input$leave,
      leada = input$leada,
      awake = input$awake
    )
    data_reactive(dplyr::bind_rows(data_reactive(), new_row))
  })

  output$input_table <- shiny::renderTable({
    data_reactive()
  })

  calculated_data <- shiny::eventReactive(input$calculate, {
    shiny::req(data_reactive())
    pcqol_utilities(data_reactive())
  })

  output$output_table <- shiny::renderTable({
    calculated_data()
  })

  output$download_output <- shiny::downloadHandler(
    filename = function() {
      paste("utility_output", Sys.Date(), ".csv", sep = "")
    },
    content = function(file) {
      utils::write.csv(calculated_data(), file, row.names = FALSE)
    }
  )

  output$download_labelled_xlsx <- shiny::downloadHandler(
    filename = function() { "labelled.xlsx" },
    content = function(file) {
      file.copy("https://github.com/jrob95/pcqolutilities/blob/main/inst/extdata//labelled.xlsx", file)
    },
    contentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
  )

  output$download_labelled_csv <- shiny::downloadHandler(
    filename = function() { "labelled.csv" },
    content = function(file) {
      file.copy("https://github.com/jrob95/pcqolutilities/blob/main/inst/extdata//labelled.csv", file)
    }
  )

  output$download_unlabelled_xlsx <- shiny::downloadHandler(
    filename = function() { "unlabelled.xlsx" },
    content = function(file) {
      file.copy("https://github.com/jrob95/pcqolutilities/blob/main/inst/extdata//unlabelled.xlsx", file)
    }
  )

  output$download_unlabelled_csv <- shiny::downloadHandler(
    filename = function() { "unlabelled.csv" },
    content = function(file) {
      file.copy("https://github.com/jrob95/pcqolutilities/blob/main/inst/extdata//unlabelled.csv", file)
    }
  )
})
