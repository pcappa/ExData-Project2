# Plot 4 - US Coal Combustion Emissions

require(ggplot2)

# Read in the Particulate and Classification data.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Pprepare the data.  Find the classification codes for Coal and Combustion, then subset the data on both.

SCC.CoalComb <- SCC[c(grep("coal", SCC$SCC.Level.Four, ignore.case=TRUE), grep("combustion", SCC$SCC.Level.One, ignore.case=TRUE)),]$SCC
US.CoalComb <- NEI[NEI$SCC %in% SCC.CoalComb,]

# Plot the data.

png("plot4.png", width=480, height=480, bg="transparent")

g <- ggplot(US.CoalComb,aes(factor(year), Emissions/1000)) + 
  geom_bar(stat="identity", width=0.25) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="Year", y=expression("Total PM2.5 Emission (Tons/1000)")) + 
  labs(title=expression("PM2.5 Coal Combustion Emissions Across US from 1999-2008"))

print(g)
dev.off()