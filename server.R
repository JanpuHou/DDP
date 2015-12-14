
fuel_mpg <- function(wt,cyl,am,qsec) 14.928 - 3.643*(wt / 1000)-0.354*cyl+2.467*as.numeric(am)+1.012*qsec
shinyServer(
  function(input, output) {
    output$inputValue1 <- renderPrint({input$wt})
    output$inputValue2 <- renderPrint({input$qsec})
    output$prediction <- renderPrint({fuel_mpg(input$wt,input$cyl,input$am,input$qsec)})
    output$distPlot <- renderPlot({
      mpg_mtcars    <- mtcars$mpg
      hist(mpg_mtcars, breaks = 16, col = 'skyblue', border = 'white')
      abline(v=mean(mpg_mtcars),col="darkblue", lty = 3,lwd=4)
      my_mpg <- fuel_mpg(input$wt,input$cyl,input$am,input$qsec)
      abline(v=my_mpg,col="red", lty = 1,lwd = 3)
      
          })
  }
)

