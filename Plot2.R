#Plot 2

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

#Plot2.png

png(file = "Plot2.png")
with(household_power_consumption_ss, plot(Date_Time, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()
