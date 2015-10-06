library(shiny)

shinyUI(pageWithSidebar(
        headerPanel("Example plot"),
        sidebarPanel(
                textInput("address", label = h6("Text input"), value = "wisselwerking 32 diemen") ,
                actionButton("goButton", "Go!")
                            
                            
         ),
        mainPanel(
                tabsetPanel(
                                tabPanel("Plot", verbatimTextOutput('input.address'),
                                 verbatimTextOutput('address'),
                                 verbatimTextOutput('qry'),
                                 verbatimTextOutput('latitude'),
                                 verbatimTextOutput('lng'),
                                 verbatimTextOutput('formatted.address')
                                ),
                                tabPanel("Summary", verbatimTextOutput("summary")),
                                tabPanel("Table", tableOutput("table"))
                        )
                
                
                )
        
))

