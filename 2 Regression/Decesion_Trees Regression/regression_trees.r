###DECESION TREE REGRESSION

dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

library(rpart)
##parameter to increase tree splits
regressor = rpart(formula = Salary ~ ., 
                  data = dataset,
                  control = rpart.control(minsplit = 1))

y_pred = predict(regressor, data.frame(Level = 6.5))
###low res
library(ggplot2)
ggplot() +
  geom_point(aes(x= dataset$Level, y= dataset$Salary),
             colour = 'red') + 
  geom_line(aes(x=dataset$Level, y = predict(regressor,newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Decesion tree Regression)') +
  xlab('Level') +
  ylab('Salary')

###high res
library(ggplot2)
x_grid = seq(min(dataset$Level),max(dataset$Level),0.01)
ggplot() +
  geom_point(aes(x= dataset$Level, y= dataset$Salary),
             colour = 'red') + 
  geom_line(aes(x= x_grid, y = predict(regressor,
            newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Decesion tree Regression)') +
  xlab('Level') +
  ylab('Salary')
  

#we have some non-continious models