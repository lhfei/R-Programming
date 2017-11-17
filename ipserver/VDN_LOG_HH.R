library('sqldf');

report_0528 <- sqldf("select ERR, UID, TM, REF from log_0528 order by UID");


report_0528_group <- sqldf("select UID, REF, count(*) as Total from log_0528 group by UID, REF order by UID");



write.csv(report_0528, file="E:/R_Workspace/ipserver/data/report/report_0528.csv");

write.csv(report_0528_group, file="E:/R_Workspace/ipserver/data/report/report_0528_group.csv");


############################

#names(log_0521) <- c("ERR", "IP", "REF", "SID", "UID", "LOC", "TM", "URL", "DUR", "BT", "BL", "LT", "VID", "CDNID", "NETNAME")

names(log_0521) <- c("ERR", "IP", "REF", "SID", "UID", "LOC", "TM", "URL", "DUR", "BT", "BL", "LT", "VID", "CDNID", "NETNAME")

library('sqldf');

report_0521 <- sqldf("select l.ERR, l.UID, l.TM, l.REF from log_0521 l order by UID");


report_0521_group <- sqldf("select UID, REF, count(*) as Total from log_0521 group by UID, REF order by UID");



write.csv(report_0521, file="E:/R_Workspace/ipserver/data/report/report_0521.csv");

write.csv(report_0521_group, file="E:/R_Workspace/ipserver/data/report/report_0521_group.csv");



write.csv(agent_group, file="E:/R_Workspace/ipserver/data/report/agent_group.csv");

