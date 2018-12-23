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
shinyUI(fluidPage(theme = "bootstrap.css",
  
  # Application title
  titlePanel("Titanic Survivability Predictor"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
            tags$img(src="images/titanic.jpeg", width = "100%"),
            h4("Survival Predictor"),
            selectInput("class", "Passenger Class", c("1st","2nd","3rd","Crew")),
            selectInput("sex", "Sex", c("Male","Female")),
            selectInput("age", "Age", c("Adult","Child")),
            
            h4("Advanced"),
            checkboxInput("showClassMosaic", "Show Class Mosaic", value = TRUE),
            checkboxInput("showAgeMosaic", "Show Age Mosaic", value = TRUE),
            checkboxInput("showGenderMosaic", "Show Gender Mosaic", value = FALSE)
            ),
  
    # Show a plot of the generated distribution
    mainPanel(tabsetPanel(type = "tabs",
                        tabPanel("Instructions", br(), h3("Introduction"), 
                                 p("The Titanic dataset provided survival information about 2201 passengers on the fatal maiden voyage of the ocean liner, 
                                   summarized according to economic status (class), gender and age."),
                                 p("Naive Bayes methods are a set of supervised learning algorithms based on applying Bayes’ theorem with the
                                    “naive” assumption of conditional independence between each set of features."),
                                 p("So in this case we have three calculations for survival of passengers by each of the three feature class, sex and age.
                                    A naive bayes model has been built using these three independent tables and allows us to calculate the chance of 
                                    survival using a combination of all three factors."),
                                 
                                 h3("Usage"),
                                 p("The information from the model can be used by you the user to predict the chances of survivability."),
                                 p("Simply select the type of passenger you would like to calulcate the survival probability for using the dropdown
                                   options.  As you change any of these three options the chance of survival will be updated automatically, 
                                   under the tab labelled Survival Predictability"),
                                 
                                 h3 ("Advanced"),
                                 p("Under the advanced menu you can view survival plots of the three categories of raw data used in this project."),
                                 p("Use the checkbox options under the Advanced heading in the side bar to select/deselect each mosaic plot"),
                                 
                                 h3("References"),
                                 p("The titanic dataset was taken from the built-in R datasets package"),
                                 p("The image used in the sidebar was created by Pierre Brignaud. It won third place out of 200 submissions to 
                                   the visual arts contest for the Montreal-based Just for Laughs comedy festival.")),
                        
                        tabPanel("Survival Predictability", br(), h3("Survival Predictability"),
                                        p("Survival Percentage for a",
                                          textOutput("oAge", inline = TRUE) ,
                                          " ",
                                          textOutput("oGender", inline = TRUE) ,
                                         "in" ,
                                         textOutput("oClass", inline = TRUE) ,
                                        "class is",
                                        textOutput("nbPred", inline = TRUE))
                                 ),
                                 
                        tabPanel("Advanced", br(),
                                plotOutput("classMosaic"),
                                plotOutput("ageMosaic"),
                                plotOutput("genderMosaic")
                                )
    )
  )
)
))
