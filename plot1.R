file <- "./data/household_power_consumption.txt"
dataAll <- read.table(file, header = T, sep = ";", na.string="?", check.names=F, stringsAsFactors=F)
dataAll$Date <- as.Date(dataAll$Date, format = "%d/ %m/ %Y")
data <- dataAll[(dataAll$Date == "2007-02-01") | (dataAll$Date == "2007-02-02"),]
hist(data$Global_active_power, col="Red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
png("plot1.png", width = 480, height = 480)
dev.off()

