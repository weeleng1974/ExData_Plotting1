setwd("~/Coursera/courses/04_ExploratoryAnalysis/Project01")
## Read the table into the data set
consumption<-read.table("./household_power_consumption.txt", sep=";", header=TRUE, colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")
## format the time
consumption$DateTime <- paste(consumption$Date, consumption$Time)
consumption$DateTime <- strptime(consumption$DateTime, format = "%d/%m/%Y %H:%M:%S")
## filter the data with the require date
subsetdata<-subset(consumption, DateTime >= "2007-02-01 00:00:00" & DateTime <= "2007-02-02 23:59:59")
par(ps=10)
## Create the histogram
hist(subsetdata$Global_active_power,xlab ="Global Active Power (kilowatts)", ylab ="Frequency", main="Global Active Power", col="red")
## copy the plot to a png file
dev.copy(png, file ="./ExData_Plotting1/figure/plot1.png")
dev.off()

