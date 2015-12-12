library(car)
sData <- Salaries
names(sData) <- c('Rank', 'Discipline', 'YearsPhd', 'YearsService', 'Gender', 'Salary')

shinyServer(function(input, output, session) {

    output$summaryInfo <- renderImage({
            # When input$n is 1, filename is ./images/image1.jpeg
          #  filename <- normalizePath(file.path('.',
          #                            paste('R_Summary.jpeg', sep='')))
            #myfilename <- paste('simpR_', input$plotXVar, '.jpg', sep='')
        
        switch(input$sr_plotXVar,
               "Rank" = myfilename <- 'simpR_Rank.jpg',
               "Discipline" = myfilename <- 'simpR_Discipline.jpg',
               "YearsPhd" = myfilename <- 'simpR_YearsPhd.jpg',
               "YearsService" = myfilename <- 'simpR_YearsService.jpg',
               "Gender" = simpReg <- myfilename <- 'simpR_Gender.jpg'
        )
        

            # Return a list containing the filename
            list(src = myfilename)
          }, deleteFile = FALSE)
        
    output$summaryInfo22 <- renderImage({
        # A temp file to save the output.
        # This file will be removed later by renderImage
        outfile <- tempfile(fileext='.png')
        
        xVar <- getIndex(input$plotXVar)
        yVar <- getIndex("Salary")
        
        # Generate the PNG
        png(outfile, width=400, height=300)
        summary(lm(sData$Salary ~ sData$YearsService, data=sData))
        #hist(rnorm(input$obs), main="Generated in renderImage()")
        #plot(sData[,xVar], sData[,yVar], xlab=input$plotXVar, ylab="Salary")
        #if (class(sData[,xVar]) == "integer") {
        #    hist(sData[,xVar], xlab=input$plotXVar)
        #}
        
        dev.off()
        
        # Return a list containing the filename
        list(src = outfile,
             contentType = 'image/png',
             width = 400,
             height = 300,
             alt = "This is alternate text")
    }, deleteFile = TRUE)
    
    output$dataPlotInfo <- renderImage({
        # A temp file to save the output.
        # This file will be removed later by renderImage
        outfile <- tempfile(fileext='.png')
        
        xVar <- getIndex(input$plotXVar)
        yVar <- getIndex("Salary")
        
        # Generate the PNG
        png(outfile, width=400, height=300)
        #hist(rnorm(input$obs), main="Generated in renderImage()")
        plot(sData[,xVar], sData[,yVar], xlab=input$plotXVar, ylab="Salary")
        #if (class(sData[,xVar]) == "integer") {
        #    hist(sData[,xVar], xlab=input$plotXVar)
        #}
        
        dev.off()
        
        # Return a list containing the filename
        list(src = outfile,
             contentType = 'image/png',
             width = 400,
             height = 300,
             alt = "This is alternate text")
    }, deleteFile = TRUE)

    output$dataPlotInfo2 <- renderImage({
        # A temp file to save the output.
        # This file will be removed later by renderImage
        outfile <- tempfile(fileext='.png')

        xVar <- getIndex(input$plotXVar)
        yVar <- getIndex("Salary")
        
        # Generate the PNG
        png(outfile, width=400, height=300)
        #hist(rnorm(input$obs), main="Generated in renderImage()")
        #plot(sData[,xVar], sData[,yVar], xlab=input$plotXVar, ylab="Salary")
        if (class(sData[,xVar]) == "integer") {
            hist(sData[,xVar], xlab=input$plotXVar)
        }
        
        dev.off()
        
        # Return a list containing the filename
        list(src = outfile,
             contentType = 'image/png',
             width = 400,
             height = 300,
             alt = "This is alternate text")
    }, deleteFile = TRUE)
    
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
    
    output$DS_ui <- renderUI({
        if (is.null(input$plotXVar))
            return()
        
        # Depending on input$input_type, we'll generate a different
        # UI component and send it to the client.
        switch(input$plotXVar,
               "Rank" = includeMarkdown("01_rank.md")
#         filename <- reactive ({
#             paste("01_", input$plotXVar, ".md", sep="")
#         })
#         includeMarkdown(filename)
               
        )
    })
    
  output$plot2_XY <- renderPlot({
      
      #xVar <- Salaries$rank
      #yVar <- Salaries$salary
      xVar <- getIndex(input$plotXVar)
      yVar <- getIndex("Salary")
      plot(sData[,xVar], sData[,yVar], xlab=input$plotXVar, ylab="Salary")
      
      #plot(input$plotXVar, Salaries$salary) 
      #type=input$plotType)
  })
  
  output$plot2_Hist <- renderPlot({
      
      xVar <- getIndex(input$plotXVar)
      yVar <- getIndex("Salary")
      if (class(sData[,xVar]) == "integer") {
          hist(sData[,xVar], xlab=input$plotXVar)
      }

  }) 
  
  output$SimpReg <- renderPrint({
      
      simpReg <- 0
      switch(input$sr_plotXVar,
             "Rank" = simpReg <- lm(Salary ~ Rank, data=sData),
             "Discipline" = simpReg <- lm(Salary ~ Discipline, data=sData),
             "YearsPhd" = simpReg <- lm(Salary ~ YearsPhd, data=sData),
             "YearsService" = simpReg <- lm(Salary ~ YearsService, data=sData),
             "Rank" = simpReg <- lm(Salary ~ Rank, data=sData)
      )
             
      #xVar <- getIndex(input$sr_plotXVar)
      #yVar <- getIndex("Salary")
      #simpreg <- lm(sData[,yVar] ~ sData[,xVar], data=sData)
      #simpreg <- lm(Salary ~ YearsService, data=sData)

      
      summary(simpReg)
    
      
  }) 
  
  output$summary <- renderPrint({
    summary(cars)
  })

  output$table <- renderDataTable({
    cars
  }, options=list(pageLength=10))
})