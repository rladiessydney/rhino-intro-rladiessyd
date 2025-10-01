box::use(
  shiny,
)


# Define the images function
images <- function(filenames) {
  lapply(filenames, function(name) {
    shiny$img(
      src = paste0("/static/img/", name, ".jpg")
    )
  })
}

#' @export
ui <- function(id, category, choices) {
  ns <- shiny$NS(id)
  shiny$div(
    shiny$h1(paste("Favorite", category)),
    
    # Step 7: Add a checkboxGroupInput to the UI of the favorites module.
    shiny$checkboxGroupInput(
      inputId = _________,
      choices = choices,
      label = category,
      selected = NULL,
    ),
    
    # Step 8:
    shiny$uiOutput(
      ns("selimg")
    )
  )
}

#' @export
server <- function(id) {
  shiny$moduleServer(id, function(input, output, session) {
    # Step 8:
    
    output$selimg <- shiny::renderUI({
      images(input$_________)
    })
    
  })
}