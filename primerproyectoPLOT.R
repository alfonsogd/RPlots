##########
#Cargar la base de datos
bd <- read.csv("~/Rall/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
#convertir fechas
library(plyr)
library(lubridate)
bd <- mutate(bd, Date = as.Date(dmy(Date)))
# alternativa creando otra variable
#subset solo febrero 2007 
#We will only be using data from the dates 2007-02-01 and 2007-02-02 (2 dias)
subbd <- bd[(bd$Date >= as.Date("2007/02/01") & bd$Date <= as.Date("2007/02/02")),]
#convertir Time en class(date) strptime()
subbd <- mutate(subbd, DateTime = ymd_hms(paste(subbd$Date,subbd$Time)))
#Primer PLOT
hist(subbd$Global_active_power, col="red",
     main="Global Active Power", 
     xlab= "Global Active Power (Kilowatts)")
#Segundo PLOT
plot (subbd$DateTime, subbd$Global_active_power, type = "l", ylab="Global Active Power (Kilowatts)")
#Tercer PLOT Tres colores para submetering
plot (subbd$DateTime, subbd$Sub_metering_3, type = "l", ylab="Sub-metering" )
# cuarto plot
