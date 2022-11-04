library(tidyverse)
library(gridExtra)
train = read_csv("data/train.csv")
weather_train = read_csv("data/weather_train.csv")
# plot(train$timestamp, train$meterreading)
meterTypes = c("Chilled Water", "Electric", "Hot Water", "Steam")

# This finds the building whose meter readings at some time during Oct-Dec are outliers and mess up dataset averages
outlier_building_id = train %>%
  filter(timestamp > as.POSIXct("2016-10-1"), timestamp < as.POSIXct("2016-12-1"), meter==2) %>%
  group_by(building_id) %>% summarise(max_reading = max(meter_reading)) %>%
  arrange(desc(max_reading)) %>%
  head(1) %>%
  pull(building_id)

meanMeterReadingPlot <- function(meterNo){
  train %>%
  filter(meter==meterNo) %>%
  filter(building_id!=outlier_building_id) %>%
  group_by(timestamp) %>%
  summarise(mean=mean(meter_reading)) %>%
  ggplot() + geom_point(aes(timestamp, mean)) + ggtitle(meterTypes[meterNo+1]) + xlab("Timestamp") + ylab("Mean Meter Reading")
}

plot0 <- meanMeterReadingPlot(0)
plot1 <- meanMeterReadingPlot(1)
plot2 <- meanMeterReadingPlot(2)
plot3 <- meanMeterReadingPlot(3)

plot4 <- weather_train %>% group_by(timestamp) %>% summarise(temp = mean(air_temperature)) %>%
  ggplot() + geom_point(aes(timestamp, temp)) + ggtitle("Mean Temperature") + xlab("Timestamp") + ylab("Mean Temperature")

grid.arrange(plot0, plot1, plot2, plot3, plot4,
             layout_matrix = rbind(c(1, 2),
                                   c(3, 4),
                                   c(5,5))
             )
