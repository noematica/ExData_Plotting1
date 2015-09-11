# load the data
source("load.R")
dat <- loadData()

# basic attributes
# the filename
filename = "./plot2.png"

# size and background
width       <- 480
height      <-  480
units       <- "px"
bg          <- "white"

# margins
mBottom     <- 8
mLeft       <- 8
mTop        <- 7
mRight      <- 6

# axis labels
xlab        <- ""
ylab        <- "Global Active Power (kilowatts)"

# create the PNG
png(filename = filename , width = width, height = height, units = units, bg = bg)

# set the margins
par(mar = c(mBottom, mLeft, mTop, mRight))

# add the plot
plot(dat$DateTime, dat$Global_active_power,
     type="l",
     xlab=xlab,
     ylab=ylab)

# close the device
dev.off()

# clean up the environmemnt
rm(list = ls())