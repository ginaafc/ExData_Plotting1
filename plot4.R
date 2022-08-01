#1. Open the libraries that i'm going to use
library(lubridate)

#2. Download the data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","DATA.zip")
unzip("DATA.zip")

#3. Reading the data, keeping the dates required
data<-read.table("household_power_consumption.txt",na.strings="?",header=T,sep=";")
data<- subset(data,Date=="1/2/2007" | Date=="2/2/2007")

#4. Formatting dates and time
data$Time<-strptime(paste(data$Date, data$Time,sep = " "),format = "%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date,format = "%d/%m/%Y")

#5. Plotting and saving the plot in a PNG file
png("plot4.png",width = 480, height = 480, units = "px")

par(mfrow=c(2,2))
  #5.1. First plot
  plot(data$Time,data$Global_active_power,xlab="", ylab="Global Active Power", type = "l")
  
  #5.2. Second plot
  plot(data$Time,data$Voltage,xlab="datetime", ylab="Voltage", type = "l")
  
  #5.3. Third plot
  plot(data$Time,data$Sub_metering_1,xlab="", ylab="Energy sub metering", type = "l")
  lines(data$Time,data$Sub_metering_2,xlab="",  type = "l",col="red")
  lines(data$Time,data$Sub_metering_3,xlab="",  type = "l",col="blue")
  
  legend("topright",col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1, bty = "n")
  
  
  #5.4. Fourth plot
  plot(data$Time,data$Global_reactive_power,xlab="datetime", ylab="Global_reactive_power", type = "l")

dev.off()