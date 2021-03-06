dataFile <- "data/household_power_consumption.txt"
data <- read.csv(dataFile, sep=";",colClasses = "character",na.strings = "?")

# Subset data based on two dates
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

# Convert Date and Time variables to Date/Time classes
datetime <- strptime(paste(subsetdata$Date,subsetdata$Time),"%d/%m/%Y %H:%M:%S")

# Coerce character objects to numeric
globalactivepower <- as.numeric(subsetdata$Global_active_power)
globalreactivepower <- as.numeric(subsetdata$Global_reactive_power)
voltage <- as.numeric(subsetdata$Voltage)
sub_metering1 <- as.numeric(subsetdata$Sub_metering_1)
sub_metering2 <- as.numeric(subsetdata$Sub_metering_2)
sub_metering3 <- as.numeric(subsetdata$Sub_metering_3)

# Plot the graph
png("plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))
plot(datetime,globalactivepower,type = "l",xlab = "",ylab = "Global Active Power")
plot(datetime,voltage,type = "l",xlab = "datetime",ylab = "Voltage")
plot(datetime,sub_metering1,type="l",ylab = "Energy sub metering",xlab="")
lines(datetime,sub_metering2,type = "l",col = "red")
lines(datetime,sub_metering3,type = "l",col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,lwd = 2.5, col = c("black","red","blue"))
plot(datetime,globalreactivepower,type = "l",xlab = "datetime",ylab = "Global_reactive_power")
dev.off()