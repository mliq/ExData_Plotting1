	## read in data, subset
	file<-read.table("household_power_consumption.txt", header=T, sep=";",  na.strings = "?")
	file2<-subset(file, file$Date=="2/2/2007" | file$Date=="1/2/2007")
	windows.options(width=480, height=480) ## set height and width
	## Convert time to POSIXlt, plot
	file2$DT<-paste(file2$Date, file2$Time)
	file2$DT2<-strptime(file2$DT, format="%d/%m/%Y %H:%M:%S")
	
	## Plot, add legend, write to PNG
	png("plot4.png")
	par(mfrow = c(2, 2), mar = c(5, 4, 2, 1))
	plot(file2$DT2,file2$Global_active_power , main="", ylab="Global Active Power (kilowatts)", type="l",xlab="")
	plot(file2$DT2,file2$Voltage , main="", ylab="Voltage", type="l",xlab="datetime")
	plot(file2$DT2,file2$Sub_metering_1, main="", ylab="Energy sub metering", type="l",xlab="")
	lines(file2$DT2,file2$Sub_metering_2,col="red")
	lines(file2$DT2,file2$Sub_metering_3,col="blue")
	legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=0,col=c("black","red","blue"),ncol=1,cex=1 , inset =c(0,0), text.col=c("black"), bty="n")
	plot(file2$DT2,file2$Global_reactive_power , main="", ylab="Global_reactive_power", type="l",xlab="datetime")
	dev.off()  ## Turn off PNG device.