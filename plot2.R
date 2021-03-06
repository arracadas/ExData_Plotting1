# Plot2.R
# Assignment 1 Exploratory Data Analysis
# Household power comsuption data
# Goal is to create plots shown on the assignment
# for dates 2007-02-01 and 2007-02-02
# missing values are coded as ? in the data set

## read data
pwr.df <- read.table("household_power_consumption.txt"
                     ,sep = ";"
                     ,skip = 66637
                     ,nrows = 2880)  ## rows for two days in Feb
colnames(pwr.df) <- c("Date", "Time", "Global_active_power"
                      ,"Global_reactive_power"
                      ,"Voltage"
                      ,"Global_intensity"
                      ,"Sub_metering_1"
                      ,"Sub_metering_2"
                      ,"Sub_metering_3")

## add column for date and time
date_time <- as.POSIXct(strptime(paste0(pwr.df$Date, pwr.df$Time), "%d/%m/%Y %H:%M:%S", tz = "GMT"))
dt_time.df <- as.data.frame(date_time)
colnames(dt_time.df) <- "dt_time"
plot2.df <- cbind(pwr.df, dt_time.df) # create plot2 data frame

## create plot diagram,launch graphics device and create png file
png(filename = "plot2.png", width = 480, height = 480)

plot(plot2.df$dt_time, plot2.df$Global_active_power
    ,type = "l"
    ,ylab = "Global Active Power (kilowatts)"
    ,xlab = "")

dev.off()
