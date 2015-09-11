# load the data
source("load.R")
dat <- loadData()

# plot attributes
# the filename
filename = "./plot3.png"

# basic plot attributes
width       <- 480
height      <-  480
units       <- "px"
bg          <- "white"

# line colors
col1        <- "black"
col2        <- "red"
col3        <- "blue"

# margins
mBottom     <- 8
mLeft       <- 8
mTop        <- 7
mRight      <- 6

# labels
xlab        <- ""
ylab        <- "Global Active Power (kilowatts)"

# create the PNG
png(filename = filename , width = width, height = height, units = units, bg = bg)

# set plot margins
par(mar = c(mBottom, mLeft, mTop, mRight))

# add the line plot
plot(dat$DateTime, dat$Sub_metering_1,
     type="l",
     xlab=xlab,
     ylab=ylab,
     col = col1)

# overlay other series
lines(dat$DateTime, dat$Sub_metering_2, col = col2)
lines(dat$DateTime, dat$Sub_metering_3, col = col3)

# add the legend
legend("topright", col = c(col1, col2, col3), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)

# close the device
dev.off()

# clean up the environment
rm(list = ls())