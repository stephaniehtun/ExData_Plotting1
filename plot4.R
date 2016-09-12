hh <- read.table('./household_power_consumption.txt',header = TRUE, sep = ";",na.strings = "?",nrows = 2075259,stringsAsFactors = FALSE)
hh$Date <- as.Date(hh$Date,"%d/%m/%Y")

plot2date <- subset(hh,hh$Date=="2007-02-01"|hh$Date=="2007-02-02") 
datetime <- paste(plot2date$Date,plot2date$Time)
datetime <- as.POSIXct(datetime)


par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
plot(plot2date$Global_active_power ~ datetime,type="l",xlab="",ylab = "Global Active Power (kilowatts)")
plot(datetime,plot2date$Voltage,type = "l",xlab = "datetime",ylab = "Voltage")
plot(datetime, plot2date$Sub_metering_1 ,type="l",xlab="",ylab = "Energy sub metering")
lines(datetime, plot2date$Sub_metering_2, col="red")
lines(datetime, plot2date$Sub_metering_3, col="blue")
legend("topright",col = c("black","red","blue"),c("sub_metering_1","sub_metering_2","sub_metering_3"),lty=c(1,1),lwd=c(1,1))
plot(datetime,plot2date$Global_reactive_power,type="l",xlab = "datetime",ylab = "Global_reactive_power")
dev.copy(png, file="plot4.png",width=480,height=480)
dev.off()

