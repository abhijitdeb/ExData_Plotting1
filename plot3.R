getData <- function() {
        plotdata <- read.csv("data/household_power_consumption-2.txt", 
                             sep = ";", 
                             header = TRUE,
                             as.is = TRUE,
                             na.strings = c("?"))
        plotdata <- subset(plotdata, Date == "1/2/2007" | Date == "2/2/2007")
        plotdata[, "DateTime"] <- paste(plotdata$Date, plotdata$Time)
        plotdata$DateTime <- strptime(plotdata$DateTime, "%d/%m/%Y %H:%M:%S")
        plotdata        
}


plot3 <- function(plotdata) {  
        startPng("plot3.png")
        #Plot 3
        plot(plotdata$DateTime, plotdata$Sub_metering_3, ylab="Energy sub metering", xlab="", type="n", axes=FALSE)
        plot(plotdata$DateTime, plotdata$Sub_metering_2, ylab="", xlab="", type="n", axes=FALSE)        
        plot(plotdata$DateTime, plotdata$Sub_metering_1, ylab="", xlab="", type="n", axes=TRUE)
        
        lines(plotdata$DateTime, plotdata$Sub_metering_1, type="l", col="black")
        lines(plotdata$DateTime, plotdata$Sub_metering_2, type="l", col="red")
        lines(plotdata$DateTime, plotdata$Sub_metering_3, type="l", col="blue")
        
        legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), 
               lwd=c(2.5, 2.5), col=c("black", "red", "blue"))
        dev.off()
}

startPng <- function(filename) {
        png(file = filename, bg="transparent", width = 480, height = 480)
}