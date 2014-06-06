## This script creates a png file containing a histogram of Global active power for Feb 1-2 2007.

## Read in the data, note semicolon (;) separators and NA indicated by "?"
all_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

## Convert date format
all_data$Date <- as.Date(all_data$Date, format = "%d/%m/%Y")

## Subset desired dates for Global active power
dataset <- subset(all_data, all_data$Date >= "2007-02-01" & all_data$Date <= "2007-02-02", select=c(Global_active_power))

## Open png, create histogram with desired options, close png.
png(file="plot1.png")
hist(dataset[,1], main="Global Active Power", xlab="Global Active Power (kilowatts)", col='red')
dev.off()
