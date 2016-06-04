# Reading DataSet
library(data.table)
ndate <- fread("household_power_consumption.txt", na.strings = "?")
ndate$Date <- as.Date(ndate$Date, format = "%d/%m/%Y")

#Subsetting Dataset for two days
subdata <- subset(ndate, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
head(subdata)

#Writing Plots in PNG file
png(file = "plot1.png", width = 480, height = 480)
hist(subdata$Global_active_power, xlab ="Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()

