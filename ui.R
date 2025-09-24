library(shiny)

shinyUI(fluidPage(
  titlePanel("Iris Dataset Explorer"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("sepalLength",
                  "Minimum Sepal Length:",
                  min = min(iris$Sepal.Length),
                  max = max(iris$Sepal.Length),
                  value = min(iris$Sepal.Length),
                  step = 0.1),
      helpText("Use the slider to filter flowers by Sepal Length")
    ),
    
    mainPanel(
      plotOutput("scatterPlot"),
      tableOutput("dataTable")
    )
  )
))
