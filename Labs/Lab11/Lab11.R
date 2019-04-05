#Step one: Import the file as just the sheet with the data, saved as a csv file
rm(list=ls())
WoodDB <- read.csv("GlobalWoodDensityData.csv" , stringsAsFactors = F )

#Change the column names if they are too long
colnames(WoodDB)[4] <- "WoodDensity"
head(WoodDB)
#It worked

#Step 2: Determine which entry is entered as NA for "Wood Density" and remove it

#Determine which row
#My plan: Use is.na for that column
is.na(WoodDB$`WoodDensity`)
#This would still require me to just scroll through, but look for a TRUE isntead of an 
#empty column
which(is.na(WoodDB$`WoodDensity`))
#Output is 12150... I think this tells me that number 
#12150 has an NA value for 'WoodDensity'
#This worked

#Remove it
FinalWoodDB <- WoodDB[-c(12150), ] #It would be my instinct to use row 12151 bc that is how
#it appears in the csv file, but maybe R knows to not count headers
#Check
which(is.na(FinalWoodDB$`WoodDensity`))
#this works

#Step 3: Create a new dataframe that displays averaged 'WoodDensity' when multiples
#of a species are present
#My plan: Use diplyr, summarize() and group_by()

library(dplyr)
AvgWoodDB <- summarise(group_by(FinalWoodDB, Binomial), 
                       AverageWoodDensity = mean('Wood Density'))
head(AvgWoodDB)
#This didn't work
SlimWoodDB <- select(FinalWoodDB, Binomial, Family, WoodDensity )
head(SlimWoodDB)
#This gives me a dataframe without the excess variables
AvgWoodDB <- summarize(group_by(SlimWoodDB,Binomial, Family), 
                       MeanWD = mean(WoodDensity))
AvgWoodDB
#I think this worked!

#BONUS: Create a new dataframe that has the average density for family, not species 
FamAvgWoodDB <- summarise(group_by(SlimWoodDB, Family), 
                          MeanWD = mean(WoodDensity))
FamAvgWoodDB

#Sort the dataframe
SortedFamAvgWoodDB <- arrange(FamAvgWoodDB, MeanWD)
SortedFamAvgWoodDB
#This worked. 

HighDens <- tail(SortedFamAvgWoodDB, 8)
HighDens
#Highest wood density families:  Hypericaceae, Zygophyllaceae, 
# Irvingiaceae, Sarcolaenaceae, Surianaceae, Linaceae, Bonnetiaceae,Quiinaceae 

LowDens <- head(SortedFamAvgWoodDB, 8)
LowDens
#Lowest wood density families: Caricaceae, Paulowniaceae, Moringaceae, Hernandiaceae, 
# Bixaceae, Muntingiaceae, Datiscaceae, Tetramelaceae

#Step 4: Plot data

#Plot the densities of species from the same families 
#Get a dataframe with only data from the lowest density families 
#(listed above, there are eight of them)
#I know that I want to pull from AvgWoodDB
LowDensDB <-filter(AvgWoodDB, Family %in% LowDens$Family)
LowDensDB
#It worked, thank you Sam!!

HighDensDB <- filter(AvgWoodDB, Family %in% HighDens$Family)
HighDensDB

#Now, plot each 
ggplot(data = LowDensDB)+
  geom_boxplot(mapping = aes(x = factor(0), y = MeanWD))+
  facet_wrap(~ Family) 

ggplot(data = HighDensDB)+
  geom_boxplot(mapping = aes(x= factor(0), y= MeanWD))+
  facet_wrap(~Family)

#This works!

#Step 5: Graph these such that they can be compared in a single graph
LowHighDB <- rbind(LowDensDB , HighDensDB)
LowHighDB
#potentially not necessary

ggplot(data = LowDensDB)+
  geom_boxplot(mapping = aes(x = Family, y = MeanWD))+
  coord_flip()

ggplot(data = HighDensDB)+
  geom_boxplot(mapping = aes(x = Family, y = MeanWD))+
  coord_flip()


