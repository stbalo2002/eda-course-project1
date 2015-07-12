##if the working directory is not the directory that contains the unzipped project,
##kindly set the working directory to the directory that has the unzipped project
##i.e.(household_power_consumption.txt)
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
##plotting the graph now...
png(file = "plot2.png", height = 480, width = 480)
with(data, plot(datetime, global.active.power, type = "l", 
      ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()