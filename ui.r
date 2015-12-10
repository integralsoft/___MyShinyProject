library(car)
library(markdown)
sData <- Salaries
names(sData) <- c('Rank', 'Discipline', 'YearsPhd', 'YearsService', 'Gender', 'Salary')

shinyUI(navbarPage("Regression Tutorial",
  tabPanel("Data Set",
    sidebarLayout(
      sidebarPanel(
          includeMarkdown("01_DataSet.md"),
#         radioButtons("plotType", "Plot type",
#           c("Scatter"="p", "Line"="l")
#         ), 
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
                   width = 6
               ),
               mainPanel(
                   plotOutput("plot2_XY"),
                   plotOutput("plot2_Hist"),
                   width = 6
               )
           )
  )
  ))