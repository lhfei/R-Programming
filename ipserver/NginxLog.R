# Analysistic Nginx log

library(sqldf)

V_NAMES <- c("IP", "Seria", "Total")

nginx_log <- read.delim("E:/R_Workspace/ipserver/data/nginx_log.txt", header=FALSE)
names(nginx_log) <- V_NAMES
nginx_log <- sqldf('SELECT * FROM nginx_log ORDER BY ip, seria, total desc')

nginx_top <- read.delim("E:/R_Workspace/ipserver/data/nginx_top.txt", header=FALSE)
names(nginx_top) <- V_NAMES


nginx_na <- read.delim("E:/R_Workspace/ipserver/data/nginx_na.txt", header=FALSE)
names(nginx_na) <- V_NAMES


write.table(nginx_top, file="E:/R_Workspace/ipserver/data/report/nginx_top.txt", quote=FALSE, sep="\t", row.names=FALSE, fileEncoding="UTF-8")
write.table(nginx_na, file="E:/R_Workspace/ipserver/data/report/nginx_na.txt", quote=FALSE, sep="\t", row.names=FALSE, fileEncoding="UTF-8")


nginx_top <- sqldf('select Total, IP, Seria from nginx_top order by total desc')

nginx_top_ip <- sqldf('select IP from nginx_top')

nginx_top$x <- apply(nginx_top[,c("IP", "Seria")] , 0 , paste , c
nginx_top_view <- sqldf('select a.IP, b.total, b.Seria from nginx_top b left join nginx_top_ip a on b.IP = a.IP')


nginx_top <- sqldf('select Total, IP, Seria from nginx_top order by total desc')
nginx_top$x <- apply(nginx_top[,c("IP", "Total", "Seria")] , 1 , paste , collapse = "<>" )

nginx_top_report <- sqldf("select x from nginx_top order by x desc")

write.table(nginx_top_report, file="E:/R_Workspace/ipserver/data/report/nginx_report.txt", quote=FALSE, sep="\t", row.names=FALSE, fileEncoding="UTF-8")

