## course project 1
## chris rodger


## use sqldf package to speed up reading data (only read a subset)
# install.packages("sqldf")
library(sqldf)
power<-file("./exdata-data-household_power_consumption/household_power_consumption.txt")
powerdf<-sqldf('select * from power WHERE Date IN ("1/2/2007","2/2/2007") ',
               file.format = list(sep=";"))


## clean up time information to use for graphs (if needed)
powerdf$datetime<-strptime(paste(powerdf$Date,powerdf$Time),"%d/%m/%Y %T")


## fourth plot (multiple plots)
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))

  # first plot
    plot(powerdf$datetime,powerdf$Global_active_power,
         type="l",
         xlab="",
         ylab="Global Active Power (kilowatts)")

  # second plot -- datetime and voltage
    plot(powerdf$datetime,powerdf$Voltage,
         type="l",
         xlab="datetime",
         ylab="")

  # third plot
    plot(powerdf$datetime,powerdf$Sub_metering_1,type="l",col="black",
         xlab="",ylab="Energy sub metering")
    points(powerdf$datetime,powerdf$Sub_metering_2,type="l",col="red")
    points(powerdf$datetime,powerdf$Sub_metering_3,type="l",col="blue")
    legend("topright",lty=c(1,1,1),col=c("black","red","blue"),
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

  # fourth plot
    plot(powerdf$datetime,powerdf$Global_reactive_power,
         type="l",
         xlab="datetime",
         ylab="Global_reactive_power")

dev.off()
