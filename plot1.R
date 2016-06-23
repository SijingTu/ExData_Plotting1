library(sqldf)
setwd("data scientist track/exploratory data analysis")
active_power <- read.csv.sql("household_power_consumption.txt", header = TRUE, sep = ";", 
                             sql = "select Global_active_power from file where Date = '1/2/2007' or Date = '2/2/2007'")
#plot 1 global active power
png(filename = "plot1.png",width = 480, height = 480)
hist(active_power$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowalts)")
dev.off()
