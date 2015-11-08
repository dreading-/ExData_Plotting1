## Read the household power consumption file and store in data variable
data <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, na.strings=c("?"))

## Convert column 2 to Time (concatenate date and time from columns 1 and 2)
data[[2]] <- strptime(paste(as.character(data[[1]]) , as.character(data[[2]])),format='%d/%m/%Y %H:%M:%S')

## Convert column 1 toDate 
data[[1]] <- as.Date(data[[1]], format="%d/%m/%Y")

## Create vector of indexes we are interested in, that is from 1 Feb 2007 to 2 Feb 2007
dataset <- data[[1]]=="2007-02-01" | data[[1]] == "2007-02-02"

## Create plot 
plot(data$Time[dataset], data$Global_active_power[dataset], type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(data$Time[dataset], data$Global_active_power[dataset], type="l")

## Export image as png
## Note did not specify the  width and height as the default values 480 
dev.copy(png, file = "plot2.png")
dev.off()
