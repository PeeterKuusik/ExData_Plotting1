getwd()
rm(list = ls())
data<-read.table("household_power_consumption.txt",header=T, quote="\"", sep=";",na.strings = "?")
#make a copy just in case
data1=data
# date modification
data1$Date=as.Date(data1$Date,format="%d/%m/%Y")
data1=subset(data1, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
#evertything OK?
str(data1)

data1$datetime <- paste(data1$Date,data1$Time,sep = " ")
data1$datetime=strptime(data1$datetime,format ="%Y-%m-%d %H:%M:%S" )
# open dev
png(file="plot3.png")
#plot
plot(data1$datetime,data1$Sub_metering_1 ,type="l",ylab = "Energy sub metering",xlab="Note!N=Thu,R=Fri,L=Sat.")
lines(data1$datetime,data1$Sub_metering_2,col="red")
lines(data1$datetime,data1$Sub_metering_3,col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","red","blue"))
dev.off()