# Plot3.R
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
plot3.df <- cbind(pwr.df, dt_time.df) # create plot3 data frame

## create plot
png(filename = "plot3.png")

with(plot3.df,
     plot(plot3.df$dt_time, plot3.df$Sub_metering_1
          ,type = "l"
          ,ylab = "Energy sub metering"
          ,xlab = "")
)
with (plot3.df,
     lines(plot3.df$dt_time, plot3.df$Sub_metering_2
           ,type = "l"
           ,ylab = "Energy sub metering"
           ,xlab = ""
           ,col = "red")
)
with (plot3.df,
     lines(dt_time, Sub_metering_3
           ,type = "l"
           ,ylab = "Energy sub metering"
           ,xlab = ""
           ,col = "blue")
)
legend ("topright"
        ,legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3")
        ,col = c("black", "red","blue")
        ,lty = 1
        )

dev.off()