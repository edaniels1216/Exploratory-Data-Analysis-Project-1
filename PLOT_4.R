

# Plots identified clockwise from L to R
#         x       y
# P1 = datetime v GAP
# P2 = datetime v. Voltage
# P3 = datetime v. GAP
# P4 = datetime v. Energy Sub Metering 

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
datetime <- subdate3$Date <- strptime(paste(subdate3$Date, subdate3$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")

# Modify necessary data

GAP <- as.numeric(subdate3$Global_active_power)
GRP <- as.numeric(subdate3$Global_reactive_power)
sub1 <- as.numeric(subdate3$Sub_metering_1)
sub2 <- as.numeric(subdate3$Sub_metering_2)
sub3 <- as.numeric(subdate3$Sub_metering_3)
volt <- as.numeric(subdate3$Voltage)

#Make plot
png("PLOTx4.png", width = 480, height = 480)

par(mfrow = c(2,2))

#P1
plot(subdate3$Date, GAP, col = "black", xlab = " ",  ylab = "Global Active Power (kW)", type = "l")

#P2
plot(subdate3$Date, volt, type = "l", col = "black", xlab = " datetime ",  ylab = "Voltage")

#P3
plot(subdate3$Date, sub1, type = "l", col = "black", xlab = " ",  ylab = "Energy Sub Metering")
lines(subdate3$Date, subdate3$Sub_metering_2, type = "l", col = "red")
lines(subdate3$Date, subdate3$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=3, bty = "n", col=c("black", "red", "blue"))

#P4
plot(subdate3$Date, GRP, type = "l", col = "black", xlab = " datetime ",  ylab = "Global Reactive Power")

dev.off()










