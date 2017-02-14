plot1 <- function() {
        
        col_name <- c("Date","Time","Global_active_power","Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2","Sub_metering_3")
        my_data <- read.table("household_power_consumption.txt",sep = ";", header = TRUE, skip = 66636, nrows = 2880,col.names = col_name)
        my_data$Date <- as.Date(my_data$Date,"%d/%m/%Y")
        hist(my_data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
        
        dev.copy(png,file="plot1.png", width=480, height=480)
        dev.off()

}
