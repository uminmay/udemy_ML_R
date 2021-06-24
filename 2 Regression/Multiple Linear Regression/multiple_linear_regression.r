##MULTIPLE LINEAR REGRESSION

# Data Preprocessing Template

# Importing the dataset
dataset = read.csv('50_Startups.csv')


#ENCODE CATGORICAL DATA
dataset$State = factor(dataset$State, 
                         levels = c('New York', 'California','Florida'),
                         labels = c(1,2,3))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

###FITTING MLR TO TRAINING SET
regressor = lm(formula = Profit ~ . - Country,training_set)

###PREDICTING TEST RESULTS

y_pred = predict(regressor,newdata = test_set)
## print y_pred and View(test_set) to compare results
