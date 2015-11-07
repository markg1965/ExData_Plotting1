##Import Data

File_Path <- "c:/users/Mark/Documents/R/household_power_consumption.txt"
Power_Data <- read.table(File_Path, header = TRUE, sep = ";")

##Convert Date and time into R date format

Power_Data$Date <- as.Date(Power_Data$Date, format = "%d/%m/%Y")

Power_Data$Time <- as.POSIXct(strptime(paste(Power_Data$Date, Power_Data$Time), "%Y-%m-%d %H:%M:%S"))

##Subset the household_power_consumption file

Power_Data_Subset <- subset(Power_Data, Power_Data$Date >"2007-01-31" & Power_Data$Date < "2007-02-03")

##create png file

png(filename = "plot3.png", width = 480, height = 480, units = "px", res = 75) 

##Create Plot

Plot3 <- plot(as.numeric(Power_Data_Subset$Sub_metering_1), type = "l", xaxt = "n", xlab = "", ylab = "Energy Sub Metering", cex.axis = .75)
          lines(as.numeric(Power_Data_Subset$Sub_metering_2), col = "Red")
          lines(as.numeric(Power_Data_Subset$Sub_metering_3), col = "Blue")
          legend(1820,35, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1), lwd = c(2.5,2.5,2.5), col = c("Black", "Red", "Blue"))
          axis(1, at = c(0, 1440, 2881), labels = c("Thu", "Fri","Sat"), xpd = TRUE)
        

dev.off()
