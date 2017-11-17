
library('sqldf')

## All obs
VDN_HH <- read.delim("E:/R_Workspace/ipserver/data/sample.txt", header=FALSE)

names(VDN_HH) <- c("ERR", "IP", "REF", "SID", "UID", "LOC", "TM", "URL", "DUR", "BT", "BL", "LT", "VID", "CDNID", "NETNAME")

group_hh <- sqldf("select UID, count(*) as Total, REF from VDN_HH group by UID, REF order by Total desc");

logs_303 <- sqldf("select * from VDN_HH where err='303000' ");
logs_208 <- sqldf("select * from VDN_HH where err='208000' ");

## Just recived 303, but 208 lost.
log_303_miss_208 <- sqldf("select l3.* from logs_303 l3 where l3.uid not in (select uid from logs_208 group by uid)");

## export log_303_miss_208
write.csv(log_303_miss_208, file="E:/R_Workspace/ipserver/data/report/log_303_miss_208.csv")

## tracks log_303_miss_208 fully behavior:
log_303_miss_208_trace <- sqldf("select l3.* from logs_303 l3 inner join log_303_miss_208 lm on l3.uid=lm.uid order by l3.tm");

log_all <- sqldf("select * from VDN_HH where uid in (select uid from log_303_miss_208) order by uid, tm asc");


write.csv(log_all, file="E:/R_Workspace/ipserver/data/report/log_all.csv")