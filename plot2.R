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
png(file = "plot2.png", width = 480, height = 480)
plot(subdata$Global_active_power~subdata$DateTime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
