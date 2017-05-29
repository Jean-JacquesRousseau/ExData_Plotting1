## Produces Plot2, which plots Global Active Power use over the
## two day period of 1/2/2007 to 2/2/2007
plot2 <- function() {

  power_data <- read.delim("household_power_consumption.txt", sep = ";")
  
  power_data <- power_data[power_data$Date == "1/2/2007" | 
      power_data$Date == "2/2/2007",]
  
  # Replaces original Date column with a column of Datetime data
  power_data$Date <- as.POSIXct(strptime(
      paste(power_data$Date, power_data$Time),
      "%d/%m/%Y %H:%M:%S"))
  
  power_data$Global_active_power <- 
      as.numeric(as.character(power_data$Global_active_power))
  
  # Create Plot2
  with(power_data, plot(Global_active_power ~ Date, type = "l",
      ylab = "Global Active Power (kilowatts)"))
  
  dev.copy(png, file = "plot2.png", width = 480, height = 480)
  
  dev.off()
}