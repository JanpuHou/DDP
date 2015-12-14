shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Fuel Economy (Miles Per Gallon) Estimator"),
    
    sidebarPanel(
      numericInput('cyl', 'Number of Cylinders', 6, min = 4, max = 8, step = 2),
      checkboxGroupInput("am","Transmission Type (check one only)",c("Manual"= 1,"Automatic"=0),selected = 1),
      sliderInput("wt", label = "Car Weight (in lbs)",
                   min = 1520, max = 5420, value = 3000,step=10),
      sliderInput("qsec", label = "Quarter Mile (402 m) Time (in Seconds)",
                   min = 14.5, max = 22.9, value = 18.0,step=0.1),
      
      submitButton('Get MPG Prediction')
    ),
    mainPanel(
      h5("Ever wondered what you car's gas mileage is? This simple calculator will do it quickly."),
      h5('If you enter the number of cylinders, transmission types, car weight, and time need to reach quarter miles, it will estimate the Miles per Gallon your car can run and compared the performance with 32 other automobiles'),
      
      h4('Car Weight in lbs'),
      verbatimTextOutput("inputValue1"),
      h4('Car Acceleration to Quarter Mile in seconds'),
      verbatimTextOutput("inputValue2"),
          h3("Prediction of MPG"),
      verbatimTextOutput("prediction"),
      h5("Red Solid Line = Your MPG",style="color:red"),
      h5("Blue Dotted Line = Average MPG",style="color:blue"),
      plotOutput("distPlot")
    )
  )
)