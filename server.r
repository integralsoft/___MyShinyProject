library(car)
sData <- Salaries
names(sData) <- c('Rank', 'Discipline', 'YearsPhd', 'YearsService', 'Gender', 'Salary')

shinyServer(function(input, output, session) {
    

    getIndex = function(colName) {
        idx <-1
        if (colName == "Rank") {
            idx <- 1
        }
        if (colName == "Discipline") {
            idx <- 2
        }
        if (colName == "YearsPhd") {
            idx <- 3
        }
        if (colName == "YearsService") {
            idx <- 4
        }
        if (colName == "Gender") {
            idx <- 5
        }
        if (colName == "Salary") {
            idx <- 6
        }
        return(idx)
    }    
    
  output$plot2_XY <- renderPlot({
      
      #xVar <- Salaries$rank
      #yVar <- Salaries$salary
      xVar <- getIndex(input$plotXVar)
      yVar <- getIndex("Salary")
      plot(sData[,xVar], sData[,yVar])
      
      #plot(input$plotXVar, Salaries$salary) 
      #type=input$plotType)
  })
  
  output$plot2_Hist <- renderPlot({
      
      xVar <- getIndex(input$plotXVar)
      yVar <- getIndex("Salary")
      if (class(sData[,xVar]) == "integer") {
          hist(sData[,xVar])
      }

  }) 
  
  output$summary <- renderPrint({
    summary(cars)
  })

  output$table <- renderDataTable({
    cars
  }, options=list(pageLength=10))
})