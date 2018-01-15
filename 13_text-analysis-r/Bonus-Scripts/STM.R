# Demonstrating the Structural Topics Model

############
### PREP ###
############

# The Usual
setwd("~/Dropbox/berkeley/Git-Repos/text-analysis-dhbsi")
rm(list=ls())
library(stm)
library(plyr)

# Load Data
women <- read.csv('Data/women-full.csv')
names(women)

# Country custom stopwords
countries <- unique(women$COUNTRY_FINAL)
stopwords.country <- c(as.character(countries), "saudi", "german", "ese", "ian")
stopwords.country <- tolower(stopwords.country)

# Pre-process
temp<-textProcessor(documents=women$TEXT.NO.NOUN, metadata=women, customstopwords=stopwords.country)
meta<-temp$meta
vocab<-temp$vocab
docs<-temp$documents
out <- prepDocuments(docs, vocab, meta, lower.thresh=10)
docs<-out$documents
vocab<-out$vocab
meta <-out$meta

##################################
######### Choose Model ###########
##################################

# Uncomment to run -- it will take awhile! Take out the `max.em.its` argument to run to convergence.
# model <- stm(docs,vocab, 15, prevalence=~REGION+s(YEAR)+PUBLICATION, data=meta, seed = 15, max.em.its = 50)

# load the already-estimated model.
load("Data/stm.RData")

# Top Words
labelTopics(model)

# Example Docs
findThoughts(model,texts=meta$TITLE,n=3,topics=1:15)

# Hand Labels
labels = c("Business", "Sports", "Reproductive Health", "Travel", "Fashion", "UN", "Sexual Assault", "Combat", "Women's Rights and Gender Equality", "Politics", "Profiles", "Human Interest", "Marriage & Family", "Religion", "Cancer")

# Topic Quality plot
topicQuality(model=model, documents=docs)

#####################################
######### Analyze Topics  ###########
#####################################

# Corpus Summary
plot.STM(model,type="summary",custom.labels=labels,main="")

# Topic Correlation
mod.out.corr<-topicCorr(model)
plot.topicCorr(mod.out.corr)

# Estimate Covariate Effects
prep <- estimateEffect(1:15 ~ REGION+s(YEAR),model,meta=meta,uncertainty="Global",documents=docs)

# Topics over time
plot.estimateEffect(prep,covariate="YEAR",method="continuous",topics=c(14, 3),printlegend=TRUE,xlab="Year",xlim=c(1980,2014),main = "Comparing Topics over Time",labeltype="custom",custom.labels=c("Religion", "Reproductive Healt"),ylim=c(0,.25),nsims=200)

# topics over region
regions = c("Asia","EECA","MENA","Africa","West","LA")
plot.estimateEffect(prep,"REGION",method="pointestimate",topics=9,printlegend=TRUE,labeltype="custom",custom.labels=regions,main="Women's Rights",ci.level=.95,nsims=100)

#######################################################
######### Topic-Document Proportion Tables  ###########
#######################################################

# Number of Documents by Number of Topics matrix of topic proportions
topic.docs <- as.data.frame(model$theta) 
colnames(topic.docs) <- c("business", "sports", "reproductive health", "travel", "fashion", "UN", "rape", "combat", "rights", "politics", "lifestories", "perspectives", "marriage.family", "religion", "cancer")

# Proportion of topics represented by each region
topic.docs$docs <- NULL
topic.docs$region <- meta$REGION
topic.distr <- ddply(.data=topic.docs, .variables=.(region), numcolwise(sum,na.rm = TRUE))
rownames(topic.distr) <- topic.distr$region
topic.distr$region <- NULL
topic.distr
norm<-function(x){
return (x/sum(x) * 100)
}
topic.distr <- apply(topic.distr,2,norm)
colnames(topic.distr) <- labels
topic.distr <- t(topic.distr)
topic.distr <- as.data.frame(topic.distr)
topic.distr$Total <- 100
topic.distr <- round(topic.distr,2)
topic.distr
