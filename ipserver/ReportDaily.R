library(sqldf)

report_0621 <- read.delim("E:/R_Workspace/ipserver/data/2015-06-21/000000_0", header=FALSE)
report_0623 <- read.delim("E:/R_Workspace/ipserver/data/2015-06-23/000000_0", header=FALSE)

report_title <- c("Err", "Total", "CT", "ORIGIN")

names(report_0621) <- report_title

names(report_0623) <- report_title

report_0621_ct <- sqldf('select ct from report_0621 group by ct')
report_0621_daily <- sqldf('SELECT a.ERR, a.TOTAL, a.CT, a.ORIGIN FROM report_0621 a INNER JOIN report_0621_ct b ON a.CT = b.CT WHERE a.ERR IN ("303000", "208000")')

#report_daily_21 <- sqldf('select a.err, a.total, b.err, b.total, a.total/b.total, a.ct from  report_0621_daily a, report_0621_daily b where a.ct = b.ct and a.err="30300" and b.err="208000"')


report_0623_ct <- sqldf('select ct from report_0623 group by ct')
report_0623_daily <- sqldf('SELECT a.ERR, a.TOTAL, a.CT, a.ORIGIN FROM report_0623 a INNER JOIN report_0623_ct b ON a.CT = b.CT WHERE a.ERR IN ("303000", "208000")')


write.csv(report_0621_daily, file="E:/R_Workspace/ipserver/data/report/report_0621_daily.csv")
write.csv(report_0623_daily, file="E:/R_Workspace/ipserver/data/report/report_0623_daily.csv")