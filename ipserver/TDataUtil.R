# import data from log file:
mini_log <- read.delim("E:/R_Workspace/ipserver/data/log.sta", header=FALSE, encoding="utf-8")

# export format data to local
write.table(mini_log, 'E:/R_Workspace/ipserver/data/format_mini_log.txt')

Sys.setenv(JAVA_HOME='E:\\JDK_HOME\\jdk8\\jdk1.8.0_40') 
library(rJava)

#install.packages("xlsxjars")
library(xlsxjars)

#library(xlsx)
#write.xlsx(mini_log, 'E:/R_Workspace/ipserver/data/format_mini_log.xlsx')

mini_log <- read.delim("E:/R_Workspace/ipserver/data/mini_log.sta", sep="\r\t",  header=FALSE, encoding="utf-8")


write.csv(mini_log, 'E:/R_Workspace/ipserver/data/format_mini_log.csv')
