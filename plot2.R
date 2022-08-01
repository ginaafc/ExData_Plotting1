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
png("plot2.png",width = 480, height = 480, units = "px")
plot(data$Time,data$Global_active_power,xlab="", ylab="Global Active Power (kilowatts)", type = "l")
dev.off()

