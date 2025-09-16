# app/view/hello.R

box::use(
  shiny,
)

#' @export
ui <- function(id) {
  ns <- shiny$NS(id)
  shiny$div(
    shiny$h1("Hello, World!"),
    
    ## update the inputID with ns()
    shiny$textInput(inputId = , 
                    label = "Your Name",
                    value = '',
                    placeholder = NULL),
    
    
    ## update the outputId with ns()
    shiny$textOutput(outputId = ?)
  )
}

#' @export
server <- function(id) {
  shiny$moduleServer(id, function(input, output, session) {
    # update inputID & # outputId
    
    output$______ <- shiny::renderText({
      paste('Hello, ', input$_____, "!", sep = '')
    })
  })
}