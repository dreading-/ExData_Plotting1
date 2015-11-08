## Read the household power consumption file and store in data variable
data <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, na.strings=c("?"))

## Convert column 2 to Time (concatenate date and time from columns 1 and 2)
data[[2]] <- strptime(paste(as.character(data[[1]]) , as.character(data[[2]])),format='%d/%m/%Y %H:%M:%S')

## Convert column 1 toDate 
data[[1]] <- as.Date(data[[1]], format="%d/%m/%Y")

## Create vector of indexes we are interested in, that is from 1 Feb 2007 to 2 Feb 2007
dataset <- data[[1]]=="2007-02-01" | data[[1]] == "2007-02-02"

## Create plot 
par(mfrow = c(2, 2))
## Plot 1
plot(data$Time[dataset], data$Global_active_power[dataset], type="n", xlab="", ylab="Global Active Power")
lines(data$Time[dataset], data$Global_active_power[dataset], type="l")
## Plot 2
plot(data$Time[dataset], data$Voltage[dataset], type="n", xlab="datetime", ylab="Voltage")
lines(data$Time[dataset], data$Voltage[dataset], type="l")
## Plot 3
plot(data$Time[dataset], data$Sub_metering_1[dataset], type="n", xlab="", ylab="Energy Sub Metering")
lines(data$Time[dataset], data$Sub_metering_1[dataset], type="l")
lines(data$Time[dataset], data$Sub_metering_2[dataset], type="l", col="Red")
lines(data$Time[dataset], data$Sub_metering_3[dataset], type="l", col="Blue")
legend("topright", bty="n", lty=c(1,1,1), col = c("Black", "Red", "Blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
## Plot 4
plot(data$Time[dataset], data$Global_reactive_power[dataset], type="n", xlab="datetime", ylab="Global_reactive_power")
lines(data$Time[dataset], data$Global_reactive_power[dataset], type="l")

## Export image as png
## Note did not specify the  width and height as the default values 480 
dev.copy(png, file = "plot4.png")
dev.off()