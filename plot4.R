
rm(list=ls())
myclasses=c(rep("character",2),rep("numeric",7))
myclasses
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=myclasses,na.strings="?")

require(lubridate)
data$Date<-dmy(data$Date)
data$Time<-hms(data$Time)

data2<-data[which(year(data$Date)==2007 & month(data$Date)==2 & (day(data$Date)==1 | day(data$Date)==2)),]

#Plot4
png(file = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

plot(ymd_hms(paste(data2$Date,data2$Time)),data2$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(ymd_hms(paste(data2$Date,data2$Time)),data2$Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(ymd_hms(paste(data2$Date,data2$Time)),data2$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(ymd_hms(paste(data2$Date,data2$Time)),data2$Sub_metering_2,col="red")
lines(ymd_hms(paste(data2$Date,data2$Time)),data2$Sub_metering_3,col="blue")
legend("topright",lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),bty="n")

plot(ymd_hms(paste(data2$Date,data2$Time)),data2$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()









