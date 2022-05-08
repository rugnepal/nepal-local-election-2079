
# Define server logic
function(input, output, session) {
  observeEvent(input$province, {
    updateSelectizeInput(session, "district",
      choices = subset(filter_list, province == input$province)$district |>
        unique()
    )
  })

  observeEvent(input$district, {
    updateSelectizeInput(session, "local_level",
      choices = subset(filter_list, district == input$district)$local_level |>
        unique()
    )
  })


  observeEvent(input$local_level, {
    updateSelectizeInput(session, "ward",
      choices = c("सबै", subset(filter_list, local_level == input$local_level)$ward |>
        unique())
    )
  })


  observeEvent(input$submit, {
    data_in <- reactive({
      sel <- (candidates_list$province == input$province) &
        (candidates_list$district == input$district) &
        (candidates_list$local_level == input$local_level) &
        (input$ward == "सबै" | candidates_list$ward == input$ward) &
        (!input$in_candidate | candidates_list$political_party == "स्वतन्त्र")

      candidates_list[sel, 4:7, drop = F]
    }) |> bindEvent(
      input$province, input$district,
      input$local_level, input$ward
    )

    output$table <- renderDataTable({
      datatable(data_in(),
        colnames = col_labels[4:7],
        filter = "top",
        extensions = c("Scroller", "Responsive"),
        options = list(
          dom = "t",
          deferRender = TRUE,
          scrollY = 400,
          scroller = TRUE
        )
      )
    })
  })
}
