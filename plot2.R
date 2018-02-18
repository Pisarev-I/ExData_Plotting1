power_data_all <- read.table("household_power_consumption.txt",
                             header = TRUE,
                             sep = ";",
                             na.strings = "?")
pw_data <- subset(power_data_all, Date == "1/2/2007" | Date == "2/2/2007")
pw_data$DateTime <- strptime(paste(pw_data$Date, pw_data$Time), "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480)
plot(pw_data$DateTime,
     pw_data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()