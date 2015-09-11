loadData <- function() {
    # use data.table. fread is fast.
    library(data.table)
    
    # use dplyr for mutate
    library(dplyr)
    
    # the filename
    fileName <- "household_power_consumption.txt";
    
    # use grep to find the first matching row. skip one less than that to avoid lopping off the first observation.
    # observations ar 1 per minute. that's 24 hours * 60 minutes * 2. this is brittle, but okay for this exercise.
    startDay <- "1/2/2007"
    rowsByMinutesPerDay <- 24 * 60 * 2
    
    #set the column classes
    colClasses <- c(rep("character", 2), rep("numeric", 7))
    
    # get the data
    dat <- suppressWarnings(
        fread(
            fileName, skip = startDay,
            nrows = rowsByMinutesPerDay, sep = ";",
            na = "?", header = FALSE, colClasses = colClasses
        )
    )
    
    # set the column names
    columnNames <- c(
        "Date", "Time", "Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"
    )
    setnames(dat, 1:9, columnNames)
    
    # create a DateTime column as a POSIXct. plots don't like character dates
        dat$Date <- as.Date(dat$Date, '%d/%m/%Y')
        dat$DateTime <- paste(dat$Date, dat$Time, sep = " ")
        dat$DateTime <- as.POSIXct(dat$DateTime, format = "%Y-%m-%d %H:%M:%S")
    
    # get rid of the now-unnecessary Date and Time columns
    dat[, c("Date", "Time") := NULL];
    
    # return the data table
    return(dat);
}