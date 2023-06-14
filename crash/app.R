library(shiny)

ui <- fluidPage(

  # Application title
  titlePanel("crash"),


  sidebarLayout(
    sidebarPanel(
      actionButton("crash", "blow it up", icon = icon("bomb"))
    ),


    mainPanel(
      verbatimTextOutput("fail")
    )
  )
)

server <- function(input, output) {

  observeEvent("crash", {
    temp_file <- tempfile(fileext = ".csv")
    write.csv(iris, file = temp_file)
    message("what")
    Sys.sleep(10)
    crash::crash()
  }
  )

}

# Run the application
shinyApp(ui = ui, server = server)
