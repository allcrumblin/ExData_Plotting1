#Read in Data
ene <- read.table('household_power_consumption.txt', header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subset Data
ene1 <- ene[ene$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(ene1$Date, ene1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(ene1$Global_active_power)

#Open and plot to png file
png("plot2.png", width=480, height=480)
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()