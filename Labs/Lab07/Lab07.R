#Lab7 Step 1: create my own function that can calculate the area of a triangle
triangleArea <- function(height, base) {
  #Step 1: input the triangle base and height
  HBSum <- height * base
  #Step 2: multiply them together
  #Step 3: multiply this answer by .5
  return(HBSum * .5)  
}

#Now, I will check that it works with a triangle with a height of 6 and a base of 9
triangleArea(6,9)
#It works!

#If my triangle has a base of 10 and a height of 9 the area is...
triangleArea(9,10) #It works!

