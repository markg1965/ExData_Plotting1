##Import Data

File_Path <- "c:/users/Mark/Documents/R/household_power_consumption.txt"
Power_Data <- read.table(File_Path, header = TRUE, sep = ";")

##Convert Date into R date format

Power_Data$Date <- as.Date(Power_Data$Date, format = "%d/%m/%Y")

##Subset the household_power_consumption file

Power_Data_Subset <- subset(Power_Data, Power_Data$Date >"2007-01-31" & Power_Data$Date < "2007-02-03")

##create png file

png(filename = "plot1.png", width = 480, height = 480, units = "px", res = 75) 

##Create Plot

Plot1 <- hist(as.numeric(Power_Data_Subset$Global_active_power), xaxt = "n", col = "Red", main = "Global Active Power",
        xlab = "Global Active Power (Kilowatts)")
axis(1, at = c(0, 1000, 2000, 3000), labels = c(0, 2, 4, 6))

dev.off()
