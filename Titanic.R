# December 2016- Springboard.com script for Titanicexercise Pierre Carpentier
# Fundamentals of Data Science- Data Wrangling

# load kaggle data sets for Titanic
library(readxl)
library(dplyr)
library(tidyr)
titanic3 <- read_excel("C:/Users/greed/OneDrive/Documents/Springboard/titanic3.xls")
View(titanic3)

# Question1: Port of embarkation- change missing values to S
# Need to make blank characters equals to NA
is.na(titanic3$embarked[titanic3$embarked ==''])
sum(is.na(titanic3$embarked))

#using replace function to replace NA by 'S' in titanic$embarked
titanic3$embarked <- replace(titanic3$embarked, which(is.na(titanic3$embarked)), 'S')
#Make sure there are no more NA's, sum must be = 0
sum(is.na(titanic$embarked))

# 2: Age. Calculate mean value and is that value to populate missing values
Mean.Age <- mean(titanic3$age, na.rm = TRUE) 
titanic3$age <- replace(titanic3$age, which(is.na(titanic3$age)), Mean.Age)
#check the sum to equal 0
sum(is.na(titanic3$age))

#3: Lifeboat- fill missing values with dummy character 'none'
is.na(titanic3$boat[titanic3$boat =='']) <- TRUE
titanic3$boat <- replace(titanic3$boat, which(is.na(titanic3$boat)), 'none')
#check sum equals zero and check that NA's were replaced 
sum(is.na(titanic3$boat))
glimpse(titanic3$boat)

#4: Cabin- create new column with cabin number indicator 1 or 0.
is.cabin <- ifelse(titanic3$cabin == '', 0, 1)
titanic4 <- titanic3 %>% mutate(has_cabin_number = is.cabin)
glimpse(titanic4) 

#write to csv 
write.csv(titanic4, file = 'titanic_clean.csv')