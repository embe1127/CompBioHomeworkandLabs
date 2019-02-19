#Step1: create an if-else statement to determine whether a random number x is larger than 5
x <- 10
if (x > 5) {
  print("more than five")
} else {
  print("less than five")
}

#Step2a: import csv file, write a for loop that replaces the negative values with "NA"
setwd("/Users/EmilyBeam/Desktop/Computational_Biology/compbiosandbox/CompBio_on_git/Labs/Lab05")
Vector1 <- read.csv(file = "Vector1.csv" , header = TRUE , sep = ",")

print(Vector1) #This worked. 

#parameters
lengthvect <- nrow(Vector1)

#for loop
for(i in 1:lengthofvect) {
  if (Vector1[i,1] < 0) {
    Vector1[i,1] <- NA
  }
}

#to check... 
print(Vector1)

#Step2b: write logical vectorized code that replaces "NA" with "NaN". There is an r function for testing whether something is an NA...Keep in mind indicing
#First, us is.na function to test if there are NAs
is.na(Vector1) #This worked. 

#change the NAs to NaNs
NAvector <- is.na(Vector1) #This gives me a variable that contains the NA values
Vector1[NAvector] 
AllNAsVector <- Vector1[NAvector] #This is logical indexing?
AllNAsVector
Vector1[is.na(Vector1)] <- NaN
Vector1

#Step 2c: use a which statement and integer indexing to replace NaNs with zeros
#change my Vector 1 to a vector as opposed to a data frame
NewVector1 <- Vector1$x
#Turn those NaNs to 0 using a which function, but this needs to be embedded in to my NewVector1 variable with square brackets. 
NewVector1[which(is.nan(NewVector1))] <- 0
NewVector1 #This worked!

#Step 2d and e: write a code to determine how many values fall between 50 and 100
Threshold50 <- 50
Threshold100 <- 100
FiftytoOneHundred <- which(NewVector1 >= Threshold50 & NewVector1 <= Threshold100)
length(FiftytoOneHundred) #This tells me that there are 498 entries that are between 50 and 100

#Step 2f: save FiftytoOneHundred to a csv file in my own Lab05 file
setwd("/Users/EmilyBeam/Desktop/Computational_Biology/CompBioHomeworkandLabs/Labs/Lab05")
write.csv(x = FiftytoOneHundred , file = "FiftytoOneHundred.csv")

#Step 3: Import the C02 file from last week
setwd("/Users/EmilyBeam/Desktop/Computational_Biology/CompBioHomeworkandLabs/Labs/Lab04")
CO2Emissions <- read.csv(file = "CO2_data_cut_paste.csv" , header = TRUE , sep = ",")

#Step3a: Determine the first year that "Gas" emissions were non-zero
which(CO2Emissions[,3] > 0) #The first value greater than zero was 135, and I can see that the first year is 1751, thus the answer to this plus 1751 will give me the first year
print(1751 + 135)
#The first year of non-zero numbers was 1886

#Step3b: Determine which years had "total" emissions between 200 and 300 million metric tonnes of carbon
TotalCO2Emissions <- CO2Emissions$Total
TargetTotalEmissions <- which(TotalCO2Emissions >= 2 & TotalCO2Emissions <= 3)
TargetTotalEmissions #This tells me that the first through twentieth year was in the target range. 
YearswithTargetTotal <- seq(0:20) + 1751 #This code tells me which years had total emissions more than 2 million and less than 3 million 

 #PART II: Set up parameter values for the Lotka-Volterra equation
totalGenerations <- 1000
initPrey <- 100 #prey abundance at time 1
initPred <- 10 #predator abundance at time 1
a <- .01 #predator attack rate 
r <- .2 #growth rate of prey
m <- .05 #predator mortality rate
k <- .1 #conversion constant of prey to into predators

amnttime <- seq(1:totalGenerations) #preallocation value
NValues <- rep(0 , totalGenerations) #preallocation value for prey
NValues[1] <- 100
PValues <- rep(0 , totalGenerations) #preallocation value for predators
PValues[1] <- 10

#Loop to calculate N and P values, with additional if statements built in to set values to zero if they are less than zero.
for(i in 2:totalGenerations) {
  NValues[i] <- NValues[i-1] + (r * NValues[i-1]) - (a * NValues[i-1] * PValues[i-1])
  PValues[i] <- PValues[i-1] + (k * a * NValues[i-1] * PValues[i-1]) - (m * PValues[i-1])
  if(NValues[i] < 0) {
    NValues[i] <- 0
  }
  if(PValues[i] < 0) {
    PValues[i] <- 0
  }
}
NValues
PValues

#Plot this data for abundances of prey and predators over time
plot(amnttime , NValues)
lines(amnttime , NValues)

plot(amnttime , PValues)
lines(amnttime , PValues)

#Create a matrix of my data and save that to a .csv
MyResults = matrix(
  c(PValues, NValues),
  nrow= totalGenerations,
  ncol= 2
  )
MyResults #I think this worked...
setwd("/Users/EmilyBeam/Desktop/Computational_Biology/CompBioHomeworkandLabs/Labs/Lab05")
write.csv(x = MyResults , file = "PredPreyResults.csv" )

