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
plot1 <- function(plotdata) {       
        #Plot 1        
        startPng("plot1.png")
        hist(plotdata$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
        dev.off()
}

## Save the image to a file
startPng <- function(filename) {
        png(file = filename, bg="transparent", width = 480, height = 480)
}