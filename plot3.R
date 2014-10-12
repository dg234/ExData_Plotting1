## Get full dataset
data <- read.csv("./household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subset data
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Convert Date and Time columns to POSIXlt class:
data$Date <- as.POSIXlt(paste(as.Date(data$Date, format="%d/%m/%Y"), data$Time, sep=" "))

## Plot
plot(data$Date, data$Sub_metering_1, type="n", lwd=1, 
     ylim=c(0, max(c(data$Sub_metering_1, data$Sub_metering_2, data$Sub_metering_3))),
     xlab="", ylab="Energy sub metering")

lines(data$Date, data$Sub_metering_1, col="black")
lines(data$Date, data$Sub_metering_2, col="red")
lines(data$Date, data$Sub_metering_3, col="blue")

legend("topright", lwd=1, 
       col=c("black", "red", "blue"), 
       legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"))
dev.copy(png, file="plot3.png", height=480, width=480)

dev.off()