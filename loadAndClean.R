# This script will load the electrib power consumption dataset and clean it appropriately
# makes use of lubridate for the date fields which will need to be installed if not already

library(lubridate)

#load the large file
household_data <- read.table("./household_power_consumption.txt",sep=";",stringsAsFactors=FALSE, header=TRUE)

#subset the the larger dataset into a smaller one to work with
filtered_household <- subset(household_data, Date=="1/2/2007"|Date=="2/2/2007")

#change the date by appending the date and time fields together, might as well just use the same date column
filtered_household$Date <- dmy_hms(paste(filtered_household$Date, filtered_household$Time, sep=" "))

#change the appropriate fields into numeric fields
filtered_household$Global_active_power <- as.numeric(filtered_household$Global_active_power)

filtered_household$Sub_metering_1 <- as.numeric(filtered_household$Sub_metering_1)
filtered_household$Sub_metering_2 <- as.numeric(filtered_household$Sub_metering_2)
filtered_household$Sub_metering_3 <- as.numeric(filtered_household$Sub_metering_3)

filtered_household$Voltage <- as.numeric(filtered_household$Voltage)

filtered_household$Global_reactive_power <- as.numeric(filtered_household$Global_reactive_power)
