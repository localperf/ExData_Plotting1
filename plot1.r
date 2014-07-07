
#--plot11.r


#--We will only be using data from the dates 2007-02-01 and 2007-02-02. 

setwd ("c://coursera//exploratory//assignment1//data")
getwd()
dir()

data = read.table("household_power_consumption.txt", sep = ";", header=T, na.strings = "?", as.is = T)
data$date = as.Date(data$Date, format = "%d/%m/%Y")
data = data[data$date >= as.Date("2007-02-01") & data$date <= as.Date("2007-02-02"),]
head(data)
summary(data)

#---------------------------

setwd("c://coursera//exploratory//assignment1")

#--plot1

hist (data$Global_active_power, main = "Global Active Power",
      xlab = "Global Active Power (kilowatts)",
      xlim = c(0, 6),
      col = "red")


png ("plot1.png", h=480, w = 480)
hist (data$Global_active_power, main = "Global Active Power",
      xlab = "Global Active Power (kilowatts)",
      xlim = c(0, 6),
      col = "red")
dev.off()
