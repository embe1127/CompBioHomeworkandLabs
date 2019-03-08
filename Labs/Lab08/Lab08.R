#Work from Lab04
#Use the discrete-time logistic growth equation to create a loop to print out abundances over 12 years 

#parameters
Pop_at_time_1 <- 2500
CarryingCapacity <- 10000
IntrinsicGrowthRate <- 0.8
TimeSeq <- seq(1:12)

#preallocation parameters
numberoftimes <- length(TimeSeq)
PopulationAbundancePart4 <- rep(0, numberoftimes)
PopulationAbundancePart4[1] <- Pop_at_time_1

#calculations
for(i in 2:numberoftimes) {
  PopulationAbundancePart4[i] <- PopulationAbundancePart4[i - 1] + (IntrinsicGrowthRate * PopulationAbundancePart4[i- 1] * (CarryingCapacity - PopulationAbundancePart4[i - 1]) / CarryingCapacity)
}

#checking
PopulationAbundancePart4

#print out the value for t= 12

print(PopulationAbundancePart4[12]) #It works!!

#Make a vector for time and a vector for the data and plot 
#parameters
Time <- seq(1:12)

#plot
plot(Time, PopulationAbundancePart4)

#Take this data and turn the logistic growth model code into a function that takes r (the intrinsic growth rate), K (the carrying capacity), the total number of generations, and the intitial population size as arguments

LogGrowthModel <- function(r , K , gen , initpop) {
  #parameters
  CarryingCapacity <- K
  IntrinsicGrowthRate <- r
  TimeSeq <- seq(1: gen)
  
  #preallocation parameters
  numberoftimes <- length(TimeSeq)
  PopulationAbundance <- rep(0, numberoftimes)
  PopulationAbundance[1] <- initpop
  
  #calculations
  for(i in 2:numberoftimes) {
    PopulationAbundance[i] <- PopulationAbundance[i - 1] + (IntrinsicGrowthRate * PopulationAbundance[i- 1] * (CarryingCapacity - PopulationAbundance[i - 1]) / CarryingCapacity)
  }
  #plot
  time <- seq(1:gen)
  plot(time, PopulationAbundance)
  return(LgGrwthModResults <- cbind(gen, PopulationAbundance))
         colnames(LgGrwthModResults) <- c("Generations", "Abundance")
}

#Check with parameters, I'll use the numbers from lab 4 to double check my work
MyResults <- LogGrowthModel(.8 , 10000 , 12 , 2500) #This looks like it works

#Now, write the data set to a file in the lab08 folder

setwd("/Users/EmilyBeam/Desktop/Computational_Biology/CompBioHomeworkandLabs/Labs/Lab08")
write.csv(x = MyResults , file = "LogarithmicGrowthModel.csv" )
