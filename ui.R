#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that illustrates the effect of noise on the signal
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Observe impact of change in Mean & SD of Noise on Linear Model"),
  
  # Sidebar with three sliders: 
  # - the number of points to fit 
  # - the mean of the noise 
  # - the standard deviation of the noise
  sidebarLayout(
    sidebarPanel(
      sliderInput("n",
                  label = HTML("Number of points to use (n):"),
                  min = 0,
                  max = 1000,
                  step = 2,
                  value = 200),
      sliderInput("avg",
                  label = HTML("Mean value of noise (&mu;):"),
                  min = 0,
                  max = 1,
                  step = 0.1,
                  value = 0),
      sliderInput("std",
                  label = HTML("Standard deviation of noise (&sigma;):"),
                  min = 0,
                  max = 3,
                  step = 0.1,
                  value = 0.2),
      # First section
      h3("Objective"),
      p("This is an instructional app which illustrates the effect of noise on a linear model."),
      p("We are using a linear model of noisy measurements to fit the signal:"),
      h3(withMathJax("$$y_i=x_i + \\varepsilon_i \\qquad \\text{for}~i = 1,\\dots,n$$."))
    ),
    
    # Provide instructions and make the plot
    mainPanel(
      # Second section
      h3("Instructions"),
      p("The user chooses the number of points (n) and the mean and standard deviation of the noise (distributed normally):"),
      h3(withMathJax("$$ \\varepsilon_i  = \\mathcal{N}(\\mu, \\sigma) \\qquad \\text{for}~i = 1,\\dots,n$$")),
      
      # Third section
      h3("Results of the linear model"),
      textOutput("text"),
      p("A simple measure of the quality of the fit is the R-squared value, which is shown in the plot title. The closer it is to 1, the better you will be able to predict the signal (and vice-versa for 0). The astute user will notice that changing the mean of the noise just shifts the data in the y-direction."),
      plotOutput("distPlot"),
      
      # Fourth section
      h3("More information"),
      p(a("Slides detailing the project", href="https://mandaliadhaval.github.io/R_Data_Product/")),
      p(a("Github repository", href="https://github.com/mandaliadhaval/R_Data_Product/"))
    )
  )
))