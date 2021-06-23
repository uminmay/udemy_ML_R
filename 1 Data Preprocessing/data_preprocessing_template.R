
#Import dataset
dataset = read.csv('Data.csv')

#select subset of dataset
#datasubset = dataset[, 2:3]

##SPLITTING TEST AND TRAINING DATA

library(caTools)

set.seed(21787287)
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#FEATURE SCALING make sure to exlcude non numeric

#training_set[,2:3] = scale(training_set[,2:3])
#test_set[,2:3] = scale(training_set[,2:3])
