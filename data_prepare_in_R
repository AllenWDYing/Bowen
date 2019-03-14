
#this R code runs very slowly,rather than the python version.

library(readr)
cos_ <- read_csv("矩阵 博闻/COS.csv", col_names = FALSE)
ncol(cos_)
nrow(cos_)



a_jibie_yuce_ <- read_csv("矩阵 博闻/jibie(yuce).csv", col_names = FALSE)
a_jingjiquan_yuce_ <- read_csv("矩阵 博闻/jingjiquan(yuce).csv", col_names = FALSE)
a_juli_yuce_ <- read_csv("矩阵 博闻/juli(yuce).csv", col_names = FALSE)
a_leixing_yuce_ <- read_csv("矩阵 博闻/leixing(yuce).csv", col_names = FALSE)
a_shenqingRA_yuce_ <- read_csv("矩阵 博闻/shenqingRA.csv", col_names = FALSE)
a_yinzhengRA_yuce_ <- read_csv("矩阵 博闻/yinzhengRA.csv", col_names = FALSE)
a_zhuanrangRA_yuce_ <- read_csv("矩阵 博闻/zhuanrangRA.csv", col_names = FALSE)
zhuanrang_tagert_ <- read_csv("zhuanrang(yuce).csv", col_names = FALSE)
ncol(a_jibie_yuce_)
nrow(a_jibie_yuce_)

colnames(a_jibie_yuce_) <- c(1:233)
rownames(a_jibie_yuce_) <- c(1:233)
colnames(a_jingjiquan_yuce_) <- c(1:233)
rownames(a_jingjiquan_yuce_) <- c(1:233)
colnames(a_juli_yuce_) <- c(1:233)
rownames(a_juli_yuce_) <- c(1:233)
colnames(cos_) <- c(1:233)
rownames(cos_) <- c(1:233)
colnames(a_leixing_yuce_) <- c(1:233)
rownames(a_leixing_yuce_) <- c(1:233)
colnames(a_shenqingRA_yuce_) <- c(1:233)
rownames(a_shenqingRA_yuce_) <- c(1:233)
colnames(a_yinzhengRA_yuce_) <- c(1:233)
rownames(a_yinzhengRA_yuce_) <- c(1:233)
colnames(a_zhuanrangRA_yuce_) <- c(1:233)
rownames(a_zhuanrangRA_yuce_) <- c(1:233)
colnames(zhuanrang_tagert_) <- c(1:233)
rownames(zhuanrang_tagert_) <- c(1:233)

df_names <- c("cos_","a_jibie_yuce_","a_jingjiquan_yuce_","a_juli_yuce_","a_leixing_yuce_"
              ,"a_shenqingRA_yuce_","a_yinzhengRA_yuce_","a_zhuanrangRA_yuce_","zhuanrang_tagert_")


for(k in c(1:9)){
  data <- get(df_names[k])
  #names(data)
  #data[2,3]
  tabel_name <- paste0("m_",df_names[k])
  m <- NULL
  for (i in 1:233) {
    for (j in 1:233) {
      row <- cbind(colnames(data)[i],colnames(data)[j],data[i,j])
      colnames(row) <- c("from","to",df_names[k])
      m <- rbind(m,row)
    }
  }
  assign(tabel_name,m)
}






