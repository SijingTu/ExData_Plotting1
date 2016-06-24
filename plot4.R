Sys.setenv("LANGUAGE"="En")
Sys.setlocale("LC_ALL","English")
library(sqldf)
setwd("data scientist track/exploratory data analysis")
power_date <- read.csv.sql("household_power_consumption.txt", header = TRUE, sep = ";", 
                           sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'")
datetime <- strptime(paste(power_date$Date, power_date$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S", tz="UTC")
png(filename = "plot4.png",width = 480, height = 480)
par(mfrow = c(2,2))
plot(x=datetime, y=power_date$Global_active_power, type="l",xlab = "", ylab = "Global Active Power")
plot(x=datetime, y=power_date$Voltage, type="l",xlab = "datetime", ylab = "Voltage")
plot(x=datetime, y=power_date$Sub_metering_1, type="l",
     xlab = "", ylab = "Energy sub metering")
lines(x=datetime, y=power_date$Sub_metering_2, type="l",col = "red")
lines(x=datetime, y=power_date$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col=c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       cex = 1, lwd = 1)
plot(x=datetime, y=power_date$Global_reactive_power, type="l",xlab = "datetime", ylab = "Global_reactive_power")
dev.off()