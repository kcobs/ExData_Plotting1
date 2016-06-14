##Get data
power <- read.table(file, header=T, sep=";")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
study_data <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
study_data$Global_active_power <- as.numeric(as.character(study_data$Global_active_power))
study_data$Global_reactive_power <- as.numeric(as.character(study_data$Global_reactive_power))
study_data$Voltage <- as.numeric(as.character(study_data$Voltage))
study_data <- transform(study_data, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
study_data$Sub_metering_1 <- as.numeric(as.character(study_data$Sub_metering_1))
study_data$Sub_metering_2 <- as.numeric(as.character(study_data$Sub_metering_2))
study_data$Sub_metering_3 <- as.numeric(as.character(study_data$Sub_metering_3))

##CREATE PLOT
plot3 <- function() {
         plot(study_data$timestamp,df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
        lines(study_data$timestamp,df$Sub_metering_2,col="red")
        lines(study_data$timestamp,df$Sub_metering_3,col="blue")
        legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
        dev.copy(png, file="plot3.png", width=480, height=480)
        dev.off()
          cat("plot3.png has been saved in", getwd())
      }
> plot3()