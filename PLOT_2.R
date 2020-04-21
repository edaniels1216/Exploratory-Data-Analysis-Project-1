### [1] Install necessary packages ###

install.packages("tibble")
library(tibble)
install.packages("dplyr")
library(dplyr)
install.packages("readr")
library(readr)
install.packages("ggplot2")
library(ggplot2)
install.packages("lubridate")
library(lubridate)
install.packages("data.table")
library(data.table)

### LOAD DATA ### 

options(stringsAsFactors = FALSE)

# Load power consumption data from file

hud <- read.csv2(file = "household_power_consumption.txt", na.strings = " ? ", header = T, sep = ";", dec = ".", stringsAsFactors = FALSE)
hud$Date <- as.Date(hud$Date, format = "%d/%m/%Y")

#Take data from 2/1 -- 2/2 

date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")
subdate3 <- hud[hud$Date %in% c(date1, date2),]
datetime <- subdate3$Date <- strptime(paste(subdate3$Date, subdate3$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")

# Modify necessary data

GAP <- as.numeric(subdate3$Global_active_power)
#typeof(subdate1) #List
#class(subdate1) #Dataframe
#View(subdate1$Global_active_power)
#subdate1$Date <- as.Date(subdate1$Date, format = "%d/%m/%Y")
#subdate1$Time <- as.Date(subdate1$Time, format = "%H:%M:%S")
#x1 <- format(subdate1[1:1440,"Time"],"2007-02-01 %H:%M:%S")
#x2 <- format(subdate1[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
#datatime <- strptime(paste(subdate1$Date, subdate1$Time, sep= " "), format = "%d-%m-%Y %H:%M:%S")
#datatime$Date <- as.POSIXct(datatime$Date)
#View(datatime)
#GAP <- as.numeric(subdate1$Global_active_power)

png(file = "PLOTx2.png", width = 480, height = 480)

plot(x = datetime, y = GAP, main = "Global Active Power v. Time", xlab=" ", ylab = "Global Active Power (kW)", type = "l", xlim =)  

#title()

dev.off()




#PLOT X2


