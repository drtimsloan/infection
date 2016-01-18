
# Infection prediction function - user interface code
# Tim Sloan 18-01-16

library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Infection prediction"),
  
  # Sidebar with slider input for pathogens, radiobuttons for time interval
  # and drop down menu for immune system strength
  sidebarPanel(
    sliderInput("pathogens",
                "Percentage of pathogenic bacteria:",
                min = 0,
                max = 100,
                value = 50),
    radioButtons("time", label="Prediction interval",
                choices=list("1 day"=24, "2 days"=48,"3 days"=72),
                             selected=48),
    selectInput("imm", label="Immune system strength",
                choices=list("High"=2, "Moderate"=1,"Low"=0.5),
                selected=1),
    
    # Display proportion of commensal bacteria based on 100 - slider input
    textOutput("commensal")
  ),
  
  # Display growth curve plot
  mainPanel(
    plotOutput("growthPlot")
  )
))
