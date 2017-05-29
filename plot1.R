## Produces Plot1, a histogram of Global Active Power (kilowatts)
plot1 <- function() {

  # Load in data
  power_data <- read.delim("household_power_consumption.txt",
                     sep = ";")
  
  # Partition data set to the two days in question
  power_data <- power_data[power_data$Date == "1/2/2007" | 
      power_data$Date == "2/2/2007",]
  
  # Change data into usable numeric
  power_data$Global_active_power <- 
      as.numeric(as.character(power_data$Global_active_power))
  
  # Creates Plot
  with(power_data, hist(Global_active_power, col = "red", 
      xlab = "Global Active Power (kilowatts)",
      main = "Global Active Power"))
  
  # Copies plot to png
  dev.copy(png, file = "plot1.png", width = 480, height = 480)
  
  # Close connection with png
  dev.off()
}