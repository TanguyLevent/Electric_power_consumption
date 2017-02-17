plot3 <- function() {
        
        col_name <- c("Date","Time","Global_active_power","Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2","Sub_metering_3")
        my_data <- read.table("household_power_consumption.txt",sep = ";", header = TRUE, skip = 66636, nrows = 2880,col.names = col_name)
        
        my_data$Date <- as.Date(my_data$Date,"%d/%m/%Y")
        my_data$Time_Date = as.POSIXct(paste(my_data$Date,my_data$Time))
        my_data <- my_data[,c(10,3,4,5,6,7,8,9)]
        
        par(mfrow = c(2,2))
        
        plot(my_data$Time_Date, my_data$Global_active_power,type = "l", xlab = "", ylab = "Global Active Power")
        
        plot(my_data$Time_Date, my_data$Voltage,type = "l", xlab = "datetime", ylab = "Voltage")
        
        plot(my_data$Time_Date, my_data$Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
        lines(my_data$Time_Date, my_data$Sub_metering_2, col = "red")
        lines(my_data$Time_Date, my_data$Sub_metering_3, col = "blue")
        legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1), lwd=c(1,1))
        
        plot(my_data$Time_Date, my_data$Global_reactive_power,type = "l", xlab = "datetime", ylab = "Global Reactive Power")
        
        dev.copy(png,file="plot4.png", width=480, height=480)
        dev.off()
}
