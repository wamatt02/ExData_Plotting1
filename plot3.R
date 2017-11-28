#plot3.R Figure 3

###Read data###
mydata <- read.table('household_power_consumption.txt', sep=';', header=T, na.strings='?', 
                     colClasses = c('character', 'character', 'numeric','numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))

###Convert dates to day/month/Year Hours/Minutes/Seconds###
mydata$DateTime <- strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S")

###Subset###
mydata <- subset(mydata, 
                 as.Date(DateTime) >= as.Date("2007-02-01") & 
                   as.Date(DateTime) <= as.Date("2007-02-02"))


#Plot 
plot(mydata$DateTime, mydata$Sub_metering_1, pch=NA, xlab="", ylab="Energy Sub Metering")
lines(mydata$DateTime, mydata$Sub_metering_1)
lines(mydata$DateTime, mydata$Sub_metering_2, col='red')
lines(mydata$DateTime, mydata$Sub_metering_3, col='blue')
legend('topright', 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1),
       col = c('black', 'red', 'blue'))

dev.copy(png, file = "plot3.png", width=480, height=480)
dev.off()
