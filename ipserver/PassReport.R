

KEY_NAMES <- c("UID", "IP",  "LOC", "TM",  "VID")

miss_18 <- read.delim("E:/R_Workspace/ipserver/data/miss_18.txt", header=FALSE)
miss_17 <- read.delim("E:/R_Workspace/ipserver/data/miss_17.txt", header=FALSE)
miss_16 <- read.delim("E:/R_Workspace/ipserver/data/miss_16.txt", header=FALSE)

miss_18$TM <- as.POSIXct((miss_18$TM+0.1)/1000, origin = "1970-01-01")
miss_17$TM <- as.POSIXct((miss_17$TM+0.1)/1000, origin = "1970-01-01")
miss_16$TM <- as.POSIXct((miss_16$TM+0.1)/1000, origin = "1970-01-01")
  


write.csv(miss_18, file="E:/R_Workspace/ipserver/data/miss_18.csv")
write.csv(miss_17, file="E:/R_Workspace/ipserver/data/miss_17.csv")
write.csv(miss_16, file="E:/R_Workspace/ipserver/data/miss_16.csv")


write.table(miss_18, file="E:/R_Workspace/ipserver/data/miss_18_f.txt", sep="\t", row.names=TRUE)
write.table(miss_17, file="E:/R_Workspace/ipserver/data/miss_17_f.txt", sep="\t", row.names=TRUE)
write.table(miss_16, file="E:/R_Workspace/ipserver/data/miss_16_f.txt", sep="\t", row.names=TRUE)


miss_18_17 <- read.delim("E:/R_Workspace/ipserver/data/miss_18_17.txt", header=FALSE)
miss_17_16 <- read.delim("E:/R_Workspace/ipserver/data/miss_17_16.txt", header=FALSE)

names(miss_18_17) <- c("UID", "IP",  "LOC", "TM",  "IP2",  "LOC2", "TM2")
miss_18_17$TM <- as.POSIXct((miss_18_17$TM+0.1)/1000, origin = "1970-01-01")
miss_18_17$TM2 <- as.POSIXct((miss_18_17$TM2+0.1)/1000, origin = "1970-01-01")

names(miss_17_16) <- c("UID", "IP",  "LOC", "TM",  "IP2",  "LOC2", "TM2")
miss_17_16$TM <- as.POSIXct((miss_17_16$TM+0.1)/1000, origin = "1970-01-01")
miss_17_16$TM2 <- as.POSIXct((miss_17_16$TM2+0.1)/1000, origin = "1970-01-01")

write.table(miss_18_17, file="E:/R_Workspace/ipserver/data/miss_18_17_merge.txt", sep="\t", row.names=TRUE)
write.table(miss_17_16, file="E:/R_Workspace/ipserver/data/miss_17_16_merge.txt", sep="\t", row.names=TRUE)


