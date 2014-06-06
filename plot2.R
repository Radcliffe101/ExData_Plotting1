## This script creates a png file containing a line graph of power use over time for Feb 1-2 2007.

## Read in the data, note semicolon (;) separators and NA indicated by "?"
all_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

## Convert date format
all_data$Date <- as.Date(all_data$Date, format = "%d/%m/%Y")

## Subset desired dates for Global active power
dataset <- subset(all_data, all_data$Date >= "2007-02-01" & all_data$Date <= "2007-02-02")

## Make a variable that combines the date and time columns and read it in using strptime()
DateTime <- paste(dataset$Date, dataset$Time)
DateTime <- strptime(DateTime, format = "%Y-%m-%d %H:%M:%S")

## Create the plot as a png file. 
png(file="plot2.png", width=480, height=480, units='px')
plot(DateTime, dataset[,3], ylab= "Global Active Power (kilowatts)", xlab = NA, type='l')
dev.off()

