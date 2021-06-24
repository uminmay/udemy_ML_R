#Simple Linear Regression

# Data Preprocessing Template

# Importing the dataset
dataset = read.csv('Salary_Data.csv')
#dataset = dataset[,2:3]

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

regressor = lm(formula = Salary ~ YearsExperience, data = training_set)

###predictions

y_pred = predict(regressor, newdata = test_set)


### plotting

library(ggplot2)
## plot train data
ggplot(training_set, aes(x=YearsExperience, y=Salary))+geom_point()+
  geom_line(aes(x = training_set$YearsExperience, 
                y=predict(regressor,
                          newdata=training_set))) +
  ggtitle('Salary vs experience(training set') +
  xlab('YearsOfExperience')+
  ylab('Salary')

##plot test data
ggplot() +
  geom_jitter(aes(x=test_set$YearsExperience, y=test_set$Salary),
              color = 'red') +
  geom_line(aes(x =training_set$YearsExperience,
                y=predict(regressor,
                          newdata = training_set)),color='blue') +
  ggtitle('Salary vs experience(test set') +
  xlab('YearsOfExperience')+
  ylab('Salary')

