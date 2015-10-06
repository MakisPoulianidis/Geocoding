library(shiny)
#library(leaflet)
library(jsonlite)
library(stringr)

API_KEY<-"AIzaSyCTdLKzG4PyQXXs1uGpaHvONcmArg_6hjs"
base.url<-"https://maps.googleapis.com/maps/api/geocode/json?address="
post.url<-"&key="

shinyServer(
        function(input, output) {
                
                
                input.address<-eventReactive(input$goButton, { input$address})
                address<-eventReactive(input$goButton, { gsub(" ","+",input$address)})
                
                output$input.address <- renderPrint({ input.address() })
                output$address <- renderPrint({ address() })
                
                qry <- eventReactive(input$goButton, { fromJSON(paste0(base.url,address,post.url,API_KEY))  
              
                })
                output$qry <- renderPrint({ qry() })
                
                latitude<-eventReactive(input$goButton, {qry$results$geometry$location$lat})
                output$latitude <- renderPrint({ latitude() })
                
                #qry <- fromJSON(paste0(base.url,address,post.url,API_KEY))
                #lat<-qry$results$geometry$location$lat
                #lng<-qry$results$geometry$location$lng
                #formatted.address<-qry$results$formatted_address
                #output$lat <- lat
                #output$lng <- lng
                #output$formatted.address <- formatted.address
                
                
                

                
        }
)