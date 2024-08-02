NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(tidyverse)
NEI$year <- as.factor(NEI$year)
baltm <- subset(NEI, fips == "24510")
baltm_ytc <- with(baltm, tapply(Emissions, list(year, type), sum))
baltm_ytc <- as.data.frame(baltm_ytc)
names(baltm_ytc) <- c("year", "type", "emission")
png("EDAplot3.png", width = 480, height = 480)
ggplot(baltm_ytc, aes(year, emission, color = type)) + 
  geom_line(aes(group = type)) +
  guides(color = guide_legend(title = "Type")) +
  labs(title ="Total emissions of PM2.5 in the Baltimore City, Maryland")

dev.off()
