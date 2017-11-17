source("Analyse.R")

library('sqldf')

# group by ip
ip_18 <- sqldf('select ip, count(ip) as total from miss_18 group by ip order by total desc')

ip_17 <- sqldf('select ip, count(ip) as total from miss_17 group by ip order by total desc')

ip_16 <- sqldf('select ip, count(ip) as total from miss_16 group by ip order by total desc')


# export
write.table(ip_18, file="E:/R_Workspace/ipserver/data/report/ip_18.txt", sep="\t", row.names=TRUE)
write.table(ip_17, file="E:/R_Workspace/ipserver/data/report/ip_17.txt", sep="\t", row.names=TRUE)
write.table(ip_16, file="E:/R_Workspace/ipserver/data/report/ip_16.txt", sep="\t", row.names=TRUE)


write.csv(ip_18, file="E:/R_Workspace/ipserver/data/report/ip_18.csv")
write.csv(ip_17, file="E:/R_Workspace/ipserver/data/report/ip_17.csv")
write.csv(ip_16, file="E:/R_Workspace/ipserver/data/report/ip_16.csv")



