#Plot3

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destfile <- "/Users/raquelaraujo/Documents/Cursos/JHDS/4. Exploratory Data Analysis/Exploratory Data Analysis/data.txt"
download.file(url,destfile)

household_power_consumption <- read.csv("~/Documents/Cursos/JHDS/4. Exploratory Data Analysis/Exploratory Data Analysis/data.txt", sep=";")

#You may find it useful to convert the Date and Time variables to Date/Time classes in R using the 
#strptime() and as.Date() functions.

household_power_consumption$Date <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")


#household_power_consumption$Time <- strptime(household_power_consumption$Time, format = "%H:%M:%S")

household_power_consumption$Date_Time <- as.POSIXct(paste(household_power_consumption$Date, household_power_consumption$Time), format="%Y-%m-%d %H:%M:%S")

household_power_consumption_ss <- subset(household_power_consumption, Date == "2007-02-01" | Date == "2007-02-02")

#Plot3.png 


household_power_consumption_ss$Sub_metering_1 <- as.numeric(household_power_consumption_ss$Sub_metering_1)
household_power_consumption_ss$Sub_metering_2 <- as.numeric(household_power_consumption_ss$Sub_metering_2)
household_power_consumption_ss$Sub_metering_3 <- as.numeric(household_power_consumption_ss$Sub_metering_3)

png(file = "Plot3.png")

with(household_power_consumption_ss, plot(Date_Time, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
with(household_power_consumption_ss, lines(Date_Time, Sub_metering_2, col="red"))
with(household_power_consumption_ss, lines(Date_Time, Sub_metering_3, col="blue"))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1,1), ncol=1)

dev.off()

