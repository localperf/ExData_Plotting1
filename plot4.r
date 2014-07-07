library (lubridate)


#--We will only be using data from the dates 2007-02-01 and 2007-02-02. 

setwd ("c://coursera//exploratory//assignment1//data")
getwd()
dir()

data = read.table("household_power_consumption.txt", sep = ";", header=T, na.strings = "?", as.is = T)


data$date   = dmy(data$Date)
data$time   = hms(data$Time)
data$ts     = data$date + data$time

data = data[data$date >= as.Date("2007-02-01") & data$date <= as.Date("2007-02-02"),]
head(data)
summary(data)

#---------------------------

setwd("c://coursera//exploratory//assignment1")

#--plot4

par (mfrow = c(1, 2))


plot  (data$ts, data$Sub_metering_1, type = "s", col = "black", xlab = "", ylab = "Energy sub-metering")
lines (data$ts, data$Sub_metering_2, type = "s", col = "red")
lines (data$ts, data$Sub_metering_3, type = "s", col = "blue")
legend ("topright", c("Sub_Metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1,
        col = c("black", "red", "blue"))

plot (data$ts, data$Global_reactive_power, type = "s", xlab = "datetime", ylab = "Global_reactive_power")




png ("plot4.png", h = 480, w = 480)
par (mfrow = c(1, 2))


plot  (data$ts, data$Sub_metering_1, type = "s", col = "black", xlab = "", ylab = "Energy sub-metering")
lines (data$ts, data$Sub_metering_2, type = "s", col = "red")
lines (data$ts, data$Sub_metering_3, type = "s", col = "blue")
legend ("topright", c("Sub_Metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1,
        col = c("black", "red", "blue"))

plot (data$ts, data$Global_reactive_power, type = "s", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()