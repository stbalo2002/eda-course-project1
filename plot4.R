##if the working directory is not the directory that contains the unzipped project,
##kindly set the working directory to the directory that has the unzipped project
##i.e.(household_power_consumption.txt)
## loading necessary packages for the project
library(dplyr)
data <- read.csv("./household_power_consumption.txt",
       nrows = 69516, na.strings = "?", sep = ";")  ## the data for the project is within this rows
data <- data[66637:69516, ]   ## subsets the dates on first and second of february
## next i will tidy up the data a bit (this step is not really necessary)
names(data) <- names(data) %>% 
     tolower %>%
     gsub(pattern = "_", replacement = ".")
##next i create a variable named "datetime" using the strptime()
datetime <- paste(data$date, data$time)
datetime <- strptime(datetime, format = "%d/%m/%Y %H:%M:%S")
data$datetime <- datetime
png(file = "plot4.png")
par(mfrow = c(2, 2))  ##sets the parameter to plot 4 graphs on a page and fill row-wise
##plotting the first graph
with(data, plot(datetime, global.active.power, type = "l", 
      ylab = "Global Active Power", xlab = ""))
##plotting the second graph
with(data, plot(datetime, voltage, type  = "l", ylab = "Voltage", xlab = "datetime"))
##plotting the third graph
with(data, plot(datetime, sub.metering.1, type = "l", ylim = c(0, 40),  
                ylab = "Energy submetering", xlab = "", col = "black"))
with(data, points(datetime, sub.metering.2, type = "l", col = "red"))
with(data, points(datetime, sub.metering.3, col = "blue", type = "l"))
legend("topright", pch = "-", col = c("black", "red", "blue"), 
       legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"))
with(data, plot(datetime, global.reactive.power, type = "l", 
                ylab = "Global_reactive_power", xlab = "datetime"))
dev.off()