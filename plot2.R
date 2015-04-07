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

plot2 <- function(plotdata) {       
        #Plot 2
        startPng("plot2.png")         
        plot(plotdata$DateTime, plotdata$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="n")
        lines(plotdata$DateTime, plotdata$Global_active_power, type="l")
        dev.off()
}

startPng <- function(filename) {
        png(file = filename, bg="transparent", width = 480, height = 480)
}