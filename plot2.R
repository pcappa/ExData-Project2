## Plot 2 - Baltimore total emissions trend using base plotting package

# Read in the Particulate and Classification data.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Prepare the data by finding the emissions for the city of Baltimore.  Then aggregate by year.

Baltimore.NEI.subset <- NEI[which(NEI$fips=="24510"),]
result <- aggregate(Emissions ~ year, Baltimore.NEI.subset, sum)

# Plot the data.

png("plot2.png", width=480, height=480, bg="transparent")

barplot(result$Emissions/1000, main="Baltimore 1999-2008 Total Pollutants", names.arg=result$year, 
        xlab="Year", ylab="Polluntants Tons/1000")

dev.off()