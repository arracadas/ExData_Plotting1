# Plot4.R
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
plot4.df <- cbind(pwr.df, dt_time.df) # create plot4 data frame

## create plot launch graphics device and create png
png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2), mar = c(4, 4, 2, 1))
with(plot4.df,
     plot(dt_time, Global_active_power
          ,type = "l"
          ,ylab = "Global Active Power"
          ,xlab = "")
)
with(plot4.df,
     plot(dt_time, Voltage
          ,type = "l"
          ,ylab = "Voltage"
          ,xlab = "datetime")
)
with (plot4.df, {
      plot(dt_time, Sub_metering_1
           ,type = "l"
           ,ylab = "Energy sub metering"
           ,xlab = "")
      lines(dt_time, Sub_metering_2
            ,type = "l"
            ,ylab = "Energy sub metering"
            ,xlab = ""
            ,col = "red")
      lines(dt_time, Sub_metering_3
            ,type = "l"
            ,ylab = "Energy sub metering"
            ,xlab = ""
            ,col = "blue")
      legend ("topright"
              ,legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3")
              ,col = c("black", "red","blue")
              ,lty = 1
      )
})
with(plot4.df,
     plot(dt_time, Global_reactive_power
          ,type = "l"
          ,ylab = "Global_reactive_power"
          ,xlab = "datetime")
)

dev.off()
