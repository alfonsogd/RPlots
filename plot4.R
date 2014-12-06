##########
#Load Database
bd <- read.csv("~/Rall/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
#R Libraries
library(plyr)
library(lubridate)
# Transform class
bd <- mutate(bd, Date = as.Date(dmy(Date)))
#subset 2007-02-01 to 2007-02-02
subbd <- bd[(bd$Date >= as.Date("2007/02/01") & bd$Date <= as.Date("2007/02/02")),]
subbd <- mutate(subbd, DateTime = ymd_hms(paste(subbd$Date,subbd$Time)))
# Fourth plot
par(mfcol=c(2,2))
par(mar=c(2,4,2,2))
plot (subbd$DateTime, subbd$Global_active_power, type = "l", ylab="Global Active Power (Kilowatts)")
with(subbd, plot(DateTime, Sub_metering_1, type="n", ylab="Energy Sub metering"))
with(subbd, points(DateTime, Sub_metering_1, type="l"))
with(subbd, points(DateTime, Sub_metering_2, type="l", col="red"))
with(subbd, points(DateTime, Sub_metering_3, type="l",  col="blue"))
legend("topright", pch=c("-","-","-"), col= c("black", "red", "blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
par(mar=c(4,4,2,2))
plot (subbd$DateTime, subbd$Voltage, type = "l", ylab="Voltage", xlab="Datetime")
plot (subbd$DateTime, subbd$Global_reactive_power, type = "l", ylab="Global reactive power", xlab="Datetime")
#END