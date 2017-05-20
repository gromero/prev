library(shiny)
source("simula.R")

shinyServer(function(input, output) {
  output$table <- renderTable(simula(input$nr_anos, input$juros_aa, input$contribuicao))
  }
)
