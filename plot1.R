power_data_all <- read.table("household_power_consumption.txt",
                             header = TRUE,
                             sep = ";",
                             na.strings = "?")
pw_data <- subset(power_data_all, Date == "1/2/2007" | Date == "2/2/2007")

png(filename = "plot1.png", width = 480, height = 480)

hist(pw_data$Global_active_power,
     col = "red",
     xlab = "Global Active Power (kilowatts)", main = "Global Acrive Power")

dev.off()