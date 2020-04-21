
#Install packages 

install.packages("easypackages")
library(easypackages)

packages("dplyr", "ggplot2","lubridate", "tidyr", "readr", "tibble", "data.table")
libraries("dplyr", "ggplot2","lubridate", "tidyr", "readr", "tibble", "data.table")

# Load Power Data

hud <- read.csv2(file = "household_power_consumption.txt", na.strings = " ? ", header = T, sep = ";", dec = ".", stringsAsFactors = FALSE)
hud$Date <- as.Date(hud$Date, format = "%d/%m/%Y")

#Take data from 2/1 -- 2/2 

date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")
subdate3 <- hud[hud$Date %in% c(date1, date2),]
subdate3$Date <- strptime(paste(subdate3$Date, subdate3$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")


# Modify necessary data

GAP <- as.numeric(subdate3$Global_active_power)
sub1 <- as.numeric(subdate3$Sub_metering_1)
sub2 <- as.numeric(subdate3$Sub_metering_2)
sub3 <- as.numeric(subdate3$Sub_metering_3)

#Make plot

png("PLOTx3.png", width = 480, height = 480)
  plot(subdate3$Date, sub1, type = "l", col = "black", xlab = " ",  ylab = "Energy Sub Metering")
  lines(subdate3$Date, subdate3$Sub_metering_2, type = "l", col = "red")
  lines(subdate3$Date, subdate3$Sub_metering_3, type = "l", col = "blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=3, col=c("black", "red", "blue"))
dev.off()