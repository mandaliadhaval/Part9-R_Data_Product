#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

#
# This is the server definition of a Shiny web application
# that illustrates the effect of noise on a signal.
# 
#    
#


library(shiny)
library(ggplot2)

# Define server logic required to illustrate the effect of the noise on a signal.
shinyServer(function(input, output) {
  
  output$distPlot <- renderPlot({
    
    # Set the seed
    set.seed(101)
    
    # Initialize the data
    x <- seq(0,1,length=input$n)
    noise <- rnorm(input$n, mean = input$avg, sd = input$std)
    y <- x + noise
    
    # put these in a dataframe
    x_name <- "x"
    y_name <- "y"
    df <- data.frame(x,y)
    names(df) <- c(x_name,y_name) 
    
    # Linear regression
    fit <- lm(y ~ x, data = df)
    rsquared <- summary(fit)$r.squared
    
    # Make the plot with the linear model
    p <- ggplot(df, aes(x,y)) +
      geom_point() +
      geom_smooth(method = "lm", se = FALSE)+
      ggtitle(paste("Fit data with linear model, R-squared=", format(rsquared,digits=2))) +
      theme(plot.title = element_text(size=22))
    p
  })
  
})
