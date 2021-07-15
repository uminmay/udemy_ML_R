#Natural Language Processing

#bag of words

#Importing the dataset

dataset = read.delim("Restaurant_Reviews.tsv", 
                     sep = '\t', 
                     quote = '',
                     stringsAsFactors = FALSE)

#Cleaning the text

#install.packages('tm')
library(tm)
corpus = VCorpus(VectorSource(dataset$Review))
#modify lower_upper_, numbers , punctuation
corpus = tm_map(corpus, content_transformer(tolower))
corpus = tm_map(corpus, removeNumbers)
corpus = tm_map(corpus, removePunctuation)

#stopwords
#install.packages('SnowballC')
library(SnowballC)
corpus = tm_map(corpus, removeWords,stopwords())

#Stemming (different version of same word)
corpus = tm_map(corpus, stemDocument)

#Remove extra spaces
corpus = tm_map(corpus, stripWhitespace)

#Creating Bag of Words Model
dtm = DocumentTermMatrix(corpus)

#Filter and use most frequent words! <-> check sparsity by entering
#dtm in console

dtm = removeSparseTerms(dtm, 0.999)

#Make classification model <-NB, RF, DT ->
#Random-Forest

dataset_c = as.data.frame(as.matrix(dtm))
dataset_c$Liked = dataset$Liked

#encode target feature as factor
dataset_c$Liked = factor(dataset_c$Liked, levels = c(0,1))

#splitting the data
library(caTools)
set.seed(272)
split = sample.split(dataset_c$Liked, SplitRatio=0.8)
training_set = subset(dataset_c, split == TRUE)
test_set = subset(dataset_c, split == FALSE)

#No Scaling

#Build Random Forest
library(randomForest)
classifier = randomForest(x = training_set[-692],
                          y = training_set$Liked,
                          ntree = 50)
#Prediction on Test Set results
y_pred = predict(classifier, newdata =  test_set[-692])

#Confusion Matrix
cm = table(test_set$Liked, y_pred)