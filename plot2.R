#plot2.R Figure 2

###Read data###
mydata <- read.table('household_power_consumption.txt', sep=';', header=T, na.strings='?', 
                     colClasses = c('character', 'character', 'numeric','numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))

###Convert dates to day/month/Year Hours/Minutes/Seconds###
mydata$DateTime <- strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S")

###Subset###
mydata <- subset(mydata, 
                 as.Date(DateTime) >= as.Date("2007-02-01") & 
                   as.Date(DateTime) <= as.Date("2007-02-02"))

###Create plot2.png###
plot( mydata$Global_active_power
      , type = "l"
      , ylab = "Global Active Power (kilowatts)"
      , xlab = ""
      , xaxt="n"
)
axis(1, at=c(1, 1440, 2880),labels = c("Thu", "Fri", "Sat"))

dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()
