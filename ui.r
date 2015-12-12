library(car)
library(markdown)
sData <- Salaries
names(sData) <- c('Rank', 'Discipline', 'YearsPhd', 'YearsService', 'Gender', 'Salary')

shinyUI(navbarPage("Regression Tutorial",
  tabPanel("Data Set",
    sidebarLayout(
      sidebarPanel(
          includeMarkdown("01_DataSet.md"),
        width = 8
       )
      ,
      mainPanel(
        #plotOutput("plot")
      )
    )
  ),
  tabPanel("Data Plots",
           sidebarLayout(
               sidebarPanel(
                   includeMarkdown("02_DataPlot.md"),
                   selectInput("plotXVar", "Select Explanatory Variable",
                               #choices=colnames(sData)),
                        choices=colnames(sData[,!(colnames(sData) == "Salary")])),
                   
                   #hr()
                   #helpText("Select an explanatory variable")
                   uiOutput("DS_ui"),
                   width = 6
               ),
               mainPanel(
                   imageOutput("dataPlotInfo"),
                   imageOutput("dataPlotInfo2"),
                   #plotOutput("plot2_XY"),
                   #plotOutput("plot2_Hist"),
                   width = 6
               )
           )),
   tabPanel("Simp Reg",
            sidebarLayout(
                sidebarPanel(
                    #includeMarkdown("02_DataPlot.md"),
                    selectInput("sr_plotXVar", "Select Explanatory Variable",
                                #choices=colnames(sData[,!(colnames(sData) == "Salary")])),
                   
                    choices=colnames(sData[,!(colnames(sData) == "Salary")])),
                #paste("01_", input$plotXVar, ".md", sep="")
                    
                    #hr()
                    #helpText("Select an explanatory variable")
                    #uiOutput("DS_ui"),
                    width = 3
                ),
                mainPanel(
                    imageOutput("summaryInfo"),
                    #verbatimTextOutput("SimpReg"),
                    #renderPrint("SimpReg"),
                    width = 8
                )
            )
   )       
  )
  )