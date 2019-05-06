library(magrittr)
library(dplyr)
library(ggplot2)
library(viridis)
install.packages('plotly')
library(plotly)
library(maps)
install.packages('rgeos')
library(rgeos)
install.packages('rgdal')
library(rgdal)
library(ggthemes)
library(crosstalk)
library(leaflet)
install.packages('d3heatmap')
library(d3heatmap)
install.packages('rnoaa')
library(rnoaa)
library(DT)
library(dplyr)
getwd()

#loading data
df = read.csv('NYPD_Motor_Vehicle_Collisions.csv', stringsAsFactors = FALSE, na.strings = c("", " ", "NA"))

variables <-
  sapply(names(df), function(x)
    paste0(x, ' is class: ', class(df[[x]])))
variables



#creating a column date.time for time use
df$date.time <- as.Date(df$DATE, format = "%m/%d/%Y")



#using hours and minutes in date.time variable for calculations
df <-
  within(df, {
    date.time = as.POSIXct(strptime(paste(DATE, TIME), "%m/d/%Y %H:%M"))
  })

sample_data <- df1[c(1:500),]
saveRDS(sample_data, "./sample_data.rds")


#deleting extra information 
#rows deleted:
#OFF.STREET.NAME------------------- column 10
#CONTRIBUTING.FACTOR.VEHICLE.3----- column 21
#CONTRIBUTING.FACTOR.VEHICLE.4----- column 22
#CONTRIBUTING.FACTOR.VEHICLE.5----- column 23
#VEHICLE.TYPE.CODE.3--------------- column 27
#VEHICLE.TYPE.CODE.4--------------- column 28
#VEHICLE.TYPE.CODE.5--------------- column 29
df<-df[-10]
df<- df[-(21:23)]
df<-df[-20]
df<-df[-(22:24)]


#taking out rows that still have missign information in the dataset
df<-na.omit(df) 



#map of our variables


class(df$LATITUDE) 

nrow(df)
ncol(df)
 #assigning the value of NA to all the blank cells



