library(shiny)

shinyServer(function(input, output) {
  data <- reactive({
         x <- df1
       })
    
       output$mymap <- renderLeaflet({
         df1 <- data()
    
         m <- leaflet(data = df1) %>%
           addTiles() %>%
           addMarkers(lng = ~LONGITUDE,
                      lat = ~LATITUDE)
         m



  # #####################
  # output$mymap <- renderLeaflet({
  #   m <- leaflet() %>%
  #     addTiles() %>%
  #     setView(lng = -73.935242,
  #             lat = 40.730610 ,
  #             zoom = 10)
  #   m
  #   
  })

       
       collisionsdata <-df[sample(nrow(df), 1000),]
       output$mytable1<-DT::renderDataTable({
         DT::datatable(collisionsdata[, input$show_vars, drop=FALSE])
         
       })
       
})


# 
# server <- function(input,output, session){
#   
#   data <- reactive({
#     x <- df
#   })
#   
#   output$mymap <- renderLeaflet({
#     df <- data()
#     
#     m <- leaflet(data = df) %>%
#       addTiles() %>%
#       addMarkers(lng = ~Longitude,
#                  lat = ~Latitude,
#                  popup = paste("Offense", df$Offense, "<br>",
#                                "Year:", df$CompStat.Year))
#     m
#   })














# #
# # This is the server logic of a Shiny web application. You can run the
# # application by clicking 'Run App' above.
# #
# # Find out more about building applications with Shiny here:
# #
# #    http://shiny.rstudio.com/
# #
# 
# library(shiny)
# 
# # Define server logic required to draw a histogram
# shinyServer(function(input, output) {
#   output$distPlot <- renderPlot({
#     # generate bins based on input$bins from ui.R
#     x    <- faithful[, 2]
#     bins <- seq(min(x), max(x), length.out = input$bins + 1)
#     
#     # draw the histogram with the specified number of bins
#     hist(x,
#          breaks = bins,
#          col = 'darkgray',
#          border = 'white')
#     
#   })
#   
# })

