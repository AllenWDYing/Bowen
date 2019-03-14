#install.packages("minerva")
getwd()
m_total <- read.csv("./data_prepare/m_total_pd.csv")#读取文件。
names(m_total)
m_total$m_9.zhuanrang_target#查看因变量
m_total$index <- paste0(m_total$from,"and",m_total$to)
data <- m_total[,c(13,3:10,12)]
names(data)

#data <- m_total[,c(-1,-2,-3)]#删除无用字段
data <- data[order(runif(nrow(data))),]#随机排序
ncol(data)#查看数据框字段数量
data[,c(2:9)] <- scale(data[,c(2:9)])#自变量标准化
str(data)#查看所有列的属性,检查数据结构

#data <- data[,-4]#删除LDA列。删除后，数据变为8列。
data <- as.data.frame(data)#结构转换（检验作用，若原本为数据框结构，则不会发生作用）
#install.packages("e1071")
#library(e1071)
data$zhuanrang_tagert_A_B <- as.factor(data$zhuanrang_tagert_A_B)
#nrow(data)*0.8

data_train <- data[1:floor(nrow(data)*0.9),]#测试集划分,按照9:1划分。
data_test <- data[ceiling(nrow(data)*0.9):nrow(data),]#训练集划分

##------randomforest-part------
library(randomForest)#引入随机森林包
#------hardcore-start------
names(data_train)
rf <- randomForest(data_train[,-10][,-1],data_train[,10],ntree = 50)#进行100棵树的随机森林训练。
p <- predict(rf,data_test[,-10][,-1])
table(data_test[,10],p)#print混淆矩阵
print(rf$importance)
importance(rf,type = 2)


#------hardcore-end------the blow is other test which is not import!can ignore!!


rf$confusion
rf$votes
rf$importance
plot(rf$forest)
plot(rf$forest$treemap)
rf$forest$ndbigtree
rf$forest$nodestatus
install.packages("C50")
library(C50)
tc<-C5.0Control(subset =F,CF=1,winnow=T,noGlobalPruning=F,minCases =4)
dt <- C5.0(data_train$m_9.zhuanrang_target ~.,data=data_train,rules=F,control =tc)
plot(dt)
table(predict(dt,data_test[,-8]),p)
C5imp(dt)
rule<- C5.0(data_train$m_9.zhuanrang_target ~.,data=data_train,control =tc)
summary( rule )

library(rpart.plot)
library(rattle)
library(rpart)
fit <- rpart(data_train$m_9.zhuanrang_target ~ ., data = data_train)
fancyRpartPlot(fit)
plot(fit)
mdl <- svm(m_9.zhuanrang_target ~ .,data = data_train)
summary(mdl)
pr <- predict(mdl,data_test[,-9])
table(data_test[,9],pr)
mdl$coefs
data[!data[,9] == "A",9] = 1
model <- glm(m_9.zhuanrang_target~.,family = binomial(link ='logit'),data = data_train,control=list(maxit=100))
summary(model)
predict(model,data[,-9])
data$m_5.leixing

scale

library(minerva)
#data <- as.matrix(data)
class(data)

class(data$jibie)
m2 <- mine(data[,c(1:8)],data[,9])
m2$MIC
m$MIC
m
write.csv(m$MIC,"m$MIC.csv")
