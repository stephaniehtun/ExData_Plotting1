hh <- read.table('./household_power_consumption.txt',header = TRUE, sep = ";",na.strings = "?",nrows = 2075259,stringsAsFactors = FALSE)
#hh$Date <- as.Date(hh$Date,"%d/%m/%Y")


hist(hh$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()
