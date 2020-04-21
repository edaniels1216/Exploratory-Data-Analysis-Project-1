
### Install necessary packages ###


install.packages("tibble")
library(tibble)typ
install.packages("dplyr")
library(dplyr)
install.packages("readr")
library(readr)
install.packages("ggplot2")
library(ggplot2)
install.packages("dplyr")
library(dplyr)
install.packages("lubridate")
library(lubridate)
install.packages("data.table")
library(data.table)

### LOAD DATA ### 

# Remove Factors 
options(stringsAsFactors = FALSE)

# Load power consumption data from file
xhud <- read.csv2("household_power_consumption.txt")

# Check data
head(xhud, n = 10)
class(xhud$Date)  # "character" class, DD/MM/YYY

# Change Date column from Character to Date class
xhud$Date <- as.Date(xhud$Date, "%d/%m/%Y")

# Check data
class(xhud$Date) # "Date" class, YYYY-MM-DD
head(xhud, n = 10)

### DATA MANIPULATION ###

### Gather information about the data

class(xhud)
# "data.frame"
dim(xhud)
# 2075259       9
colnames(xhud)
# [1] "Date"                  "Time"                  "Global_active_power"   "Global_reactive_power" "Voltage"               "Global_intensity"      "Sub_metering_1"       
# [8] "Sub_metering_2"        "Sub_metering_3" "
summary(xhud)


### Select the date range

date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")
subdate <- hud[hud$Date %in% c(date1, date2),]

class(date1)

#subdate1 <- xhud[xhud$Date %in% c(date1,date2),]

### Subset from selected dates

#subdateq <- subset(xhud, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))


#subdate2 <- xhud[xhud$Date %in% date1:date2, ]

#View(subdate)
# Check data
head(subdate, n = 6)

class(subdate$Date)

class(subdate$Time) 

### PLOTTING THE DATA ###

### Plot 1

# Select column 
GAP <- as.numeric(subdate$Global_active_power)

# Output as png
png("PLOT1.png", width = 480, height = 480)

# Make histogram 
hist(GAP, col = "red", main = "Global Active Power", xlab = "Global Active Power (kW)", ylab = "Frequency (Hz)" )

# Close dev
dev.off()
