#Lab 03 Step 3, creating chip and guest variables
Bags_of_Chips_to_Start_With <- 5
Party_Guests <- 8
#Lab 03 step #05, storing the variable of how many bags of chips the average party goer will eat
Avg_Bag_of_Chips_Eaten_Per_Party_Guest <- .4
#Lab 03 step # 7, using the created variables to see how many bags of chips will be eaten and how many bags will be leftover
Bags_of_Chips_Eaten_by_Myself_and_Party_Guests <- (Party_Guests + 1) * Avg_Bag_of_Chips_Eaten_Per_Party_Guest
Bags_of_Chips_Eaten_by_Myself_and_Party_Guests
Leftover_Bags_of_Chips <- Bags_of_Chips_to_Start_With - Bags_of_Chips_Eaten_by_Myself_and_Party_Guests
Leftover_Bags_of_Chips
#There will be 1.4 bags of chips leftover.
#Lab 03 Step #8 creating vectors of a group of Star Wars movie rankings, with movies from 1- 7 in numerical order
My_StarWars_Rankings <- c(7, 6, 5, 1, 2, 3, 4)
Penny_Starwars_Ratings <- c(5, 7, 6, 3, 1, 2, 4)
Jenny_Starwars_Ratings <- c(4, 3, 2, 7, 6, 5, 1)
Lenny_Starwars_Ratings <- c(1, 7, 3, 4, 6, 5, 2)
Stewie_Starwars_Ratings <- c(6, 7, 5, 4, 3, 1, 2)
#Lab 03 Step #9 using indexing to to look at Penny and Lenny's specific ranking for the fourth movie
PennyIV <- Penny_Starwars_Ratings[4]
LennyIV <- Lenny_Starwars_Ratings[4]
#Lab 03 Step 10 Concatinating all the rankings into one data object
Data_Object_Starwars_Rankings <- cbind(My_StarWars_Rankings, Penny_Starwars_Ratings, Jenny_Starwars_Ratings, Lenny_Starwars_Ratings, Stewie_Starwars_Ratings)
#Lab 03 Step 11 Using str function to inspect the structure of PennyIV, Penny, and the new data frame created in step 10
str(PennyIV)
str(Penny_Starwars_Ratings)
str(Data_Object_Starwars_Rankings)
#There is a lot of difference in the str output for these three different variables-- for PennyIV it tells me what number is associated with that variable, while Penny's ratings output tells me how many numbers there are and what the numbers are. The data structure output is much more complex and seems to tell me my column names among a LOT of other data
#Lab 03 Step 12, Making a data frame from the vectors of rankings using the data.frame function and the as.data.frame function
Data_Frame_Starwars_Rankings <- data.frame(My_StarWars_Rankings, Penny_Starwars_Ratings, Jenny_Starwars_Ratings, Lenny_Starwars_Ratings, Stewie_Starwars_Ratings)
as.data.frame(Data_Frame_Starwars_Rankings)
dim(Data_Frame_Starwars_Rankings)
dim(Data_Object_Starwars_Rankings)
typeof(Data_Frame_Starwars_Rankings)
typeof(Data_Object_Starwars_Rankings)
str(Data_Frame_Starwars_Rankings)
str(Data_Object_Starwars_Rankings)
Data_Frame_Starwars_Rankings == Data_Object_Starwars_Rankings
#Lab 03 Step 13. The main difference seems to be that the row numbers are not in brackets, so it's a little more streamlined. Both have the vector names as the column headers. When I use the dim function, it tells me that the data frame and the data structure both have five columns and seven rows. When I use typeof function, though, the data frame is a list and the data object is listed as "double". With the str function, the data frame is a much easier output to read, as it tells me the numbers associated with each column. The output for the data object is a lot more complicated. The == function seems to tell me that both have the same values in the same places, though.  
#Lab 03 Step 14, making a vector with the episode names as roman numerals, which require quotes around them
Episode_Names <- c("I", "II", "III", "IV", "V", "VI", "VII")
#Lab 03 Step 15, I am using the row.names function to add row names to both the data frame and data object
row.names(Data_Frame_Starwars_Rankings)
row.names(Data_Frame_Starwars_Rankings) <-c (Episode_Names)
Data_Frame_Starwars_Rankings
row.names(Data_Object_Starwars_Rankings) <- c(Episode_Names)
Data_Object_Starwars_Rankings
#Lab 03 Step #16, I am using indexing to look at specific values within a 2 dimensional matrix. I want the third row of the data object.
Data_Object_Starwars_Rankings[3,]
#Lab 03 Step 17 using indexing to pull up the fourth column of the data frame
Data_Frame_Starwars_Rankings[,4]
#Lab 03 Step 18-19 Looking at my rating for episode V within the data frame and Penny's for episode II 
Data_Frame_Starwars_Rankings[5,1]
Data_Frame_Starwars_Rankings[2,2]
#Lab 03 Step 20, trying to index multiple rows/ columns. I want to index all the rankings for episodes 4-6. I've learned to use a colon. 
Data_Frame_Starwars_Rankings[4:6,]
#Lab 03 Step 21, trying to index multiple independent rows. I want to index rankings for episodes 2, 5, and 7. This will require me to create a vector of these specific rows. 
Data_Frame_Starwars_Rankings[c(2,7,5),]
#Lab 03 Step 22, trying to index Penny, Jenny, and Stewie's rankings for just episodes 4 and 6, which can be done by creating vectors for each row and columns
Data_Frame_Starwars_Rankings[c(4,6), c(2:3,5)]
#Lab 03 Step 23 How to swap rankings with 3 steps: make a swap variable of what is presently his ranking for the second episode by indexing that specific spot. Then I turned the ranking for the second episode in to the ranking for the fifth. Then I turned the fifth episode ranking in to my swap variable. 
swap_variable_Lenny_Ranking_Episode_2 <- Data_Frame_Starwars_Rankings[2,4]
Data_Frame_Starwars_Rankings[2,4] <- Data_Frame_Starwars_Rankings[5,4]
Data_Frame_Starwars_Rankings[5,4] <- swap_variable_Lenny_Ranking_Episode_2
Data_Frame_Starwars_Rankings
#Lab 03 step #24 playing around with ways to interact with individual numbers within matracies/ data frames by using the allRankings function. First I practiced using it to look up Penny's rating of episode 3. 
allRankings[3,2]
allRankings(Data_Object_Starwars_Rankings[3,2])
Data_Frame_Starwars_Rankings["III", "Penny_Starwars_Ratings"]
#Lab 03 step #25, swapping Lenny's rantings values back using the full name of the columns and rows. 
swap_variable_Lenny_Ranking_Episode_2_but_with_words <- Data_Frame_Starwars_Rankings["II", "Lenny_Starwars_Ratings"]
Data_Frame_Starwars_Rankings["II", "Lenny_Starwars_Ratings"] <- Data_Frame_Starwars_Rankings["V", "Lenny_Starwars_Ratings"]
Data_Frame_Starwars_Rankings["V", "Lenny_Starwars_Ratings"] <- swap_variable_Lenny_Ranking_Episode_2_but_with_words
Data_Frame_Starwars_Rankings
#Lab 03 step #26 swapping Lenny's ratings values again using the $ function
Data_Frame_Starwars_Rankings$Lenny_Starwars_Ratings[2]
swap_variable_Lenny_Ranking_Episode_2_but_with_dollar_sign <- Data_Frame_Starwars_Rankings$Lenny_Starwars_Ratings[2]
Data_Frame_Starwars_Rankings$Lenny_Starwars_Ratings[2] <- Data_Frame_Starwars_Rankings$Lenny_Starwars_Ratings[5]
Data_Frame_Starwars_Rankings$Lenny_Starwars_Ratings[5] <- swap_variable_Lenny_Ranking_Episode_2_but_with_dollar_sign
Data_Frame_Starwars_Rankings
