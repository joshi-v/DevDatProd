#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Plot location on world map"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(position="left",
    sidebarPanel(
      numericInput('latitude', 'Latitude', value = 27.1750, min = -90, max = 90),
      br(), 
      numericInput('longitude', 'Longitude', value = 78.0422, min = -180, max = 180), 
      br(), 
      actionButton ("plotButton", "plot"),
      p ("Click to update")
      ),
    # Show a plot of the generated distribution
    mainPanel (
      textOutput("TMdist"),
      br(),
      leafletOutput("plot1")
    )
  )
))