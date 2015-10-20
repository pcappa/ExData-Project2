# Plot 1 - U.S. total emissions trend using base plotting package 

# Read in the Particulate and Classification data.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Prepare the data by aggregating it by year.

result <- aggregate(Emissions ~ year, NEI , sum)

# Plot the data

png("plot1.png", width=480, height=480, bg="transparent")
barplot(result$Emissions/1000, main="U.S. 1998-2008 Total Pollutants", names.arg=result$year, 
        xlab="Year", ylab="Polluntants Tons/1000")

dev.off()