library(DBI)

con <-  dbConnect(RMySQL::MySQL(), 
                  username = "lhfei", 
                  password = "Lhfei",
                  host = "localhost", 
                  port = 3306, 
                  dbname = "ip_repository"
)

dbGetQuery(con, "select * from ip_repository")


#close
dbDisconnect(con)


day_16 <- read.table(file="E:/R_Workspace/ipserver/data/16_alibaba.txt",header = FALSE, fileEncoding="UTF-8")

data16 <- read.table(file="E:/R_Workspace/ipserver/data/16_alibaba.txt", header=FALSE, fileEncoding="UTF-8", sep="\t")