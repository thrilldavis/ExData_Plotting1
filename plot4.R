#This script will create the fourth image from the exploratory analysis week 1 assignment
#first load and cleanse the data as I assume this is meant to be run independtly of everything else
source("./loadAndClean.R")

#first segment the viewer into a 2 by 2 array for the four charts
par(mfrow=c(2,2))

#simple line chart
plot(filtered_household$Date,filtered_household$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

#simple line chart
plot(filtered_household$Date,filtered_household$Voltage,type="l",xlab="datetime",ylab="Voltage")

#same as ./plot3.R but of course I don't want to just source it since it reloads the data and I'm 
#not too keen on going back to turn it into multiple R files just to clean up the four lines here into one
#load the first line
plot(filtered_household$Date,filtered_household$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
#load the second line
lines(filtered_household$Date,filtered_household$Sub_metering_2,col="red")
#load the third line
lines(filtered_household$Date,filtered_household$Sub_metering_3,col="blue")
#add the legend
legend("topright",lty = c(1, 1, 1),col=c("black","red", "blue"),legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

#simple line graph
plot(filtered_household$Date,filtered_household$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.copy(png,file="plot4.png")
dev.off()