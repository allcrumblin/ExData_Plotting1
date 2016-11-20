#Read in Data
ene <- read.table('household_power_consumption.txt', header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subset Data
ene1 <- ene[ene$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(ene1$Date, ene1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Sub_metering_1 <- as.numeric(ene1$Sub_metering_1)
Sub_metering_2 <- as.numeric(ene1$Sub_metering_2)
Sub_metering_3 <- as.numeric(ene1$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy Sub metering")
lines(datetime, Sub_metering_2, type="l", col="red")
lines(datetime, Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()