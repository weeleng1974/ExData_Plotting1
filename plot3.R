setwd("~/Coursera/courses/04_ExploratoryAnalysis/Project01")
## Read the table into the data set
consumption<-read.table("./household_power_consumption.txt", sep=";", header=TRUE, colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")
## format the time
consumption$DateTime <- paste(consumption$Date, consumption$Time)
consumption$DateTime <- strptime(consumption$DateTime, format = "%d/%m/%Y %H:%M:%S")
## filter the data with the require date
subsetdata<-subset(consumption, DateTime >= "2007-02-01 00:00:00" & DateTime <= "2007-02-02 23:59:59")
par(ps=10)
## Create a empty plot
plot(subsetdata$DateTime, subsetdata$Sub_metering_1, type="n",xlab ="",ylab ="Energy Sub metering")
## Plot 3 lines and create the legend
lines(subsetdata$DateTime, subsetdata$Sub_metering_1)
lines(subsetdata$DateTime, subsetdata$Sub_metering_2, col="red")
lines(subsetdata$DateTime, subsetdata$Sub_metering_3, col="blue")
legend("topright", lty=c(1,1,1),col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), y.intersp=0.6)
## copy the plot to a png file
dev.copy(png, file ="./ExData_Plotting1/figure/plot3.png")
dev.off()