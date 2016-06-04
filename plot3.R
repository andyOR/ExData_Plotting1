# Reading DataSet
library(data.table)
ndate <- fread("household_power_consumption.txt", na.strings = "?")
ndate$Date <- as.Date(ndate$Date, format = "%d/%m/%Y")

#Subsetting Dataset for two days
subdata <- subset(ndate, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#Converting Dates/Time
datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$DateTime <- as.POSIXct(datetime)
head(subdata)

#Writing Plots in PNG
png(file = "plot3.png", width = 480, height = 480)
plot(subdata$Sub_metering_1~subdata$DateTime, type = "l", ylab = "Energy sub metering", xlab = "" )
lines(subdata$Sub_metering_2~subdata$DateTime, col = "red")
lines(subdata$Sub_metering_3~subdata$DateTime, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

