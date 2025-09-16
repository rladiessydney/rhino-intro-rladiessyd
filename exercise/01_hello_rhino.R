box::use(
  shiny
)

#' @export
ui <- function(id) {
  ns <- shiny$NS(id)
  
  shiny$fluidPage(
    shiny$titlePanel("Hello, Shiny!"),
    shiny$sidebarLayout(
      shiny$sidebarPanel(
        # Slider Input
        shiny$sliderInput(
          
          ## update the inputID with ns()
          inputId = ?,
          label = "Number of bins:",
          min = 1,
          max = 50,
          value = 30
        )
      ),
      shiny$mainPanel(
        ## update the outputId with ns()
        shiny$plotOutput(outputId = ?)
      ))
  )
  
}

#' @export
server <- function(id) {
  shiny$moduleServer(id, function(input, output, session) {
    
    output$distPlot <- shiny::renderPlot({
      
      x    <- datasets::faithful$waiting
      bins <- seq(min(x), max(x), length.out = input$bins + 1)
      
      graphics::hist(x, breaks = bins, col = "#007bc2", border = "white",
                     xlab = "Waiting time to next eruption (in mins)",
                     main = "Histogram of waiting times")
      
    })
  })
}
