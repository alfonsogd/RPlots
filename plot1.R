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
# First plot
hist(subbd$Global_active_power, col="red", main="Global Active Power", xlab= "Global Active Power (Kilowatts)")
# END