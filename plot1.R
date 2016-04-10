#get the unzipped data
getwd()
rm(list = ls())
data<-read.table("household_power_consumption.txt",header=T, quote="\"", sep=";",na.strings = "?")
#make a copy just in case
data1=data
# date modification
data1$Date=as.Date(data1$Date,format="%d/%m/%Y")
#data1$Time=strptime(data1$Time,format="%H:%M:%S")

data1=subset(data1, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
#evertything OK?
str(data1)

# open dev
png(file="plot1.png")
#plot
hist(data1$Global_active_power,col="red",main="global active power",xlab = "Global Active Power (kilowatts)")
dev.off()