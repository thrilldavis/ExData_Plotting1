#This script will create the third image from the exploratory analysis week 1 assignment
#first load and cleanse the data as I assume this is meant to be run independtly of everything else
source("./loadAndClean.R")

#first plot the first line for sub_metering_1 in default black
plot(filtered_household$Date,filtered_household$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")

#write the sub_metering_2 line over the same graph in red
lines(filtered_household$Date,filtered_household$Sub_metering_2,col="red")

#write the sub_merting_3 line over the same graph in blue
lines(filtered_household$Date,filtered_household$Sub_metering_3,col="blue")

#write the legend to the top right, use lines of type 1 as the symbol and set the appropriate colors as used
legend("topright",lty = c(1, 1, 1),col=c("black","red", "blue"),legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

#write the file out
dev.copy(png,file="plot3.png")
dev.off()
