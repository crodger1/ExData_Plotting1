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
powerdf$datetime<-paste(powerdf$Date,powerdf$Time)
powerdf$datetime2<-strptime(powerdf$datetime,"%F %T")

## first plot
par(mfrow=c(1,1))
png("plot1.png",width=480,height=480)

hist(powerdf$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

dev.off()
