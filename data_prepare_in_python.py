import numpy as np
from numpy import *
import pandas as pd
cos_similarity = pd.read_excel("0327/LDAall.xlsx", header=None)
a_jibie_yuce_ = pd.read_excel("0327/jibie(yuce).xlsx", header=None)
a_jingjiquan_yuce_ = pd.read_excel("0327/jingjiquan(yuce).xlsx", header=None)
a_juli_yuce_ = pd.read_excel("0327/juli(yuce).xlsx", header=None)
a_leixing_yuce_ = pd.read_excel("0327/leixing(yuce).xlsx", header=None)
a_shenqingRA_yuce_ = pd.read_excel("0327/shenqingRA.xlsx", header=None)
a_yinzhengRA_yuce_ = pd.read_excel("0327/yinzhengRA.xlsx", header=None)
a_zhuanrangRA_yuce_ = pd.read_excel("0327/zhuanrangRA.xlsx", header=None)
zhuanrang_tagert_ = pd.read_csv("zhuanrang(yuce).csv", header=None)
#print(cos_similarity)

m = np.mat(zeros((1,3)))
for i in range(0,233):
    for j in range(0,233):
        m = np.row_stack((m, [i, j,zhuanrang_tagert_.iloc[i,j]]))
m = pd.DataFrame(m)
m.to_csv("m9_3_pd.csv", sep=',', header=False, index=False)
