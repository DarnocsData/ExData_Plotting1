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

#Plot1
png(file = "plot1.png", width = 480, height = 480)
hist(data_subset$Global_active_power,xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red",main="Global Active Power")
dev.off()
