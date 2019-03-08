#STEP 1: Write a loop for "hi" such that it prints 10 times
#parameters
HiSeq <- seq(1:10)

#calculations
for(i in HiSeq) {
  print("hi")
}

#STEP 2: Write a loop that shows how much money Tim has after 8 weeks, taking in to account his initial balance, his allowance, and his expenditures. 
#parameters
TimsInitial <- 10
TimsAllowance <- 5
TimsExpenditures <- 2 * 1.34
TimsSeq <- seq(1:8)

#calculations
for(i in TimsSeq) {
  print(TimsInitial + (TimsAllowance * i) - (TimsExpenditures * i))
}

#STEP 3: Write a loop that calculates the population size of a specific population for the next seven years. 
#parameters
PopInitial <- 2000
PopRate <- .95
PopSeq <- seq(1:7)

#parameters for preallocation
numTimes <- length(PopSeq)
PopAbundance <- rep(0, numTimes)

#calculations
for( i in 1:numTimes) {
  PopAbundance[i] <- PopInitial * (PopRate ^ PopSeq[i] )
}

#check calculation
print(PopAbundance) #It works!

#STEP 4: Use the discrete-time logistic growth equation to create a loop to print out abundances over 12 years 
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

#STEP 5A: Use the rep command to make a vector with 18 zeros
rep(0 , 18 )

#create a variable to hold this vector
MyVecForPart5 <- rep(0 , 18)

#check
MyVecForPart5 #this worked

#STEP 5B: Write a loop that is iterated 18 times that will make the loop print out the value of 3 times the ith value of i in the ith spot from the vector from part A
#parameters
NumbTimes <- length(1:18)

#calculation
for(i in 1:NumbTimes) {
   MyVecForPart5[i] <- 3 * i
}

#check
MyVecForPart5 #it worked!!

#STEP 5C: Repeat step A to make a new vector of zeros and then make the first entry '1' 
NewVector <- rep(0, 18)
NewVector[1] <- 1

#check
NewVector #it worked!

#STEP 5D: Write a loop so that starting with the second entry of the vector created in part c such that the value stored in that position is equal to one plus twice the value of the previous number
#preallocation
Times <- length(1:18)
StepDVec <- NewVector

#calculation
for(i in 2:Times) {
  StepDVec[i] <- 1 + (2 * StepDVec[i - 1])
}

#check
StepDVec #it worked!

#STEP 6: Create a loop to read out the Fibonacci Sequence for the first 20 numbers
#parameters
NumOfTimes <- length(1:20)

#preallocation 
FibSeq <- rep(0, 20)
FibSeq[1] <- 0
FibSeq[2] <- 1

#calculation
for(i in 3:NumOfTimes) {
  FibSeq[i] <- FibSeq[i - 1] + FibSeq[i - 2]
}

#check
FibSeq #it worked! It is also stored in that variable FibSeq. 

#STEP 7: Make a vector for time and a vector for the data (from step 4) and plot 
#parameters
Time <- seq(1:12)

#plot
plot(Time, PopulationAbundancePart4)

