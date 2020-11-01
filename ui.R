library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Calories and BMI Calculator"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      helpText("Keeping track of Calories is the first sign of staying healthy. This calculator calculates calories based on grams of fats, protein and carbs provided"),            
      br(),           
      numericInput("fat_weight",label = h4("How many grams of fats?"),min = 0, max = 1000,0), #, value = 70
      br(),
      numericInput("protein_weight",label = h4("How many grams of protein?"),min = 0, max = 1000,0), #, value = 70
      br(),
      numericInput("carb_weight",label = h4("How many grams of carbs?"),min = 0, max = 1000,0), #, value = 70
      br(),
      numericInput("your_weight",label = h4("How many weight in kilograms"),min = 0, max = 1000,0), #, value = 70
      br(),
      numericInput("your_height",label = h4("How many height in meters"),min = 0, max = 1000,0), #, value = 70
      br(),
      actionButton("CalcCalories", label = "Your Calories and BMI intake is")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel
      (
        tabPanel("Calculate the calories consumed and BMI",
                 p(h4("Here are your input values ")),
                 textOutput("current_fats"),
                 br(),
                 textOutput("current_protein"),
                 br(),
                 textOutput("current_carbs"),
                 br(),
                 textOutput("imc"),
                 br(),
                 p(h4("Calculation Results")),
                 textOutput("cc_result"),
                 p(h4("Calculation Results BMI")),
                 textOutput("imc_result")
        ),
        tabPanel(
          "Documentation",
          p(h4("Calories Calculator Application and weight control")),
          br(),
          helpText("This simple application calculates number of calories consumed based on the fats, protein and carb consumption information provided and your BMI"),
          p(h3("Why Calories and BMI calculation is important?")),
          helpText("Keeping track of your daily calories consumption is the first step in healthy diet. 
                   The Body Mass Index (BMI) is a measure of association between a person's weight and height. BMI is used as one of several indicators to assess nutritional status.")
        )
      )
    )
  ))
)