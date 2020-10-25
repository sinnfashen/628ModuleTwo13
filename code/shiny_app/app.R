library(shiny)

ui <- fluidPage(
  titlePanel("Body Fat Calculator"),
  
  fluidRow(
    column(3, 
           wellPanel(
             h3("With Density"),
             h5("If you have data of your density determined from underwater weighing, this will provide a much accurate result."),
             numericInput("density", label = h3("Density (gm/cm^3)"), value = 1),
             actionButton("calculate1", label = "calculate")
           ),
           wellPanel(
             h4("Without Density"),
             numericInput("abdomen", label = h3("Abdomen (cm)"), value = 0),
             numericInput("weight", label = h3("Weight (lbs)"), value = 0),
             numericInput("wrist", label = h3("Wrist (cm)"), value = 0),
             actionButton("calculate2", label= "calculate")
           )
    ),
    column(9,
           wellPanel(
             textOutput("result_text")
           ),
           p(em("Developed by"),br("Hanlin Tang (htang79@wisc.edu)"),style="text-align:center; font-family: times")
    )
  )
)

server <- function(input, output) {
  
  solve_by_density = function() {
    if (is.null(input$density)){
      "Please enter your density, or use the other calculate panel."
    }
    if (input$density <= 0){
      "Density shall not be negative. (Reminder: density of human is usually close to 1)."
    }
    body_fat = 495/input$density - 450
    if (body_fat < 0 || body_fat > 100){
      paste("Data doesn't seem to fall into a reasonable range. The output would be: ", body_fat, "%")
    }else{
      paste("Your body fat rate is:", body_fat, "%")
    }
    
  }
  
  solve_by_other = function() {
    body_fat = -47.93+1.164*input$abdomen-1.433*input$wrist+0.06032*input$weight-0.001518*input$weight*input$abdomen
    if (body_fat < 0 || body_fat > 100){
      paste("Data doesn't seem to fall into a reasonable range. The output would be: ", body_fat, "%")
    }else{
      paste("Your body fat rate is:", body_fat, "%")
    }
  }
  
  observeEvent(input$calculate1, {
    text_reactive$text <- solve_by_density()
  })
  
  observeEvent(input$calculate2, {
    text_reactive$text <- solve_by_other()
  })
  
  text_reactive <- reactiveValues(
    text = "No data has been submitted yet."
  )
  
  output$result_text <- renderText({
    text_reactive$text
  })
  #  observeEvent(input$calculate1, solve_by_density())
  
  # ans = density_function()
}

shinyApp(ui = ui, server = server)