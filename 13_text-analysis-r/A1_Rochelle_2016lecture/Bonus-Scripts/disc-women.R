### Doing discriminating Words on more than 2 categories

### Required Packages
setwd("~/Dropbox/Git-Repos/text-analysis-dhbsi")
rm(list=ls())
library(tm)
library(RTextTools) # a machine learning package for text classification written in R
library(SnowballC) # for stemming
library(matrixStats) # for statistics

# Load Data and make a corpus
documents <-read.csv("Data/women.csv", header=TRUE)
summary(documents$region)
docs <- Corpus(VectorSource(documents$text.no.noun))
docs

# Make DTM
dtm <- DocumentTermMatrix(docs,
                          control = list(tolower = TRUE,
                                         stopwords = T,
                                         removeNumbers = TRUE,
                                         removePunctuation = TRUE,
                                         stemming=TRUE,
                                         removeWords = c("ese")))
dim(dtm)
inspect(dtm[1:5,100:104])
# remove sparse terms
dtm <- removeSparseTerms(dtm, .99)
dim(dtm)


# coerse into dataframe
dtm.m <- as.data.frame(as.matrix(dtm))
dtm.m[1:5,1:5]

# add column for region
dtm.m$document_region <- documents$region
dtm.m$document_region[1:5]

# Subset into 2 dtms - one for MENA and one for -MENA
mena <- subset(dtm.m,document_region=="MENA",select = -document_region) # should have 1102 obs.
rest <- subset(dtm.m,!document_region=="MENA",select = -document_region) # should have 236 obs.

# calculate means and vars
means.Mena <- colMeans(mena)
var.Mena <- colVars(as.matrix(mena))
means.Rest <- colMeans(rest)
var.Rest <- colVars(as.matrix(rest))

#calculate overall score
num <- (means.Mena - means.Rest) 
denom <- sqrt((var.Mena/3) + (var.Rest/3))
score <- num / denom

# sort and view
score <- sort(score)
head(score,10) # top Rest words
tail(score,10) # top Mena words


