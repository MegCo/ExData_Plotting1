
setwd("~/The Data Scientist's toolbox/Data Exploratory/Week 1/Project")

data_full <- read.csv("household_power_consumption.txt", 
  header=T, sep=';', na.strings="?",  
  nrows=2075259, check.names=F, stringsAsFactors=F, 
  comment.char="", quote='\"') 

data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y") 
# transform from 16/12/2006 to 2006-12-16

## Subsetting the data 
needed_data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 
rm(data_full)  #to remove from environment

## Converting dates 
datetime <- paste(as.Date(needed_data$Date), needed_data$Time) 

## Plot 3
with(needed_data, { 
   plot(Sub_metering_1~Datetime, type="l", 
   ylab="Global Active Power (kilowatts)", xlab="") 
   lines(Sub_metering_2~Datetime,col='Red') 
   lines(Sub_metering_3~Datetime,col='Blue') 
  }) 
 
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,  
legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 

## Saving to file 
dev.copy(png, file="plot3.png", height=480, width=480) 
dev.off() 

