# Exercise 2 - Call a module from View 

## Step 1 

-  Call the `hist.R` from your `main.R` with the following syntax

``` r
box::use(
  shiny
)

box::use(
  app/view/hist
)

#' @export
ui <- function(id) {
  ns <- shiny$NS(id)
  
  shiny$fluidPage(
    hist$ui(ns('mod1'))
  )
  
}

#' @export
server <- function(id) {
  shiny$moduleServer(id, function(input, output, session) {
    
    hist$server("mod1")
    
  })
}
```

-  See the app

## Step 2

-  Copy and update the syntax `/exercise/02_hello_mod.R` and create your `/app/view/hello.R`

-  Call the `hello.R` from your `main.R` 

-  See the app