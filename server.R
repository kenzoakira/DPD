
# This is the server logic for a Shiny web application.
# server part of calculating BMI

library(shiny)

shinyServer(function(input, output) {
       
        data<-reactive({
                BMI<-input$weight/((input$height/100)^2)
                return(BMI)
        })
        
        #if checkbox is false, then direct return BMI; else return Information.
        disp.text<-reactive({
                information<-function(value){
                        if(value<=25&&value>=18.5){"Congrats! You are healthy!"}
                        else if(value>25){"Oooh! Sorry! You really need to work out!"}
                        else {"You need to eat more!!!!"}
                        
                }
                if(input$info){return(data())}
                else{return(information(data()))}
        })
        
        output$BMIinfo<-renderText({disp.text()})
  
  
})
