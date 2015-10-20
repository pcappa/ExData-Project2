#  Plot 5 - Emissions from motor vehicle sources in Baltimore

require(ggplot2)

# Read in the Particulate and Classification data.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Prepare the data - find the vehicle classifications, the emissions for the Baltimore, and the subset both.

SCC.Vehicle <- SCC[grep("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE),]$SCC
Baltimore.Emissions <- NEI[which(NEI$fips=="24510"),] 
Vehicle.Emissions <- Baltimore.Emissions[Baltimore.Emissions$SCC %in% SCC.Vehicle,]

# Plot the data.

png("plot5.png", width=480, height=480, bg="transparent")

g <- ggplot(Vehicle.Emissions, aes(factor(year), Emissions/1000)) + theme_bw() +
  geom_bar(stat="identity", width=0.25) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="Year", y=expression("Total PM2.5 Emission (Tons/1000)")) + 
  labs(title=expression("PM2.5 Vehicle Emissions in Baltimore from 1999-2008"))

print(g)
dev.off()