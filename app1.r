library(shiny)
library(shinydashboard)
library(dplyr)

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Home", tabName = "Home"),
    menuItem("Race", tabName = "Race"),
    menuItem("Gender", tabName = "Gender"),
    menuItem("COVID-19", tabName = "Education")
  )
)


useboxheight <- Sys.getenv("USE_BOX_HEIGHT")
if (tolower(useboxheight) == "true") {
  row1height <- 300
  row2height <- 240
  row3height <- 110
} else {
  row1height <- row2height <- row3height <- NULL
}

body <- dashboardBody(
  fluidRow(
    box(
      title = "Box title",
      status = "primary",
      plotOutput("plot1", height = 240),
      height = row1height,
      textOutput("test")
    ),
    box(
      status = "warning",
      plotOutput("plot2", height = 240),
      height = row1height
    )
  )
)

body <- dashboardBody(
  tabItems(
    tabItem(tabName = "Home",
            h2("Introduction"),
            p("
              
              Lack of education is a problem people face across the world, and it can become correlated with other societal issues such as gender, economic, and race inequality. Inadequate educational attainment can leave individuals with minimal options when it comes to working and can increase discrimination. While the lack of education is more significant in other countries, we chose to focus on researching the US as we are curious about the systemic challenges inadequate educational attainment brings creates within our community.  "),
    ),
    tabItem(tabName = "Race",
            h2("Race and Educational Attainment"),
            plotOutput("plot2")
    ),
  
    tabItem(tabName = "Gender",
            h2("Gender and Educational Attainment"),
            plotOutput("plot1")
    ),
    
    tabItem(tabName = "Education",
            h2("COVID-19 and Educational Attainment"),
            #textOutput(outputId = "test"),
            plotOutput("plot3")
    )
  )
)
ui <- dashboardPage(
  dashboardHeader(title = "Row layout"),
  dashboardSidebar(),
  body
)

server <- function(input, output) {
  output$test <- renderText({return("TEST")})
  
  set.seed(122)
  histdata <- rnorm(500)
  
  output$plot1 <- renderPlot({
    
    geeks <- c(3807, 1998)
    labels <- c("Male", "Female")
    
    piepercent<- round(100 * geeks / sum(geeks), 1)
    
    pie(geeks, labels = piepercent,
        main = "No High School Diploma", col = rainbow(length(geeks)))
    
    legend("topleft", c("Male", "Female"),
           cex = 0.5, fill = rainbow(length(geeks)))
    
  })
  
  output$plot2 <- renderPlot({
    colors = c("green", "orange", "brown")
    race <- c("Hispanic", "Non-Hispanic")
    education <- c("High-School", "Associate", "Bachelors")
    
    Values <- matrix(c(7553, 5348, 1007, 1520, 998, 1306),
                     nrow = 3, ncol = 2, byrow = TRUE)
    
    barplot(Values, main = "COVID-19 Deaths by Race and Educational Attainment", names.arg = race,
            xlab = "Race", ylab = "COVID-19 Death Rate", col = colors)
    
    legend("topleft", education, cex = 0.7, fill = colors)
    
    
    
    
  })
  
  output$plot3 <- renderPlot({
    A <- c(599, 7716, 8770)
    
    barchart <- barplot(A, xlab = "Elementary, Middle, High School", ylab = "Students of Hispanic Origin",
                        col = "green", main ="Level of Educational Attainment for US Students of Hispanic Origin in 1995")
    
  })
  
  output$plot4 <- renderPlot({
    colors = c("green", "orange", "brown")
    race <- c("Hispanic", "Non-Hispanic")
    education <- c("High-School", "Associate", "Bachelors")
    
    Values <- matrix(c(7553, 5348, 1007, 1520, 998, 1306),
                     nrow = 3, ncol = 2, byrow = TRUE)
    
    barplot(Values, main = "COVID-19 Deaths by Race and Educational Attainment", names.arg = race,
            xlab = "Race", ylab = "COVID-19 Death Rate", col = colors)
    
    legend("topleft", education, cex = 0.7, fill = colors)
    
  })
  
  
}

shinyApp(
  ui = dashboardPage(
    dashboardHeader(
      title = "The Intersection of Race, Gender, and Educational Attainment" ,
      titleWidth = 600
    ),
    sidebar,
    body
  ),
  server = server
)