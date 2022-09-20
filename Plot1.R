#Plot1

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destfile <- "/Users/raquelaraujo/Documents/Cursos/JHDS/4. Exploratory Data Analysis/Exploratory Data Analysis/data.txt"
download.file(url,destfile)

household_power_consumption <- read.csv("~/Documents/Cursos/JHDS/4. Exploratory Data Analysis/Exploratory Data Analysis/data.txt", sep=";")

household_power_consumption$Date <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")

household_power_consumption$Date_Time <- as.POSIXct(paste(household_power_consumption$Date, household_power_consumption$Time), format="%Y-%m-%d %H:%M:%S")

household_power_consumption_ss <- subset(household_power_consumption, Date == "2007-02-01" | Date == "2007-02-02")

#Plot1.png

household_power_consumption_ss$Global_active_power <- as.numeric(household_power_consumption_ss$Global_active_power)

#Remove outliers
household_power_consumption_ss_1 <- household_power_consumption_ss[household_power_consumption_ss$Global_active_power<6,]

png(file="Plot1.png")

hist(household_power_consumption_ss_1$Global_active_power, breaks = 8, col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
