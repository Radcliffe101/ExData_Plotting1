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

## Create the plot as a png file.Add the second and third lines using the lines() function. 
png(file="plot3.png", width=480, height=480, units='px')
plot(DateTime, dataset[,7], ylab= "Energy sub metering", xlab = NA, type='l', ylim=c(0,40))
lines(DateTime, dataset[,8], col='red')
lines(DateTime, dataset[,9], col='blue')

## Add the legend. col specifies coloers, lty=1 specifies solid line, lwd specifies weight.
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=c(1,1,1), lwd=c(2.5,2.5,2.5))
dev.off()

