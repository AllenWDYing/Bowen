library(readxl)
lda_in <- read_excel("LDA.xlsx", sheet = "in", col_names = FALSE)
lda_out <- read_excel("LDA.xlsx", sheet = "out", col_names = FALSE)
#lda_in <- as.data.frame(lda_in)
lda_out[50:55,]
rownames(lda_in)
for (i in c(1:(nrow(lda_in)-1))) {
  if(lda_in[i,1] == lda_in[i+1,1]){
    lda_in[i,2] <- paste(lda_in[i,2],lda_in[i+1,2],",")
    lda_in[i+1,1] <- "need_to_delete"
  }
}
for (i in c(1:(nrow(lda_out)-1))) {
  if(lda_out[i,1] == lda_out[i+1,1]){
    lda_out[i,2] <- paste(lda_out[i,2],lda_out[i+1,2],",")
    lda_out[i+1,1] <- "need_to_delete"
  }
}
lda_in <- lda_in[!lda_in$X__1 == "need_to_delete",]
lda_out <- lda_out[!lda_out$X__1 == "need_to_delete",]

lda_in$X__1
nrow(lda_out)
nrow(lda_in)



#lda_out$X__2[1]
#lda_in_2 <- as.list(lda_in$X__2)
#lda_out_2 <- as.list(lda_out$X__2)
#list <- c(lda_in_2,lda_out_2)
#install.packages("tm")
#lda_out_2[1:10]

#install.packages("jiebaR")
library(jiebaR)
wk = worker(bylines = T,stop_word = "F:/RWD/zhangbowen/stop_words_chn.txt")
segment("你好你是谁？",wk)
seg_in <- segment(lda_in$X__2,wk)

seg_out <- segment(lda_out$X__2,wk)
class(seg_in)

list <- c(seg_in,seg_out)
list[1]
library(tm)
wordcorpus <- VCorpus(VectorSource(list))                            
# `VectorSource`是将vector转化为Source,`Corpus`函数再将Source对象转化为Corpus对象
#library(tm)
inspect(wordcorpus[1])

wordcorpus <- tm_map(wordcorpus,stripWhitespace)
wordcorpus <- tm_map(wordcorpus,removeNumbers)
wordcorpus <- tm_map(wordcorpus,stripWhitespace)

dtm <- DocumentTermMatrix(wordcorpus,
                          control = list(
                            removePunctuation = T,
                            wordLengths=c(2, Inf),# 限制词长
                            stopwords  = T,
                            bounds = list(global = c(5,Inf)),    # 设置词的最小频率
                            removeNumbers = TRUE,                #removeNumbers设置是否移除数字
                            weighting = weightTf               #词频率权重，以TF（词频），还可以设置weighTfIdf，weightBin,weightSMART
                            ))
#install.packages("topicmodels")
wordcorpus[[1]]
inspect(wordcorpus[[1]])

library(topicmodels)
dtm$nrow
dtm$ncol
dtm$dimnames
names(dtm)
dtm$i
dtm$j
dtm$v

inspect(dtm[1:10,1:10])
K <- 5 #主题数
G <- 5000 #迭代次数
alpha <- 0.10 
eta <- 0.02
lda_r <- LDA(dtm,k = 50, method = "Gibbs")

lda_inf <- posterior(lda_r, dtm)
lda_inf$terms
write.csv(lda_inf$terms,"terms.csv")
write.csv(lda_inf$topics,"topics.csv")
lda_inf$topics[1:10,]
