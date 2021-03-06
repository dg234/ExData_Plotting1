data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Convert Date and Time columns to POSIXlt class:
data$Date <- as.POSIXlt(paste(as.Date(data$Date, format="%d/%m/%Y"), data$Time, sep=" "))

## Plot
par(mar=c(4.7, 4.7, 0.7, 0.7), mfrow=c(2,2))

plot(data$Date, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(data$Date, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(data$Date, data$Sub_metering_1, type="n", lwd=1, 
     ylim=c(0, max(c(data$Sub_metering_1, data$Sub_metering_2, data$Sub_metering_3))),
     xlab="", ylab="Energy sub metering")

lines(data$Date, data$Sub_metering_1, col="black")
lines(data$Date, data$Sub_metering_2, col="red")
lines(data$Date, data$Sub_metering_3, col="blue")

legend("topright", lwd=1, 
       col=c("black", "red", "blue"), 
       legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"),
       box.lwd=0)

plot(data$Date, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global Reactive Power")

dev.copy(png, file="plot4.png", height=480, width=480)

dev.off()