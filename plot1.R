#plot1.R Figure 1

###Read data###
mydata <- read.table('~/coursera_hw1/data_exploration/household_power_consumption.txt', sep=';', header=T, 
                     colClasses = c('character', 'character', 'numeric','numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), 
                     na.strings='?')

###Convert dates###
mydata$DateTime <- strptime(paste(mydata$Date, mydata$Time), 
                            "%d/%m/%Y %H:%M:%S")

###Subset###
mydata <- subset(mydata, 
                 as.Date(DateTime) >= as.Date("2007-02-01") & 
                   as.Date(DateTime) <= as.Date("2007-02-02"))

###Create plot1.png###
hist(mydata$Global_active_power, col='red', xlab = 'Global Active Power (kilowatts)',
     main = 'Global Active Power')

dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()
