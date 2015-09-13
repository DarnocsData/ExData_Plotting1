
rm(list=ls())
myclasses=c(rep("character",2),rep("numeric",7))
myclasses
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=myclasses,na.strings="?")

require(lubridate)
data$Date<-dmy(data$Date)
data$Time<-hms(data$Time)

data2<-data[which(year(data$Date)==2007 & month(data$Date)==2 & (day(data$Date)==1 | day(data$Date)==2)),]

#Plot1
png(file = "plot1.png", width = 480, height = 480)
hist(data2$Global_active_power,xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red",main="Global Active Power")
dev.off()
