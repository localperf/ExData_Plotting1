
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

#--plot2

plot (data$ts, data$Global_active_power, ylab = "Global Aciive Power (kilowatts)", type = "l")

png ("plot2.png", h = 480, w = 480)
plot (data$ts, data$Global_active_power, ylab = "Global Aciive Power (kilowatts)", type = "l")
dev.off()
