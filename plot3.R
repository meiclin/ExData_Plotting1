file <- "./data/household_power_consumption.txt"
dataAll <- read.table(file, header = T, sep = ";", na.string="?", check.names=F, stringsAsFactors=F)
dataAll$Date <- as.Date(dataAll$Date, format = "%d/%m/%Y")
data <- dataAll[(dataAll$Date == "2007-02-01") | (dataAll$Date == "2007-02-02"),]

datetime <- as.POSIXct(paste(data$Date, data$Time))
with(data, {
        plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
        lines(datetime, Sub_metering_2, col='Red')
        lines(datetime, Sub_metering_3, col='Blue')
        })
legend("topright", col=c("Black", "Red", "Blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1, 1), lwd=c(1, 1))
png("plot3.png", width = 480, height = 480)
dev.off()