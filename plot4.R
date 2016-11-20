#Read in Data
ene <- read.table('household_power_consumption.txt', header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subset Data
ene1 <- ene[ene$Date %in% c("1/2/2007","2/2/2007") ,]

#Get relevant columns
GAP <- as.numeric(ene1$Global_active_power)
GRP <- as.numeric(ene1$Global_reactive_power)
Voltage <- as.numeric(ene1$Voltage)
datetime <- strptime(paste(ene1$Date, ene1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#open and plot to png file
png("plot4.png", width=480, height=480)
par(mfcol = c(2, 2)) 

plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy Sub metering")
lines(datetime, Sub_metering_2, type="l", col="red")
lines(datetime, Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), bty='n', legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, GRP, type="l", xlab="datetime", ylab="Global reactive power")

dev.off()