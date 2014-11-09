# plot4.R
# This routine loads the data file "household_power_consumption.txt" and plots 4 graphs tiled on a page in a 2 x 2 format.
# The graphs are:
# 1. Average power vs. time
# 2. Voltage vs. time
# 3. Energy submetering vs. time
# 4. Global reactive power vs .time
# Data for the dates 01/01/2007 through 02/02/2007 are extracted. 
# Coursera "Exploratory Data Analysis", Assignment 1, plot 4, course 009, Nov 2014
# The result is saved as plot4.png

# read in data file
NEWhpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# save format of date in table
myformat <- "%d/%m/%Y %H:%M:%S"

# create new column combining Date and Time columns
NEWhpc <- mutate(NEWhpc, DateTime = paste(Date, Time))

# convert dates
NEWhpc$DateTime <- strptime(NEWhpc$DateTime, myformat)

# convert start date and end date read in as day-month-year  all in numbers as in 01/02/2007
startdate <- strptime("01/02/2007 00:00:00", myformat)
enddate <- strptime("03/02/2007 00:00:00", myformat)

# filter data file to include only data taken  from 2007-02-01 to 2007-02-02
NEWhpcdates <- NEWhpc[which(NEWhpc$DateTime >= startdate & NEWhpc$DateTime <= enddate),]

#Start plotting routine
png("plot4.png")
par(mfrow = c(2, 2))

# graph 1 - Global active power vs. time
plot(NEWhpcdates$DateTime,NEWhpcdates$Global_active_power, type = "l",lty = 1, xlab = "", ylab = "Global Active Power")

# graph 2 - Voltage vs time
plot(NEWhpcdates$DateTime,NEWhpcdates$Voltage, type = "l",lty = 1, xlab = "datetime", ylab = "Voltage")

# graph 3 - Energy submetering vs time
plot(NEWhpcdates$DateTime,NEWhpcdates$Sub_metering_1, type = "l",lty = 1, xlab = "", ylab = "Energy sub metering")
lines(NEWhpcdates$DateTime,NEWhpcdates$Sub_metering_2, type = "l",lty = 1, xlab = "", ylab = "", col = "red")
lines(NEWhpcdates$DateTime,NEWhpcdates$Sub_metering_3, type = "l",lty = 1, xlab = "", ylab = "", col = "blue")
legend("topright", lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty ="n", cex = 1)

# graph 4 - Reactive power vs. time
plot(NEWhpcdates$DateTime,NEWhpcdates$Global_reactive_power, type = "l",lty = 1, xlab = "datetime", ylab = "Global_Reactive_Power")


# turn off device
dev.off()