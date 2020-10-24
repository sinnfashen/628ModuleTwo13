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
             numericInput("thigh", label = h3("thigh (cm)"), value = 0),
             numericInput("wrist", label = h3("Wrist (cm)"), value = 0),
             numericInput("hip", label = h3("hip (cm)"), value = 0),
             actionButton("calculate2", label= "calculate")
           )
    ),
    column(9,
           wellPanel(
             textOutput("result_text")
           )
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
    if (body_fat <= 0){
      paste("Data doesn't seem to fall into a reasonable range. The output would be negative: ", body_fat)
    }else{
      paste("Your body fat rate is:", body_fat)
    }
    
  }
  
  solve_by_other = function() {
    body_fat = -82.937737 + 0.84*input$abdomen + -1.95*input$wrist + 1.43*input$thigh + 0.55*input$hip - 0.0134*input$thigh*input$hip
    if (body_fat <= 0){
      paste("Data doesn't seem to fall into a reasonable range. The output would be negative: ", body_fat)
    }else{
      paste("Your body fat rate is:", body_fat)
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