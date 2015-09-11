# load the data
source("load.R")
dat <- loadData()

# the plot's attributes
# filename
filename = "./plot4.png"

# dimensions, units, and bgColor
width       <- 480
height      <-  480
units       <- "px"
bg          <- "white"

# colors for lines and legends
col1        <- "black"
col2        <- "red"
col3        <- "blue"

# margins
mBottom     <- 5
mLeft       <- 4
mTop        <- 3
mRight      <- 3

# axis labels
xlab        <- ""
xlab2       <- "datetime"
ylab1       <- "Global Active Power"
ylab2       <- "Voltage"
ylab3       <- "Energy sub metering"
ylab4       <- "Global_reactive_power"


# create a device of type PNG
png(filename = filename , width = width, height = height, units = units, bg = bg)

# set the rows and columns to lay out the 4 plots
par(mfrow = c(2,2))

# set the margins
par(mar = c(mBottom, mLeft, mTop, mRight))

with(dat, {
    # plot 1, a line plot
    plot(DateTime, Global_active_power,
         type = "l",
         xlab = xlab,
         ylab = ylab1,
         col = col1)
    
    # plot 2, a line plot
    # in the example, it has an explicit x-axis label
    plot(DateTime, Voltage,
         type = "l",
         col = col1,
         xlab = xlab2,
         ylab = ylab2)
    
    # plot 3, a line plot with 3 series and a legend
    plot(DateTime, Sub_metering_1,
         type = "l",
         xlab = xlab,
         ylab = ylab3,
         col = col1)
    lines(DateTime, Sub_metering_2, col = col2)
    lines(DateTime, Sub_metering_3, col = col3)
    
    # in the example, the legend's box has been suppressed: bty = "n"
    legend("topright", col = c(col1, col2, col3), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty = "n")
    
    # plot 4, a line plot
    # in the example, it has an explicit x-axis label
    plot(DateTime, Global_reactive_power,
         type = "l",
         xlab = xlab2,
         ylab = ylab4,
         col = col1)
})

# close the device
dev.off()

# clean up the environment
rm(list = ls())