#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(e1071)
library(vcd)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  
          nbModel <- naiveBayes(Survived ~ ., data = Titanic)
  
          nbModelPred <- reactive({
          classInput <- input$class
          ageInput <- input$age
          sexInput <- input$sex
          if (classInput == "Crew" & ageInput == "Child") {
                  nbTrap1 <- "not possible as the crew did not have any child passengers"
          } else {
          survivalPred <- predict(nbModel, newdata = data.frame(Class = classInput, Sex = sexInput, Age = ageInput),type = "raw")
          survivalPred <- round((survivalPred[1,2]*100),0)
          }
        })
          
          output$nbPred <- renderText(nbModelPred())
          output$oClass <- renderText(input$class)
          output$oGender <- renderText(input$sex)
          output$oAge <- renderText(input$age)
          
          output$classMosaic <- renderPlot({
                  if(input$showClassMosaic) {
                          classStruct <- structable(~Class + Survived, data = Titanic)
                          mosaic(classStruct, shade = TRUE, legend = FALSE, main = "Survived by Class", labeling = labeling_values)
                  }
          })
        
          
          output$genderMosaic <- renderPlot({
                  if(input$showGenderMosaic) {
                          genderStruct <- structable(~Sex + Survived, data = Titanic)
                          mosaic(genderStruct, shade = TRUE, legend = FALSE, main = "Survived by Gender", labeling = labeling_values)
                  }
          })
          
          output$ageMosaic <- renderPlot({
                  if(input$showAgeMosaic) {
                          ageStruct <- structable(~Age + Survived, data = Titanic)
                          mosaic(ageStruct, shade = TRUE, legend = FALSE, main = "Survived by Age", labeling = labeling_values)
                  }
          })
  
  
})
