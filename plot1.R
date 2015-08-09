dataFile <- "data/household_power_consumption.txt"
data <- read.csv(dataFile, sep=";",stringsAsFactors = FALSE,dec=".")

# Subset data based on two dates
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

# Corece the character object to numeric
globalactivepower <- as.numeric(subsetdata$Global_active_power)

# Plot the graph
png("plot1.png",width = 480, height = 480)
hist(globalactivepower,col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()
