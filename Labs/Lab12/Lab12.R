rm(list=ls())
CameraTrapData <- read.csv("Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv" , stringsAsFactors = F )
#Step 1: Create a bar plot with ggplot
#need a way to create y value of count
head(CameraTrapData)

speciesData <- with(CameraTrapData, table(Species))
speciesData
#This gives me a count of how many times each species was documented. This is a good start.
SpeciesDF <- as.data.frame(speciesData)
SpeciesDF #this works
colnames(SpeciesDF)[2] <- "Count" 
SpeciesDF

library(ggplot2)
ggplot(data = SpeciesDF, aes(x= Species, y = Count))+
  geom_bar(stat = "identity", color = "pink", fill = "white")
#This worked


#Create with a more streamlined design so the x axis readable
ggplot(data = SpeciesDF, aes(x= Species, y = Count))+
  theme(axis.text.x = element_text(angle=90))+
  geom_bar(stat = "identity", color = "pink", fill = "white")

#Change orientation
ggplot(data = SpeciesDF, aes(x= Species, y = Count))+
  geom_bar(stat = "identity", color = "pink", fill = "white")+
  coord_flip()



