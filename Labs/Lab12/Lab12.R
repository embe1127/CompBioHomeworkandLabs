rm(list=ls())
CameraTrapData <- read.csv("Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv" , stringsAsFactors = F )
#Step 1: Create a bar plot with ggplot
#need a way to create y value of count


ggplot(CameraTrapData)+
  geom_bar(mpaping = aes( x = CameraTrapData$Species, y = CameraTrapData$))