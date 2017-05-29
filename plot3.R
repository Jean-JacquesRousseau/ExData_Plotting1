## Creates plot3, a plot showing sub metering over the two day period
plot3 <- function() {
  
  power_data <- read.delim("household_power_consumption.txt", sep = ";")
  
  power_data <- power_data[power_data$Date == "1/2/2007" | 
      power_data$Date == "2/2/2007",]
  
  power_data$Date <- as.POSIXct(strptime(
      paste(power_data$Date, power_data$Time),
      "%d/%m/%Y %H:%M:%S"))
  
  power_data$Sub_metering_1 <- 
      as.numeric(as.character(power_data$Sub_metering_1))
  power_data$Sub_metering_2 <- 
      as.numeric(as.character(power_data$Sub_metering_2))  
  power_data$Sub_metering_3 <- 
      as.numeric(as.character(power_data$Sub_metering_3))
  
  with(power_data, plot(Sub_metering_1 ~ Date, type = "l",
      ylab = "Energy sub metering", xlab = ""))
  with(power_data, points(Sub_metering_2 ~ Date, col = "red", type = "l"))
  with(power_data, points(Sub_metering_3 ~ Date, col = "blue", type = "l"))
  legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
      lty = 1, col = c('black', 'red', 'blue'), cex = 0.5)
  
  dev.copy(png, file = "plot3.png", width = 480, height = 480)
  
  dev.off()
}