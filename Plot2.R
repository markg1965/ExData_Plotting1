##Import Data

File_Path <- "c:/users/mg185234/Documents/R/household_power_consumption.txt"
Power_Data <- read.table(File_Path, header = TRUE, sep = ";")

##Convert Date and time into R date format

Power_Data$Date <- as.Date(Power_Data$Date, format = "%d/%m/%Y")

Power_Data$Time <- as.POSIXct(strptime(paste(Power_Data$Date, Power_Data$Time), "%Y-%m-%d %H:%M:%S"))

##Subset the household_power_consumption file

Power_Data_Subset <- subset(Power_Data, Power_Data$Date >"2007-01-31" & Power_Data$Date < "2007-02-03")

##create png file

png(filename = "plot2.png", width = 480, height = 480, units = "px", res = 75) 

##Create Plot

Plot2 <- plot(as.numeric(Power_Data_Subset$Global_active_power), type = "l", xaxt = "n", yaxt = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
    axis(1, at = c(0, 1440, 2881), labels = c("Thu", "Fri", "Sat"), xpd = TRUE)
    axis(2, at = c(0,1000,2000,3000), labels = c("",2, 4, 6))
    
dev.off()
