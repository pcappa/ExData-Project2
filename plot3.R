# Plot 3 - Baltimore Emissions by type (Point, Nonpoint, On-Road, Non-Road)

require(ggplot2)

# Read in the Particulate and Classification data.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Prepare the data by subsetting on the city of Baltimore. Then aggregate the data by emission type and year.

Baltimore.Emissions <- subset(NEI, fips == "24510")
a <- aggregate(Baltimore.Emissions[c("Emissions")], list(type=Baltimore.Emissions$type, year=Baltimore.Emissions$year), sum)

# Plot the data.

png("plot3.png", width=480, height=480, bg="transparent")

g <- qplot(year, Emissions, data=a, color=type, geom= "line") + theme_bw() +
    labs(x="Years", y=expression("Total PM2.5 Emissions")) + labs(title=expression("Baltimore 1999-2008 Emissions by Type"))

print(g)
dev.off()