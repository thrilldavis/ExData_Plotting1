#This script will create the second image from the exploratory analysis week 1 assignment
#first load and cleanse the data as I assume this is meant to be run independtly of everything else
source("./loadAndClean.R")

#simple line plot
plot(filtered_household$Date,filtered_household$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

#write out the chart
dev.copy(png,file="plot2.png")
dev.off()

