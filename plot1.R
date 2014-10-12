# plot1.R
# This routine loads the data file "household_power_consumption.txt" and plots frequency vs. global active power.
# Data for the dates 01/01/2007 through 02/02/2007 are extracted. 
# Coursera "Exploratory Data Analysis", Assignment 1, plot 1, course 008, Oct 2014
# The result is saved as plot1.png

png("plot1.png")
# read in data file
NEWhpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# save format of date in table
myformat <- "%d/%m/%Y"

# convert dates
NEWhpc$Date <- as.Date(NEWhpc$Date, myformat)

# convert start date and end date read in as day-month-year  all in numbers as in 01/02/2007
startdate <- as.Date("01/02/2007", myformat)
enddate <- as.Date("02/02/2007", myformat)

# filter data file to include only data taken  from 2007-02-01 to 2007-02-02

NEWhpcdates <- NEWhpc[which(NEWhpc$Date >= startdate & NEWhpc$Date <= enddate),]

#Start plotting routine
hist(NEWhpcdates$Global_active_power, col = "red", ann = FALSE)
title(main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
# turn off device
dev.off()