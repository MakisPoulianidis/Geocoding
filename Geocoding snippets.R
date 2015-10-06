

https://maps.googleapis.com/maps/api/geocode/output?parameters

https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=API_KEY



query.url<-"https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key="



library(leaflet)
library(jsonlite)

address.input<-"sportlaan 11 almere"
address<-gsub(" ","+",address.input)
base.url<-"https://maps.googleapis.com/maps/api/geocode/json?address="

query.url<-"https://maps.googleapis.com/maps/api/geocode/json?address=Sportlaan+11+ALmere&key="

query.url1<-"https://maps.googleapis.com/maps/api/geocode/json?address=Sportlaan+11+ALmere&key="
query.url<-"https://maps.googleapis.com/maps/api/geocode/json?address=Sportlaan+11+ALmere&key="



API_KEY<-"AIzaSyCTdLKzG4PyQXXs1uGpaHvONcmArg_6hjs"

qry<-fromJSON(paste0(base.url,address,"&key=",API_KEY))
lat<-qry$results$geometry$location$lat
lng<-qry$results$geometry$location$lng
formatted.address<-qry$results$formatted_address

m <- leaflet()
m <- addTiles(m)
m <- addMarkers(m, lng= lng, lat= lat, popup=formatted.address)