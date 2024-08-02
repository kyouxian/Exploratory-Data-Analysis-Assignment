setwd("D:/Datascience/Projects/DataScienceJHU-")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(tidyverse)
# 1. Have total emissions from PM2.5 decreased in the United States from 1999 to 
# 2008? Using the base plotting system, make a plot showing the total PM2.5 
# emission from all sources for each of the years 1999, 2002, 2005, and 2008.
NEI$year <- as.factor(NEI$year)
NEI_yc <- with(NEI, tapply(Emissions, year, sum))
png("EDAplot1.png")
plot(names(NEI_yc), NEI_yc, type = "l", xlab = "Year", ylab = "Total emissions of PM2.5")
dev.off()