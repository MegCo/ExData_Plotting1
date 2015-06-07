
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

## Plot 1 
hist(needed_data$Global_active_power, main="Global Active Power",  
  xlab="Global Active Power (kilowatts)", 
  ylab="Frequency", col="Red") 
 

## Saving to file 
 dev.copy(png, file="plot1.png", height=480, width=480) 
 dev.off() 


