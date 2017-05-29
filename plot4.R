## Creates plot4, which is a set of four different visualizations of our data
## Two correspond to plot2 and plot 3, the other two measure Voltage
## vs datetime and Global_reactive_power vs datetime
plot4 <- function() {

  power_data <- read.delim("household_power_consumption.txt", sep = ";")
  
  power_data <- power_data[power_data$Date == "1/2/2007" | 
      power_data$Date == "2/2/2007",]
  
  power_data$Date <- as.POSIXct(strptime(
      paste(power_data$Date, power_data$Time),
      "%d/%m/%Y %H:%M:%S"))
  
  power_data$Global_active_power <- 
      as.numeric(as.character(power_data$Global_active_power))
  power_data$Sub_metering_1 <- 
      as.numeric(as.character(power_data$Sub_metering_1))
  power_data$Sub_metering_2 <- 
      as.numeric(as.character(power_data$Sub_metering_2))  
  power_data$Sub_metering_3 <- 
      as.numeric(as.character(power_data$Sub_metering_3))
  power_data$Voltage <-
      as.numeric(as.character(power_data$Voltage))
  power_data$Global_reactive_power <- 
      as.numeric(as.character(power_data$Global_reactive_power))
  
  par(mfrow = c(2, 2))  
  
  # Plot 1
  with(power_data, plot(Global_active_power ~ Date, type = "l",
      ylab = "Global Active Power", xlab = ""))  
  
  # Plot 2
  with(power_data, plot(Voltage ~ Date, type = "l",
      ylab = "Voltage", xlab = "datetime"))

  # Plot 3
  with(power_data, plot(Sub_metering_1 ~ Date, type = "l",
      ylab = "Energy sub metering", xlab = ""))
  legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
      lty = 1, col = c('black', 'red', 'blue'), cex = 0.5)
  with(power_data, points(Sub_metering_2 ~ Date, col = "red", type = "l"))
  with(power_data, points(Sub_metering_3 ~ Date, col = "blue", type = "l"))
  
  # Plot 4
  with(power_data, plot(Global_reactive_power ~ Date, type = "l",
      xlab = "datetime"))
  
  dev.copy(png, file = "plot4.png", width = 480, height = 480)
  
  dev.off()
}