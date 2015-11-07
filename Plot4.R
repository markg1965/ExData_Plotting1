library(ggplot2)
library(gridExtra)

##Import Data

File_Path <- "c:/users/Mark/Documents/R/household_power_consumption.txt"
Power_Data <- read.table(File_Path, header = TRUE, sep = ";")

##Convert Date and time into R date format

Power_Data$Date <- as.Date(Power_Data$Date, format = "%d/%m/%Y")

Power_Data$Time <- as.POSIXct(strptime(paste(Power_Data$Date, Power_Data$Time), "%Y-%m-%d %H:%M:%S"))

##Subset the household_power_consumption file

Power_Data_Subset <- subset(Power_Data, Power_Data$Date >"2007-01-31" & Power_Data$Date < "2007-02-03")


##create png file

png(filename = "plot4.png", width = 480, height = 480, units = "px", res = 75) 

##Create Plots--par row sets up 4 separate plots

par(mfrow = c(2, 2)) 

Plot1 <- plot(as.numeric(Power_Data_Subset$Global_active_power), type = "l", xaxt = "n", yaxt = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
          axis(1, at = c(0, 1440, 2881), labels = c("Thu", "Fri", "Sat"), xpd = TRUE)
          axis(2, at = c(0,1000,2000,3000), labels = c("",2, 4, 6))
        
        
Plot2 <- plot(as.numeric(Power_Data_Subset$Voltage), type = "l", xaxt = "n", yaxt = "n", xlab = "", ylab = "Voltage")
          axis(1, at = c(0, 1440, 2881), labels = c("Thu", "Fri", "Sat"), xpd = TRUE)
          axis(2, at = c(800, 1000, 1200, 1400, 1600, 1800, 2000), labels = c(234,"", 238,"",242, "", 246))
  
        
Plot3 <- plot(as.numeric(Power_Data_Subset$Sub_metering_1), type = "l", xaxt = "n", xlab = "", ylab = "Energy Sub Metering", cex.axis = .75)
        lines(as.numeric(Power_Data_Subset$Sub_metering_2), col = "Red")
        lines(as.numeric(Power_Data_Subset$Sub_metering_3), col = "Blue")
        legend(1300,35, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1), lwd = c(2.5,2.5,2.5), col = c("Black", "Red", "Blue"), cex = .75)
        axis(1, at = c(0, 1440, 2881), labels = c("Thu", "Fri","Sat"), xpd = TRUE)
        
        
Plot4 <- plot(as.numeric(Power_Data_Subset$Global_reactive_power), type = "l", xaxt = "n", yaxt = "n", xlab = "", ylab = "Global Reactive Power")
        axis(1, at = c(0, 1440, 2881), labels = c("Thu", "Fri", "Sat"), xpd = TRUE)
        axis(2, at = c(0, 50, 100, 150, 200), labels = c(0.0,0.1,0.2,0.3,0.4))
        ##axis(2, at=NULL, labels = TRUE, xpd = TRUE)
        
dev.off()
