NEI$year <- as.factor(NEI$year)
# Assuming 'data' is your data frame
col_SCC <- SCC[grepl("Coal", SCC$EI.Sector), ]
col_NEI <- NEI[NEI$SCC %in% col_SCC$SCC, ]
library(tidyverse)
col_NEI_yc <- with(col_NEI, tapply(Emissions, year, sum))

png("EDAplot4.png", width = 480, height = 480)
plot(names(col_NEI_yc), col_NEI_yc, type = "l", xlab = "Year", ylab = "Total emissions of PM2.5", 
     main = "Emissions from coal combustion-related sources")

dev.off()

