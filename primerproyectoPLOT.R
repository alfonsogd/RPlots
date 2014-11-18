##########
#Cargar la base de datos
bd <- read.csv("~/Rall/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
#convertir fechas
library(plyr)
library(lubridate)
bd <- mutate(bd, DateTime = as.Date(dmy(Date)))
# alternativa creando otra variable
bd <- mutate(bd, DateTime = ymd_hms(paste(bd$Date,bd$Time)))
#subset solo febrero 2007 
#We will only be using data from the dates 2007-02-01 and 2007-02-02 (2 dias)
subbd <- bd[(bd$Date >= as.Date("2007/02/01") & bd$Date <= as.Date("2007/02/02")),]
#Primer PLOT
hist(subbd$Global_active_power, col="red",
     main="Global Active Power", 
     xlab= "Global Active Power (Kilowatts)")
#Segundo PLOT
#convertir Time en class(date) strptime()
#subbd2 <- mutate(subbd, Time = hms(Time))
plot (subbd$DateTime, subbd$Global_active_power)
