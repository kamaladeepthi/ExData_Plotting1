dataFile <- "data/household_power_consumption.txt"
data <- read.csv(dataFile, sep=";",colClasses = "character",na.strings = "?")

# Subset data based on two dates
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

# Convert Date and Time variables to Date/Time classes
datetime <- strptime(paste(subsetdata$Date,subsetdata$Time),"%d/%m/%Y %H:%M:%S")

# Coerce the character object to numeric
globalactivepower <- as.numeric(subsetdata$Global_active_power)

# Plot the graph
png("plot2.png",width = 480, height = 480)
plot(datetime,globalactivepower,type="l",xlab="",ylab = "Global Active Power (kilowatts)")
dev.off()