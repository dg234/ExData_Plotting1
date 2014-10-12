## Get full dataset
data <- read.csv("./household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subset data
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Convert Date and Time columns to POSIXlt class:
data$Date <- as.POSIXlt(paste(as.Date(data$Date, format="%d/%m/%Y"), data$Time, sep=" "))

## Plot
plot(data$Date, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()