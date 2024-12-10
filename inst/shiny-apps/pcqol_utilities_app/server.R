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

  shiny::observeEvent(input$file_input, {
    shiny::req(input$file_input)
    ext <- tools::file_ext(input$file_input$name)

    uploaded_data <- if (ext == "csv") {
      utils::read.csv(input$file_input$datapath)
    } else if (ext == "xlsx") {
      readxl::read_excel(input$file_input$datapath)
    }

    # Preprocess uploaded data to convert text labels to numeric values
    processed_data <- preprocess_data(uploaded_data)
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
})
