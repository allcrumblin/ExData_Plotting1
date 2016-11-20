#Read in Data
ene <- read.table('household_power_consumption.txt', header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subset Data
ene1 <- ene[ene$Date %in% c("1/2/2007","2/2/2007") ,]

#Get relevant column
GAP <- as.numeric(ene1$Global_active_power)

#Open .png file and plot
png("plot1.png", width=480, height=480)
hist(GAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()