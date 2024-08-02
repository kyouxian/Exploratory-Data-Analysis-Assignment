# Assuming 'data' is your data frame
veh_SCC <- SCC[grepl("Vehicle", SCC$SCC.Level.Two), ]
veh_NEI <- NEI[NEI$SCC %in% veh_SCC$SCC, ]
baltm_veh <- subset(veh_NEI, fips == "24510")
veh_baltm_yc <- with(baltm_veh, tapply(Emissions, year, sum))

png("EDAplot5.png", width = 480, height = 480)
plot(names(veh_baltm_yc), veh_baltm_yc, type = "l", xlab = "Year", ylab = "Total emissions of PM2.5", 
     main = "Emissions from motor vehicle sources in Baltimore City")
dev.off()