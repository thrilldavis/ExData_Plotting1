#This script will create the first image from the exploratory analysis week 1 assignment
#first load and cleanse the data as I assume this is meant to be run independtly of everything else
source("./loadAndClean.R")

#Start R1 - simple histogram
hist(filtered_household$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

#write out the file
dev.copy(png,file="plot1.png")
dev.off()
