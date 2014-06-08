	## read in data, subset
	file<-read.table("household_power_consumption.txt", header=T, sep=";",  na.strings = "?")
	file2<-subset(file, file$Date=="2/2/2007" | file$Date=="1/2/2007")
	windows.options(width=480, height=480) ## set height and width
	## Convert time to POSIXlt, plot
	file2$DT<-paste(file2$Date, file2$Time)
	file2$DT2<-strptime(file2$DT, format="%d/%m/%Y %H:%M:%S")
	plot(file2$DT2,file2$Global_active_power , main="", ylab="Global Active Power (kilowatts)", type="l",xlab="")
	
	## save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
	dev.copy(png, file = "plot2.png")  ## Copy my plot to a PNG file
	dev.off()  ## Turn off PNG device.