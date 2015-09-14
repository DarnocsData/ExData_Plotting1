
rm(list=ls())
myclasses=c(rep("character",2),rep("numeric",7))
myclasses
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=myclasses,na.strings="?")
data$Date_Time<-paste(data$Date,data$Time,sep = " ")

require(lubridate)
Dates_POSIX<-dmy_hms(data$Date_Time)

i=which(year(Dates_POSIX)==2007 & month(Dates_POSIX)==2 & (day(Dates_POSIX)==1 | day(Dates_POSIX)==2))
data_subset<-data[i,]
Dates_POSIX_subset<-Dates_POSIX[i]

#Plot4
png(file = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

plot(Dates_POSIX_subset,data_subset$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(Dates_POSIX_subset,data_subset$Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(Dates_POSIX_subset,data_subset$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(Dates_POSIX_subset,data_subset$Sub_metering_2,col="red")
lines(Dates_POSIX_subset,data_subset$Sub_metering_3,col="blue")
legend("topright",lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),bty="n")

plot(Dates_POSIX_subset,data_subset$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()








