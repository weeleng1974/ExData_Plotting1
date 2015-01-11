setwd("~/Coursera/courses/04_ExploratoryAnalysis/Project01")
## Read the table into the data set
consumption<-read.table("./household_power_consumption.txt", sep=";", header=TRUE, colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")
## format the time
consumption$DateTime <- paste(consumption$Date, consumption$Time)
consumption$DateTime <- strptime(consumption$DateTime, format = "%d/%m/%Y %H:%M:%S")
## filter the data with the require date
subsetdata<-subset(consumption, DateTime >= "2007-02-01 00:00:00" & DateTime <= "2007-02-02 23:59:59")
par(mfcol = c(2, 2)) ## Set the coloumn
par(mar=c(5,4,3,2))  ## Set the margin
par(ps=10)
## Create a empty plot
plot(subsetdata$DateTime, subsetdata$Global_active_power, type="n",xlab ="",ylab ="Global Active Power")
lines(subsetdata$DateTime, subsetdata$Global_active_power)
## Create a empty plot
plot(subsetdata$DateTime, subsetdata$Sub_metering_1, type="n",xlab ="",ylab ="Energy Sub metering")
lines(subsetdata$DateTime, subsetdata$Sub_metering_1)
lines(subsetdata$DateTime, subsetdata$Sub_metering_2, col="red")
lines(subsetdata$DateTime, subsetdata$Sub_metering_3, col="blue")
legend("topright", lty=c(1,1,1),col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),bty='n',y.intersp=0.6)
## Create a empty plot
plot(subsetdata$DateTime, subsetdata$Voltage, type="n",xlab ="datetime",ylab ="Voltage")
lines(subsetdata$DateTime, subsetdata$Voltage)
## Create a empty plot
plot(subsetdata$DateTime, subsetdata$Global_reactive_power, type="n",xlab ="datetime",ylab ="Global_reactive_power")
lines(subsetdata$DateTime, subsetdata$Global_reactive_power)
## copy the plot to a png file
dev.copy(png, file ="./ExData_Plotting1/figure/plot4.png")
dev.off()