## Get the data from the file 
getData <- function() {
        plotdata <- read.csv("data/household_power_consumption-2.txt", 
                             sep = ";", 
                             header = TRUE,
                             as.is = TRUE,
                             na.strings = c("?"))
        
        ## Get the data for only some specific dates
        plotdata <- subset(plotdata, Date == "1/2/2007" | Date == "2/2/2007")
        ## Add a datetime column so that we can sort data by date
        plotdata[, "DateTime"] <- paste(plotdata$Date, plotdata$Time)
        plotdata$DateTime <- strptime(plotdata$DateTime, "%d/%m/%Y %H:%M:%S")
        plotdata        
}

## Plot the data
plot4 <- function(plotdata) {  
        startPng("plot4.png")
        
        #plot 4
        par(mfrow=c(2,2))
        par(mar=c(2,4,1,1) + 2)
        
        par(mfg=c(1,1,2,2))
        plot(plotdata$DateTime, plotdata$Global_active_power, ylab="Global Active Power", xlab="", type="n")
        lines(plotdata$DateTime, plotdata$Global_active_power, type="l")
        
        par(mfg=c(1,2,2,2))
        plot(plotdata$DateTime, plotdata$Voltage, ylab="Voltage", xlab="datetime", type="n")
        lines(plotdata$DateTime, plotdata$Voltage, type="l")
        
        par(mfg=c(2,1,2,2))
        plot(plotdata$DateTime, plotdata$Sub_metering_3, ylab="Energy sub metering", xlab="", type="n", axes=FALSE)
        
        par(mfg=c(2,1,2,2))
        plot(plotdata$DateTime, plotdata$Sub_metering_2, ylab="", xlab="", type="n", axes=FALSE)
        
        par(mfg=c(2,1,2,2))
        plot(plotdata$DateTime, plotdata$Sub_metering_1, ylab="", xlab="", type="n", axes=TRUE)
        
        lines(plotdata$DateTime, plotdata$Sub_metering_1, type="l", col="black")
        lines(plotdata$DateTime, plotdata$Sub_metering_2, type="l", col="red")        
        lines(plotdata$DateTime, plotdata$Sub_metering_3, type="l", col="blue")
        
        par(mfg=c(2,1,2,2))        
        legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
               lty=c(1,1), 
               col=c("black", "red", "blue"),
               bty="n")
        
        par(mfg=c(2,2,2,2))
        plot(plotdata$DateTime, plotdata$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="n")
        lines(plotdata$DateTime, plotdata$Global_reactive_power, type="l", col="black")        
        dev.off()
}

## Save the image to a file
startPng <- function(filename) {
        png(file = filename, bg="transparent", width = 480, height = 480)
}