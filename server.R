#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$TMdist <- renderText({
    input$plotButton
    isolate ({
    latdif <- (input$latitude - 27.1750)*pi/180
    longdif <- (input$longitude - 78.0422)*pi/180
    earthR <- 6371
    intdist <- sin(latdif/2)*sin(latdif/2) + 
      cos(27.1750*pi/180) * cos(input$latitude*pi/180) *
      sin(longdif/2)*sin(longdif/2)
    ptdist <- 2 * earthR * atan2(sqrt(intdist), sqrt(1-intdist))
    paste("Your distance from the Taj Mahal is: ", 
          round(ptdist, 2), "km or ", round(ptdist/1.60934, 2), 
          "miles", sep ="")
    })
  })
  
#  output$plot1 <- renderPlot({
  output$plot1 <- renderLeaflet({
    input$plotButton
    # draw the world map identifying the location
    isolate({ my_map <- leaflet() %>%
      addTiles() %>%
      addMarkers(lat = input$latitude, 
                 lng = input$longitude,      
                 popup = "You are here") %>%
      addMarkers(lat = 27.1750, lng = 78.0422, 
                 popup="Destination")
    
    })
    my_map
  })
})
