#Lab7 Prob 1: create my own function that can calculate the area of a triangle
triangleArea <- function(height, base) {
  #Step 1: input the triangle base and height
  HBSum <- height * base
  #Step 2: multiply them together
  MyArea <- HBSum * .5
  #Step 3: multiply this answer by .5
  return(MyArea)  
}

#Call the function...Now, I will check that it works with a triangle with a height of 6 and a base of 9
triangleArea(6,9)
#It works!

#If my triangle has a base of 10 and a height of 9 the area is...
triangleArea(9,10) #It works!


#Prob 2: Create a function myAbs that calculates the absolute value of a number 
#define a function to look at a given value of i
MyAbs <- function(xVec) {
  for(i in 1:length(xVec)) {
    if(xVec[i] < 0){
      xVec[i] <- - xVec[i]
    } #if the value is less than zero, MyAbsVar is the negative of the negative, making that number positive
  }
  #return value of MyAbsVar 
  return(xVec)
}

#Calling the function  
#check with value = 5
MyAbs(5) #This works
#check with value = -2.3
MyAbs(-2.3) #This works!
#check with c(1.1, 2, 0, -4.3, 9, -12)
y <- c(1.1, 2, 0, -4.3, 9, 12)
MyAbs(y) #This works!

#Problem 3: Write a function that returns a vector of the first n Fibbonaci sequenece, where n is equal to or greater than 3.
#This function will have two arguments: value of n and desired starting number (0 or 1)
#length of the output sequence will be n long
#will either start with 1 or zero, which will change the for loop

FibFunc <- function(n, initial) {
  if(initial > 1) {
    print("Error: initial argument not 0 or 1")
  } else {
    #create a fib seq n variables long starting with initial
    Fibseq <- rep(0 , n)
    Fibseq[1] <- initial
    Fibseq[2] <- 1
    #create a forloop to run through the equation to get the fib seq
    for(i in 3:n) {
      Fibseq[i] <- Fibseq[i-1] + Fibseq[i-2]
    }  
  }
  #want the function to spit out the first n #s of Fib starting with initial
  return(Fibseq)
}

#call the function
FibFunc(10 , 1) #This works!
FibFunc(5, 0)
FibFunc(10,3)

#Problem 4: create a function that takes the square of the difference between two numbers
SqDiff <- function(j, k) {
  #get the difference of j and k
  Dif <- j-k
  MySqDiff <- Dif ^2
  return(MySqDiff)
}
#Call the function
SqDiff(8,3) #This works
SqDiff(5,3)

#Problem 4b: define a function that calculates average
MyMean <- function(VectorX) {
  #add the numbers all together
  MySum <- sum(VectorX)
  #divide that number by the length of the vector
  MyAvg <- MySum / length(VectorX)
  return(MyAvg)
}
#calling the function
MyMean(c(5,15,10)) #This works 

#call the function using the csv file, which is a dataframe

MyMean(DataForLab07$x) #This works 

#Problem 4c: create a function that calculates the sum of squares 

SumOSquares <- function(VectorA) {
  #calculate the mean of the dataset (use MyMean)
  TheAvg <- MyMean(VectorA)
 
  #preallocation vector!
  SquaredDifferencesVect <- rep(0, length(VectorA))
  
  #subtract the mean from each individual number in the dataset (use a for loop?)
  #square that difference (use SqDiff) 
  
  for(i in 1:length(VectorA)) {
    SquaredDifferencesVect[i] <- SqDiff(VectorA[i], TheAvg)
  }
  #the differences are all summed
  SummedSquaredDifference <- sum(SquaredDifferencesVect)
  return(SummedSquaredDifference)
}

#Call the function
SumOSquares(DataForLab07$x) #This worked!


    