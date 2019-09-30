#Data mining
#Data ware house
#text mining
#Sentiment analysis using text mining of a football match

#we extract those words said by people maximum
#packages are 'tm' and 'wordcloud'
library(tm)

#Viewing the structre of data - in terms of continuous and categorical data
str(Reviews)
reviews_text=paste(Reviews$text,collapse = " ")

#collapse to remove everything else
#assigning each text as a vector or an object - vector is a basic structure in R, it shows each
#text element as a document
review_source=VectorSource(reviews_text)#linking text to vector

#corpus - it is used to remove unrequired words and special characters in the data
corpus=Corpus(review_source)
#tm_map is used for transforming the data
corpus=tm_map(corpus,content_transformer(tolower))#converting everything into small letters
corpus=tm_map(corpus,removePunctuation)#removing punctuations
corpus=tm_map(corpus,stripWhitespace)#Removing the spaces
corpus=tm_map(corpus,removeWords,stopwords("english"))
stopwords("english")

#Documented term matrix
#Used to create our data into matrix
dtm=DocumentTermMatrix(corpus)
View(dtm)

#Converting DTM matrix into sequential matrix
dtm2=as.matrix(dtm)
dtm2

#To check frequency of repitition
freqn=colSums(dtm2)
freqn=sort(freqn, decreasing = TRUE)
freqn
head(freqn)

#Building a wordcloud for this
library(wordcloud)
words=names(freqn)#mosst reeated words
wordcloud(words[1:100],freqn[1:100],random.order=T)
par(bg="Yellow")
