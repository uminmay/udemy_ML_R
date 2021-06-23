##Set Working directory
#setwd("path_to_working_directory")
##Select code snippet and press ctrl+Enter to run



#Import dataset
dataset = read.csv('Data.csv')

#'View(dataset)' to see the data

##HANDLE MISSING DATA
dataset$Age = ifelse(is.na(dataset$Age),ave(dataset$Age, FUN = function(x) 
  mean(x, na.rm = TRUE)),dataset$Age)

dataset$Salary = ifelse(is.na(dataset$Salary),ave(dataset$Salary, FUN = function(x) 
  mean(x, na.rm = TRUE)),dataset$Salary)

#ENCODE CATAGORICAL DATA

dataset$Country = factor(dataset$Country, levels = c('France', 'Spain',
                                                     'Germany'),
                         labels = c(1,2,3))
dataset$Purchased = factor(dataset$Purchased, levels = c('Yes', 'No'),
                         labels = c(1,0))

##SPLITTING TEST AND TRAINING DATA

## install library 'caTools' if not available

library(caTools)

set.seed(21787287) # similar as random_state=1 in python

split = sample.split(dataset$Purchased, SplitRatio = 0.8) # here we are choosing
#percentage for train set

#'split' to see which data went to train and which to test

training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)### IMPORTANT

###FEATURE SCALING make sure to exlcude non numeric

training_set[,2:3] = scale(training_set[,2:3])
test_set[,2:3] = scale(training_set[,2:3])


