if (!file.exists("./data.zip")) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./data.zip", mode = "wb")
  unzip("./data.zip")
}

data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, dec = ".")
subdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

png("./plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
date_time <- strptime(paste(subdata$Date, subdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

# Plot 1
plot(date_time, as.numeric(subdata$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2)

# Plot 2
plot(date_time, as.numeric(subdata$Voltage), type = "l", xlab = "datetime", ylab = "Voltage")

# Plot 3
plot(date_time, as.numeric(subdata$Sub_metering_1), type = "l", ylab = "Energy sub metering", xlab = "")
lines(date_time, as.numeric(subdata$Sub_metering_2), type = "l", col = "red")
lines(date_time, as.numeric(subdata$Sub_metering_3), type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))

# Plot 4
plot(date_time, as.numeric(subdata$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()