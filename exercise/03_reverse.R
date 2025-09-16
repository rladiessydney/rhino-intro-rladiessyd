# app/view/hello.R

box::use(
  shiny,
)

box::use(
  app/logic/reverse[reverse_words]
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
    
    ## Add new output with reversed name
    shiny$textOutput(outputId = ns(?))
  )
}

#' @export
server <- function(id) {
  shiny$moduleServer(id, function(input, output, session) {
    # update inputID & # outputId
    
    output$______ <- shiny::renderText({
      paste('Hello, ', input$_____, "!", sep = '')
    })
    
    output$______ <- shiny::renderText(
      reverse_words(input$_________)
    )
  })
}

