### hierarchical clustering

##import mall dataset
dataset = read.csv("Mall_Customers.csv")

X =dataset[4:5]

# usem dendrogram to find optimal number of clusters

dendrogram = hclust(dist(X, method = 'euclidean'),method = 'ward.D')
plot(dendrogram,
    main = paste("Dendrogram"),
    xlab = 'Customers',
    ylab = 'Euclidean distances')

##fit hierarchical clustering on our dataset

hc = hclust(dist(X, method = 'euclidean'),method = 'ward.D')
y_hc = cutree(hc,5)

## Visualising the results
library(cluster)
clusplot(X,
         y_hc,
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
