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
plot2 <- function(plotdata) {       
        #Plot 2
        startPng("plot2.png")         
        plot(plotdata$DateTime, plotdata$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="n")
        lines(plotdata$DateTime, plotdata$Global_active_power, type="l")
        dev.off()
}

## Save the image to a file
startPng <- function(filename) {
        png(file = filename, bg="transparent", width = 480, height = 480)
}