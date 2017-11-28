#Read data
mydata <- read.table("household_power_consumption.txt", sep = ";", h=T)

#convert datatype
datetime <- paste(mydata$Date, mydata$Time)
datetime <- as.POSIXct(strptime(datetime, "%d/%m/%Y %H:%M:%S"))
mydata <- cbind(datetime, mydata[,-(1:2)])
mydata <- subset(mydata, datetime >= as.POSIXct("2007-02-01 00:00:00 PST") & datetime <= as.POSIXct("2007-02-02 23:59:59 PST"))

#subset
mydata$Global_active_power = as.numeric(as.character(mydata$Global_active_power))
mydata$Sub_metering_1 = as.numeric(as.character(mydata$Sub_metering_1))
mydata$Sub_metering_2 = as.numeric(as.character(mydata$Sub_metering_2))
mydata$Sub_metering_3 = as.numeric(as.character(mydata$Sub_metering_3))
mydata$Voltage = as.numeric(as.character(mydata$Voltage))
mydata$Global_reactive_power = as.numeric(as.character(mydata$Global_reactive_power))


#Make plots
png("plot4.png", width = 480, height = 480)

par(mfcol = c(2,2))

plot(mydata$Global_active_power ~ mydata$datetime, type = "l", ylab = "Global Active Power", xlab = "")

plot(mydata$Sub_metering_1 ~ mydata$datetime, type = "l", main = "", ylab = "Energy sub metering", xlab = "")
lines(mydata$Sub_metering_2 ~ mydata$datetime, col = "Red")
lines(mydata$Sub_metering_3 ~ mydata$datetime, col = "Blue")
legend("topright", col = c("Black", "Red", "Blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, bty ="n")
#line voltage vs time
plot(mydata$Voltage ~ mydata$datetime, xlab = "datetime", ylab = "Voltage", type = "l")
#line reactive mydata vs time
plot(mydata$Global_reactive_power ~ mydata$datetime, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

dev.off()
