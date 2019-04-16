#clear out R environment
rm(list=ls())
#Import the dataset from Sam's files on my desktop
#Then, set the working directory
#import dataset with stringAsFactors set to false
camData <- read.csv("Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv" , stringsAsFactors = F)

#Problem 1: Want to try and convert dates and times into actual objects that represent time as opposed to being character strings
camData
camData$DateTime
#DateTime seem to be in a day/month/year 24:60 format
#break it up a little bit 
smDateTime <- camData$DateTime[1:10]

strptime(smDateTime, format = "%d/%m/%Y %H:%M")
numSmDateTime <- strptime(smDateTime, format = "%d/%m/%Y %H:%M") 
str(numSmDateTime)
#I think this worked...

NewDateTime <- strptime(camData$DateTime, format = "%d/%m/%Y %H:%M")
NewDateTime
#Problem 2: figure out which datetime entries are "broken" with only 2 digit years

#seems like one could use as.numeric potentially to convert a date to internal form... but do I need to separate the date from the time?
myDate <- as.numeric(NewDateTime)
myDate
#Negative values are the problematic dates

#Problem 3: Ok, so how do I use this information to then get what I want
TroubleDate <- which(myDate < 0)
TroubleDate
#This has just my problematic dates
#These numbers are supposed to be the number of seconds since the first of the year, 1970
DatesToChange <- camData$DateTime[TroubleDate]
DatesToChange
CorrectedDates <- strptime(DatesToChange , format = "%d/%m/%y %H:%M")
CorrectedDates
#This worked

#Now, how to assimilate the new, corrected data into the NewDateTime variable
BestDateTime <- NewDateTime[CorrectedDates]
#This does not work




#In class working with lubridate

#One function to correct all dates
datesAndTime <- parse_date_time( camData$DateTime, orders = c("dmYHM", "dmyHM") )
datesAndTime
#this worked