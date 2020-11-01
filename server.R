library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  values <- reactiveValues()
  
  observe({
    input$CalcCalories
    values$calories <- isolate({
      input$fat_weight * 9.0 + input$protein_weight*4.0 + input$carb_weight*4.0})
    values$imc<-isolate({input$your_weight/input$your_height^2
  })})
  
  # Display in right panel of frontend
  output$current_fats <- renderText({
    input$CalcCalories
    paste("Fats Intake (gms): ", isolate(input$fat_weight))
  })
  
  output$current_protein <- renderText({
    input$CalcCalories
    paste("Protein Intake (gms): ", isolate(input$protein_weight))
  })
  
  output$current_carbs <- renderText({
    input$CalcCalories
    paste("Carbs Intake (gms): ", isolate(input$carb_weight))
  })
  
  
  # Display your BMI
  
  output$cc_result <- renderText({
    if(input$CalcCalories == 0) ""
    else
      paste("Your total calories count is: ", values$calories)
  })
  output$imc_result <- renderText({
    if(input$CalcCalories == 0) ""
    else
      paste("Your total BMI count is: ", values$imc)
  })

  
})