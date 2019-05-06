#ui.R


library(shinydashboard)
library(DT)

shinyUI(dashboardPage(
  dashboardHeader(title = "NYC Collisions"),
  dashboardSidebar(
    sidebarUserPanel("Menu"),
    sidebarMenu(
      menuItem("Map",
               tabName = "Map",
               icon = icon("map-marker-alt")),
      menuItem(
        "Accidents",
        tabName = "cars",
        icon = icon("car-crash")
      ),
      menuItem("Data", tabName = "data", icon = icon("road"))
    ),
    selectInput("borough", "Choose a borough:",
  list('Brooklyn', 'Bronx', 'Manhattan', 'Queens')
  ),
  textOutput("result")
),
  dashboardBody(tags$head(tags$style(
    HTML(
      '
      /* logo */
      .skin-blue .main-header .logo {
      background-color: rgb(255,255,255); color:        rgb(0,144,197);
      font-weight: bold;font-size: 24px;text-align: Right;
      }
      
      /* logo when hovered */
      .skin-blue .main-header .logo:hover {
      background-color: rgb(255,255,255);
      }
      
      
      /* navbar (rest of the header) */
      .skin-blue .main-header .navbar {
      background-color: rgb(255,255,255);
      }
      
      /* main sidebar */
      .skin-blue .main-sidebar {
      background-color: rgb(7, 7, 7);;
      }
      
      
      /* active selected tab in the sidebarmenu */
      .skin-blue .main-sidebar .sidebar .sidebar-menu .active a{
      background-color: #696969);
      color: rgb(86, 136, 183);font-weight: bold;font-size: 18px;
      }
      
      
      
      /* other links in the sidebarmenu */
      .skin-blue .main-sidebar .sidebar .sidebar-menu a{
      background-color: rgb(44, 48, 48);
      color: rgb(255,255,255);font-weight: bold;
      }
      
      /* other links in the sidebarmenu when hovered */
      .skin-blue .main-sidebar .sidebar .sidebar-menu a:hover{
      background-color: rgb(232,245,251);color: rgb(0,144,197);font-weight: bold;
      }
      
      /* toggle button color  */
      .skin-blue .main-header .navbar .sidebar-toggle{
      background-color: rgb(255,255,255);color:rgb(0,144,197);
      }
      
      /* toggle button when hovered  */
      .skin-blue .main-header .navbar .sidebar-toggle:hover{
      background-color: rgb(0,144,197);color:rgb(0,0,0);
      }
      '
    )
  )),
  tabItems(    tabItem(tabName = "data",
                       'to be replaced with a datatable'),
    tabItem(tabName = "Map",
            leafletOutput("mymap",height = 1000),
    tabItem(tabName = "cars","to be replaced with map and something"),
            fluidRow(
              infoBoxOutput("maxBox"),
              infoBoxOutput("minBox"),
              infoBoxOutput("avgBox")
            ),
            fluidRow(box(htmlOutput("map"), height = 300),
                     box(htmlOutput("hist"), height = 300))
          )
  ))
  
  ))

