# load the data
source("load.R")
dat <- loadData()

# basic attributes
# the filename
filename    <- "./plot1.png"

# dimensions, units, and bgColor
width       <- 480
height      <- 480
units       <- "px"
bg          <- "white"

# margins
mBottom     <- 8
mLeft       <- 8
mTop        <- 7
mRight      <- 6

# color for histogram bars
col         <- "red"

# axis labels
main        <- "Global Active Power"
xlab        <- "Global Active Power(kilowatts)"

# create a device of type PNG
png(filename = filename , width = width, height = height, units = units, bg = bg)

# set the margins
par(mar = c(mBottom, mLeft, mTop, mRight))

# add the histogram plot
hist(dat$Global_active_power, col = col, main = main, xlab = xlab)

# close the device
dev.off()

# clean up the environment
rm(list = ls())