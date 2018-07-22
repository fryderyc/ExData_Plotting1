if (!file.exists("./data.zip")) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./data.zip", mode = "wb")
  unzip("./data.zip")
}

data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, dec = ".")
subdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

png("./plot1.png", width = 480, height = 480)
hist(as.numeric(subdata$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()