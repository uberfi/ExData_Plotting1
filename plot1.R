#####################################################################################
### Cos D. Fi
### Data Science - EDA
### Project 1 -- plot1.png
### June 8, 2014
######################################################################################


setwd("/Users/cosfi/Desktop/MOOCs/Coursera/DataScience/EDA/Week1")

######################################################################################

# Preparing the data; includes subsetting, removing larger dataset to optimize memory

X <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses="character", na.strings="?", stringsAsFactors=FALSE)

head(X, 5)

str(X)

X$DateTime <- as.POSIXct(strptime(paste(X$Date, X$Time), "%d/%m/%Y %H:%M:%S"))       

X$newDate <- as.Date(paste(X$Date, X$Time), format = "%d/%m/%Y %H:%M:%S")

# X$DateTime <- strptime(X$DateTime, format = "%d/%m/%Y %H:%M:%S")

# X$Time <- strptime(X$DateTime, format="%H:%M:%S")

X$Global_active_power <- as.numeric(X$Global_active_power)

X$Global_reactive_power <- as.numeric(X$Global_reactive_power)

X$Voltage <- as.numeric(X$Voltage)

X$Global_intensity <- as.numeric(X$Global_intensity)

X$Sub_metering_1 <- as.numeric(X$Sub_metering_1)

X$Sub_metering_2 <- as.numeric(X$Sub_metering_2)

X$Sub_metering_3 <- as.numeric(X$Sub_metering_3)

str(X)

head(X, 5)


library(dplyr)

Y <- filter(X, newDate >= as.Date("2007-02-01 00:00:00"), newDate < as.Date("2007-02-03 00:00:00"))

str(Y)

head(Y, 5)

summary(Y)

rm(X)




###########################################################################################

# Let's Plot now that we have subsetting the data we need for the task

# width and height are in pixels

png("plot1.png", width=480, height=480)

# plot1.R

with(Y, hist(Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency"))

dev.off()


### Or could plot and copy to PNG

### dev.copy(png, file = "plot1.R.png") ## Copy my plot to a PNG file 
### dev.copy(png, file = "plot2.R.png"); ...
### dev.off() ## Don't forget to close the PNG device!





###########################################################################################
### Referenced
### http://stackoverflow.com/questions/24006475/subsetting-data-based-on-a-date-range-in-r

### Chang W. ~ R Graphics Cookbook (2013, pp. 327-328)
###########################################################################################
