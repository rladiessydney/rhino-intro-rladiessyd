# Packages -----
library(shiny)
library(leaflet)
library(spData)
library(dplyr)
library(sf)

# Prepare Data -----
data(world)
mapdata <- world |> mutate(country = name_long)

# UI -----
ui <- function(id) {
  shiny::fluidPage(
    shiny::wellPanel(shiny::actionButton("resetmap", "Reset Map")),
    leaflet::leafletOutput("mapfilter", height = 400),
    shiny::tags$h4("Selected countries:"),
    shiny::verbatimTextOutput("filtered_country")
  )
}

# Server -----
server <- function(input, output, session) {
  
  # Define reactive values
  rv <- shiny::reactiveValues(selected_countries = NULL, # Initialize reactive value for selected counties
                              last_click_id = NULL,
                              filtered_data = mapdata) 
  
  
  shiny::observeEvent(input$mapfilter_shape_click, { # this is the logic behind the "click" of the map.
    
    click <- input$mapfilter_shape_click
    rv$last_click_id <- click$id 
    ########## map behavior ################
    
    # If a country is clicked
    if (click$id %in% rv$selected_countries) {
      # If selected, remove it
      rv$selected_countries <- rv$selected_countries[rv$selected_countries != click$id]
      
    } else if(click$id == "selected"){ # when a county is clicked again it is removed
      
      rv$selected_countries <- rv$selected_countries[rv$selected_countries != tail(rv$selected_countries, n = 1)]
      
    }else {
      # If not selected, add it
      rv$selected_countries <- c(rv$selected_countries, click$id)
    }
    
    # Now update the leaflet
    leaflet::leafletProxy("mapfilter", session) |>
      leaflet::addPolygons(data = mapdata,
                           layerId = ~country,
                           label = ~country,
                           fillColor = ifelse(mapdata$country %in% rv$selected_countries, "#F47A60", "#7fe7dc"), # Change fill color based on selection
                           col = "#316879",
                           weight = 2,
                           fillOpacity = ifelse(mapdata$country %in% rv$selected_countries, 1, 0.5),
                           highlight = highlightOptions(
                             fillOpacity = 1,
                             bringToFront = TRUE)
      )
    
  })
  
  output$filtered_country <- shiny::renderPrint({
    paste(rv$selected_countries, collapse = ',')
  })
  
  # Leaflet
  output$mapfilter <- leaflet::renderLeaflet({ # rendering the filter map
    
    leaflet::leaflet() |> 
      leaflet::addTiles() |> # The is the base map
      leaflet::addPolygons(data = mapdata, 
                           color = '#316879', 
                           weight = 1,
                           layerId = ~country,
                           label = ~country,
                           fillColor = "#7fe7dc",
                           fillOpacity = .5,
                           highlight = highlightOptions(
                             fillOpacity = 1,
                             bringToFront = TRUE
                           )) |>
      leaflet::setView(zoom = 1, lng = 0, lat =50)
    
  })
  
  # Reset the map filter
  shiny::observeEvent(input$resetmap, {
    
    rv$selected_countries <- NULL
    rv$last_click_id <- NULL
    rv$filtered_data <- mapdata
    
    leafletProxy("mapfilter", session) |>
      leaflet::addPolygons(data = mapdata, 
                           color = '#316879', 
                           weight = 1,
                           layerId = ~country,
                           label = ~country,
                           fillColor = "#7fe7dc",
                           fillOpacity = .5,
                           highlight = highlightOptions(
                             fillOpacity = 1,
                             bringToFront = TRUE
                           )) |>
      leaflet::setView(zoom = 1, lng = 0, lat =50)
    
  })
  
  
  # Return reactive values
  return(
    list(
      value = shiny::reactive(rv$selected_countries),
      filtered  = shiny::reactive(rv$filtered_data)
    )
  )
  
}   


# Run the app -----
shinyApp(ui = ui, server = server)


