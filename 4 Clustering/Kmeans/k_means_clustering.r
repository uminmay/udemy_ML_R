##K Means Clustering

##Import the mall dataset
dataset <- read.csv("Mall_customers.csv")

X <- dataset[4:5]

# Using elbow method to choose random number of clusters
set.seed(6)
wcss <- vector()

for (i in 1:10) wcss[i] <- sum(kmeans(X, i)$withinss)
plot(1:10, 
     wcss, 
     type = "b", 
     main = paste('Elbow method'), 
     xlab = "Number of Clusters",
     ylab = "WCSS"
)

## Applying k-means to dataset
set.seed(29)
kmeans_ <- kmeans(X, 5, iter.max=300, nstart=10)

#Visualising the clusters (only tow dimensions)
library(cluster)
clusplot(X,
  kmeans_$cluster,
  lines=0,
  shade=TRUE,
  color=TRUE,
  labels=2,
  plotchar=FALSE,
  span=TRUE,
  main=paste('CLUSTER OF CUSTOMERS'),
  xlab = 'Annual Income',
  ylab = 'Spending Score'
)
