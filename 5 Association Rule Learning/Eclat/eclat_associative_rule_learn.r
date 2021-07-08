# Apriori

# Data Preprocessing

dataset = read.csv("Market_Basket_Optimisation.csv", header=FALSE)

## Library to be used needs sparse matrix as input

#install.packages("arules")

##Create sparse matrix
library(arules)

dataset_sparse = read.transactions("Market_Basket_Optimisation.csv",
                                   sep = ',', 
                                   rm.duplicates =TRUE)
#summary(dataset_sparse)
#itemFrequencyPlot(dataset_sparse, topN = 100)


## Training apriori on the data

rules = eclat(data = dataset_sparse,
                parameter = list(support = 0.004,minlen = 2))

## Visualizing the results
inspect(sort(rules, by='support')[1:10])

#chocolate has high support, among most purchased products <-> water
#so change confidence from 0.4 to 0.2
