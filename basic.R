library(shiny)
library(shinydashboard)
# Define UI for application that draws a histogram
ui <- dashboardPage(
  dashboardHeader(title = "Basic Dashboard"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard",
        tabName = "dashboard",
        icon = icon("dashboard")
      ),
      menuItem("Widgets",
        tabName = "widgets",
        icon = icon("th")
      )
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(
        tabName = "dashboard",
        fluidRow(
          box(plotOutput("plot1", height = 250)),
          box(
            title = "Controls",
            sliderInput("slider", "Number of observations:", 1, 100, 50)
          )
        )
      ),
      tabItem(tabName = "widgets",
              h2("Widgets tab content"))
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  set.seed(122)
  histdata <- rnorm(500)

  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
}

# Run the application
shinyApp(ui = ui, server = server)
