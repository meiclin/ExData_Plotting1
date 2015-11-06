file <- "./data/household_power_consumption.txt"
dataAll <- read.table(file, header = T, sep = ";", na.string="?", check.names=F, stringsAsFactors=F)
dataAll$Date <- as.Date(dataAll$Date, format = "%d/%m/%Y")
data <- dataAll[(dataAll$Date == "2007-02-01") | (dataAll$Date == "2007-02-02"),]

datetime <- as.POSIXct(paste(data$Date, data$Time))
plot(datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
png("plot2.png", width = 480, height = 480)
dev.off()
