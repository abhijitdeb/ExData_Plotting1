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

plot1 <- function(plotdata) {       
        #Plot 1        
        startPng("plot1.png")
        hist(plotdata$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
        dev.off()
}

startPng <- function(filename) {
        png(file = filename, bg="transparent", width = 480, height = 480)
}