library(shiny)

shinyUI(fluidPage(
  titlePanel("Simulação Previdência, sem e com retirada antes do vencimento"),
  numericInput("nr_anos", "Anos", 25),
  numericInput("juros_aa", "Juros aa (%)", 9),
  numericInput("contribuicao", "Contribuição (R$)", 100),
  tableOutput("table")
  )
)
