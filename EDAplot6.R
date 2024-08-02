# Assuming 'data' is your data frame
veh_SCC <- SCC[grepl("Vehicle", SCC$SCC.Level.Two), ]
veh_NEI <- NEI[NEI$SCC %in% veh_SCC$SCC, ]
baltm_veh <- subset(veh_NEI, fips == "24510")
veh_baltm_yc <- with(baltm_veh, tapply(Emissions, year, sum))
veh_baltm_yc <- as.data.frame(veh_baltm_yc)
losa_veh <- subset(veh_NEI, fips == "06037")
veh_losa_yc <- with(losa_veh, tapply(Emissions, year, sum))
veh_losa_yc <- as.data.frame(veh_losa_yc)
b_yc <- cbind(veh_baltm_yc, veh_losa_yc)
names(b_yc) <- c( "Baltimore", "Los.Angeles")
x = c(1999, 2002, 2005, 2008)
png("EDAplot6.png", width = 800, height = 800)

# Create a ggplot object
ggplot(data = b_yc, aes(x = x, y = Los.Angeles)) +
  # Add a line plot for Baltimore City
  geom_line(aes(color = "Los.Angeles"), size = 1.5) +
  # Add a line plot for Los Angeles
  geom_line(aes(x = x, y = Baltimore, color = "Baltimore", size = 1.5)) +
  xlab("Year") +
  ylab("Total emissions of PM2.5") +
  ggtitle("Emissions from motor vehicle sources in Baltimore City and Los Angeles") 

dev.off()