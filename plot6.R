# Plot 6 - Compare Emissions between Baltimore and Los Angeles

require(ggplot2)

# Read in the Particulate and Classification data.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Prepare the data - find the vehicle classifications, the emissions for the cities, and the subset both.

SCC.Vehicle <- SCC[grep("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE),]$SCC
City.Emissions <- subset(NEI, (NEI$fips == "24510" | NEI$fips == "06037"))
Vehicle.Emissions <- City.Emissions[City.Emissions$SCC %in% SCC.Vehicle,]
a <- aggregate(Vehicle.Emissions[c("Emissions")], list(type=Vehicle.Emissions$fips, year=Vehicle.Emissions$year), sum)

# Plot the data.

png("plot6.png", width=480, height=480, bg="transparent")

g <- qplot(year, Emissions, data=a, color=type, geom= "line") + theme_bw() +
    scale_colour_discrete(name="City", labels=c("Los Angeles", "Baltimore")) +
    labs(x="Years", y=expression("Total PM2.5 Emissions (Tons/1000")) + 
    labs(title=expression("Baltimore & Los Angles Emissions 1999-2008"))

print(g)
dev.off()