power_data_all <- read.table("household_power_consumption.txt",
                             header = TRUE,
                             sep = ";",
                             na.strings = "?")
pw_data <- subset(power_data_all, Date == "1/2/2007" | Date == "2/2/2007")
pw_data$DateTime <- strptime(paste(pw_data$Date, pw_data$Time), "%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480)

par(mfcol = c(2,2))
plot(pw_data$DateTime,
     pw_data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

plot(pw_data$DateTime,pw_data$Sub_metering_1,type = "n",xlab = "",ylab = "Energy sub metering")
points(pw_data$DateTime,pw_data$Sub_metering_1,type = "l")
points(pw_data$DateTime,pw_data$Sub_metering_2,type = "l", col = "red")
points(pw_data$DateTime,pw_data$Sub_metering_3,type = "l", col = "blue")
legend("topright",bty = "n", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1,1), col = c("black", "red", "blue"))

plot(pw_data$DateTime,
     pw_data$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

plot(pw_data$DateTime,
     pw_data$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()
