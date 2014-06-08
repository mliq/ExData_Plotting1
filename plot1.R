	## read in data, subset, and construct plot
	file<-read.table("household_power_consumption.txt", header=T, sep=";",  na.strings = "?")
	file2<-subset(file, file$Date=="2/2/2007" | file$Date=="1/2/2007")
	windows.options(width=480, height=480) ## set height and width
	hist(file2$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")

	## save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
	dev.copy(png, file = "plot1.png")  ## Copy my plot to a PNG file
	dev.off()  ## Turn off PNG device.
