
# This is the user-interface definition of a Shiny web application.
# Calculate BMI and give hint

library(shiny)

shinyUI(fluidPage(
  
  #Application title
  titlePanel("Calculate Your BMI"),
  
  #enter height and weight
  sidebarPanel(
          
    sliderInput("height",
                "Your height(cm):",
                min = 0,
                max = 250,
                value = 180),
    
    numericInput("weight",
                 "Your weight(kg)",
                 min=0,
                 value=70,
                 step=0.5),
    
    
    checkboxInput("info",
                  "I only need the BMI value, not your hint!")
    
  ),
  
  
  
  #show the infromation, after you press submit
  mainPanel(
    p("You can calculate your BMI throught this littel easy App."),
    p("Just choose your height and weight."),
    p("The checkbox is responsible for the reactive part. The hint could hurt your feeling, so if you don't want it, just use the checkbox."),
    br(),
    p("Here is what you get:"),
    em(textOutput("BMIinfo"),style="color:red")
  )
))
