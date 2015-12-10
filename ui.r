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
                   width = 6
               )
           )
  ),
  tabPanel("3d tab",
           sidebarLayout(
               sidebarPanel(
                   #includeMarkdown("file2.md"),
                   radioButtons("plotType", "Plot type",
                                c("Scatter"="p", "Line"="l")
                   )
               ),
               mainPanel(
                   plotOutput("plot3")
               )
           )
  ),
  tabPanel("4th tab",
           sidebarLayout(
               sidebarPanel(
                   #includeMarkdown("file2.md"),
                   radioButtons("plotType", "Plot type",
                                c("Scatter"="p", "Line"="l")
                   )
               ),
               mainPanel(
                   plotOutput("plot4")
               )
           )
  ),
  tabPanel("5th tab",
           sidebarLayout(
               sidebarPanel(
                   #includeMarkdown("file2.md"),
                   radioButtons("plotType", "Plot type",
                                c("Scatter"="p", "Line"="l")
                   )
               ),
               mainPanel(
                   plotOutput("plot5")
               )
           )
  )
  
  
  
  
  
  ))