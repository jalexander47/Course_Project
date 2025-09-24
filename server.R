library(shiny)

shinyServer(function(input, output) {
  
  # Reactive filter for iris dataset
  filteredData <- reactive({
    iris[iris$Sepal.Length >= input$sepalLength, ]
  })
  
  # Output scatterplot with empty-data fix
  output$scatterPlot <- renderPlot({
    data <- filteredData()
    
    if (nrow(data) == 0) {
      plot.new()
      text(0.5, 0.5, "No data available for this selection",
           cex = 1.2, col = "red")
    } else {
      plot(data$Sepal.Length, data$Sepal.Width,
           col = data$Species,
           pch = 19,
           xlab = "Sepal Length",
           ylab = "Sepal Width",
           main = "Sepal Length vs Width")
      legend("topright", legend = levels(iris$Species),
             col = 1:3, pch = 19, bty = "n")
    }
  })
  
  # Output table with empty-data fix
  output$dataTable <- renderTable({
    data <- filteredData()
    
    if (nrow(data) == 0) {
      return(data.frame(Message = "No rows match your filter"))
    } else {
      return(head(data, 10))  # Show first 10 rows
    }
  })
  
})
