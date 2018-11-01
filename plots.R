# needed for all
library(lubridate)


household_data <- read.table("./household_power_consumption.txt",sep=";",stringsAsFactors=FALSE, header=TRUE)
filtered_household <- subset(household_data, Date=="1/2/2007"|Date=="2/2/2007")

filtered_household$Date <- dmy_hms(paste(filtered_household$Date, filtered_household$Time, sep=" "))

filtered_household$Global_active_power <- as.numeric(filtered_household$Global_active_power)

filtered_household$Sub_metering_1 <- as.numeric(filtered_household$Sub_metering_1)
filtered_household$Sub_metering_2 <- as.numeric(filtered_household$Sub_metering_2)
filtered_household$Sub_metering_3 <- as.numeric(filtered_household$Sub_metering_3)

filtered_household$Voltage <- as.numeric(filtered_household$Voltage)

filtered_household$Global_reactive_power <- as.numeric(filtered_household$Global_reactive_power)

#Start R1
hist(filtered_household$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.copy(png,file="plot1.png")
dev.off()


#Start R2

plot(filtered_household$Date,filtered_household$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png")
dev.off()


#start R3


plot(filtered_household$Date,filtered_household$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(filtered_household$Date,filtered_household$Sub_metering_2,col="red")
lines(filtered_household$Date,filtered_household$Sub_metering_3,col="blue")
legend("topright",lty = c(1, 1, 1),col=c("black","red", "blue"),legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.copy(png,file="plot3.png")
dev.off()

#Start R4
par(mfrow=c(2,2))

plot(filtered_household$Date,filtered_household$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

plot(filtered_household$Date,filtered_household$Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(filtered_household$Date,filtered_household$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(filtered_household$Date,filtered_household$Sub_metering_2,col="red")
lines(filtered_household$Date,filtered_household$Sub_metering_3,col="blue")
legend("topright",lty = c(1, 1, 1),col=c("black","red", "blue"),legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))


plot(filtered_household$Date,filtered_household$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.copy(png,file="plot4.png")
dev.off()