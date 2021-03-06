library(sqldf)
df <- read.csv.sql('household_power_consumption.txt',"select * from file where  Date in ('1/2/2007','2/2/2007')", sep = ';', header = T)
df$DateTime <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
png(filename = "plot4.png", width = 480, height = 480, units = "px", bg =  "transparent")
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))
with(df, {
plot(df$DateTime,df$Global_active_power, type="l", xlab="", ylab="Global Active  Power", cex.lab = 0.95)
plot(df$DateTime,df$Voltage, type="l", xlab="datetime", ylab="Voltage", cex.lab =  0.95)
plot(df$DateTime, df$Sub_metering_1, type="l", xlab="", ylab="Energy Sub  Metering", cex.lab = 0.95)
lines(df$DateTime, df$Sub_metering_2, col="blue")
lines(df$DateTime, df$Sub_metering_3, col="red")
legend("topright", col = c("black", "blue", "red"), legend = c("Sub_metering_1",  "Sub_metering_2", "Sub_metering_3"), lwd=1, cex = 0.7)
plot(df$DateTime,df$Global_reactive_power, type="l", xlab="datetime",  ylab="Global_reactive_power", cex.lab = 0.95)
})
dev.off()
