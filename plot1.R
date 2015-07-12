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
## plotting the first chart now
png(file = "plot1.png", height = 480, width = 480)
with(data, hist(global.active.power, xlab = "Global Active Power (kilowatts)", 
                main = "Global Active Power", col = "red"))
dev.off()