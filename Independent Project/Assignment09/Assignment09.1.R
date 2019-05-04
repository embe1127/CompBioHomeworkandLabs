rm(list=ls())
#Overarching Question: Can I manipulate this data such that I can see
# when hyena individuals were at anthropogenic elephant carcasses?
# Can I compare male visits to female visits?

#Step 1: 
#Import elephant carcass location and hyena csv files
ElephantData <- read.csv("elephant_carcasses.csv", header = TRUE)
head(ElephantData)
HyenaData <- read.csv("hyena_locations.csv", header = TRUE)
head(HyenaData)
#This looks correct.

#Step 2: 
#Determine how many unique indivudal hyenas there are 

HyenaNames <- unique(HyenaData$Ind)
#I did it! There are 15 individuals listed

#Step 3: 
#Create a usable dataframe of the elephant carcasses to use in my analysis:
#Step 3A:
#I want only the unnatural elephant deaths so that 
#I am not also looking at natural deaths.

ElephantData
which(ElephantData$cause == "natural")
ShotElephants <- ElephantData[-c(9, 17, 24),]

#Step 3B:
#Make a column that keeps a count of the carcassess to give them
# a unique ID number 
ShotElephants$EleID <- seq.int(nrow(ShotElephants))
head(ShotElephants)
#Now I only have anthropogenic carcasses at 22 locations

#Step 4: 
#Create a for loop that runs through both the hyena DF and the
#shot elephants DF to match longitudinal and latitudinal points.

#Step 4A:
#However, they do not have to be right on the carcass to be 
#considered interacting with the carcass. A change in decimal
#longitude and latitude values of .0001 is only a change of around
#10 m for both measures, and therefore would be considered within
#my designation of "carcass zone".

#create a variable for this decimal change
Delta <- .0001

#Step 4B:
#Then, preallocate a matrix for the for loop to spit values out into
HyenaID <- unique(HyenaData$Ind)
EleCarcassID <- unique(ShotElephants$EleID)
NewDF <- expand.grid(HyenaID, EleCarcassID)
NewDF #This has 315 obs, which is correct

#expand.grid is really cool and created a dataframe with all my 
#hyena individuals matched with each elephant carcass id.
#The columns still need to be named: 
colnames(NewDF)[1] <- "HyenaID"
colnames(NewDF)[2] <- "EleID"

#Need to add a column where my values from the for loop can go
NewDF["InZone"] <- 0
#This worked!!

#Add a column for sex values
NewDF["HyenaSex"] <- "M"

#Find the females to change the values to "F"

HyenaNames
#Females: Athena, Ginger, Tori, Vera (THIS IS AN ASSUMPTION FOR THE SAKE OF PRACTICING ANALYSIS, it is hard to dertermine sex of ind from name)
NewDF$HyenaSex[which(NewDF$HyenaID == "Athena")] <- "F"
NewDF$HyenaSex[which(NewDF$HyenaID == "Ginger" | NewDF$HyenaID == "Tori" | NewDF$HyenaID == "Vera")] <- "F"

#Did this work?
NewDF
#Yes!

#Step 4C:
#Now, the for loop needs to be constructed.
#For every ith variable from 1 to the number of rows in my HyenaData
for(i in 1:nrow(HyenaData)) {
  #and for every jth variable from 1 to the number of rows in my ShotElephants
  for(j in 1:nrow(ShotElephants)) {
    #If the longitude and latitude match within a range of plus or minus Delta, 
    if((ShotElephants$lat[j] - Delta <= HyenaData$Lat[i]) & (HyenaData$Lat[i] <= ShotElephants$lat[j] + Delta) & 
       (ShotElephants$long[j] - Delta <= HyenaData$Lon[i]) & (HyenaData$Lon[i] <= ShotElephants$long[j] + Delta)) {
      #Then the ith row of the NewDF should be matched with the ith hyena individual and the jth elephant carcass
      FocalRow<- which(NewDF$HyenaID == HyenaData$Ind[i] & NewDF$EleID == ShotElephants$EleID[j])
      #And the associated row and column (InZone) should get a plus one
      NewDF$InZone[FocalRow] <- NewDF$InZone[FocalRow] + 1 
      #If they do not match and fall within the range, the InZone column gets a zero added 
    }  
  }
}

NewDF
#This looked like it worked...However, there are some NA values
which(is.na(NewDF$InZone))
#Within the InZone Column, row 181 is an NA
#For the sake of moving forward, I will change this NA to 0, and then come back to check it out
NewDF$InZone[181] <- 0
#Check to see if this worked:
which(is.na(NewDF$InZone))
#Looks ok
NewDF

#Are there any NAs elsewhere?
which(is.na(NewDF))
#Yes... 316
#Lets look:
tail(NewDF)
#It looks like my for loop added an extraneous row
TrimNewDF <- NewDF[-c(316),]
TrimNewDF

library(dplyr)
SortedNewDF <- group_by(TrimNewDF, HyenaID)
SortedNewDF
#This seems to just sort my names in alphabetical order over and over again. This is not what I want. 
#What I want:
#One row for each hyena
#And a column InZoneCount that tallies up how many times each individual has been in the zone
#Lose: which carcass is visited

SumNewDF <- summarise(group_by(TrimNewDF, HyenaID), 
                      AvgInZone = mean(InZone))
SumNewDF

#Step 5: 
#Because I'm curious, create a ggplot for each individual in terms of "in zone" vs non in the zone
library(ggplot2)
IndividualsPlot <- ggplot(data = SumNewDF,aes(x = HyenaID, y = AvgInZone)) +
  geom_bar(stat = "identity")

#Step 6:
#Create ggplot in which female "in zone" numbers are compared to male "in zone" numbers... I'm imagining some type of bargraph?
#Group the data by HyenaSex, and then get a count for M and F
GenderedSumNewDF <- summarise(group_by(TrimNewDF, HyenaSex),
                              AverageVisit = mean(InZone))

GenderedSumNewDF
GenderedPlots <- ggplot(data = GenderedSumNewDF, aes(x= HyenaSex, y= AverageVisit))+
  geom_bar(stat="identity")

#Is there a way that I can add error bars?
GroupedNewDF <- group_by(TrimNewDF, HyenaID)
GroupedNewDF
SumGroupedNewDF <- summarize(GroupedNewDF, 
                             AverageVisit = mean(InZone), 
                             SD = sd(InZone), #add standard deviation
                             SE = sd(InZone)/sqrt(n()), #add standard error
                             N = n()) #add n 
SumGroupedNewDF #it worked
IndividualsPlot <- ggplot(data = SumGroupedNewDF,aes(x = HyenaID, y = AverageVisit)) +
  geom_bar(stat = "identity", color= HyenaID, fill = "white")+
  geom_errorbar(aes(ymin= AverageVisit - SE, ymax= AverageVisit + SE), 
                width = .2, position= position_dodge(.9))
IndividualsPlot
#Ok, so there's some sig diff in the data
#Save the plot
ggsave("IndividualAvgVisits.jpg")

GenderedNewDF <- group_by(TrimNewDF, HyenaSex)
SumGenderedGroupedNewDF <- summarize(GenderedNewDF, 
                                     AverageVisit= mean(InZone),
                                     SD= sd(InZone),
                                     SE = sd(InZone)/sqrt(n()),
                                     N = n())
SumGenderedGroupedNewDF
GenderedPlots <- ggplot(data = SumGenderedGroupedNewDF, aes(x= HyenaSex, y= AverageVisit))+
  geom_bar(stat="identity", color = "pink", fill= "white")+
  geom_errorbar(aes(ymin=AverageVisit - SE, ymax= AverageVisit + SE), 
                width = .2, position= position_dodge(.9))
GenderedPlots
ggsave("AvgVisitsbyGender.jpg")

#Step 7: 
#Make another bar graph that shows the variation in carcass visits by carcass
#Step 7A: Make a dataframe to use
GroupedCarcassDF <- group_by(TrimNewDF, EleID)
GroupedCarcassDF
SumGroupedCarcassDF <- summarize(GroupedCarcassDF, 
                             AverageVisit = mean(InZone), 
                             SD = sd(InZone), #add standard deviation
                             SE = sd(InZone)/sqrt(n()), #add standard error
                             N = n()) #add n 
SumGroupedCarcassDF
#Step 7B: Graph
CarcassPlot <- ggplot(data=SumGroupedCarcassDF, aes(x=EleID, y=AverageVisit))+
  geom_bar(stat="identity", fill = "pink")+
  geom_errorbar(aes(ymin= AverageVisit-SE, ymax= AverageVisit + SE),
                width= .2, position= position_dodge(.9))
CarcassPlot #Cool!!
ggsave("AvgVisitsbyCarcass.jpg")

#Step 8:
#Create a pie chart telling me which of the hyenas was most keen on the 
#anthropogenic carcasses

#Create a dataframe with just the indv with numbers in SumGroupedNewDF$AverageVisit
which(SumGroupedNewDF$AverageVisit == 0)
#Remove row 1, 3, 5, 9, 12-13, 15
HyenasWithVisits <- SumGroupedNewDF[-c(1,3,5,9,12:13,15),]

#create a bar graph first
bp <- ggplot(HyenasWithVisits, aes(x = "", y = AverageVisit, fill = HyenaID)) +
  geom_bar(width = 1, stat= "identity")

#create the pie chart using that bar graph
PieChart <- bp + coord_polar("y", start = 0)
PieChart
ggsave("IndividualswithVisitsPieChart.jpg")
