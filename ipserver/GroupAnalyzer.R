# Import data 

## all data, include loc field is '#'
group_err_loc_all <- read.delim("E:/R_Workspace/ipserver/data/group/group_err_loc_total.txt", header=FALSE)

names(group_err_loc_all) <- c("Date", "Err", "Loc", "Total")

# import required library

library('sqldf')

# exclude loc is '#'
group_err_loc <- sqldf('select t.* from group_err_loc_all t where t.loc <> "#" order by t.total desc')

group_locs <- sqldf('select distinct(t.loc) from group_err_loc t')

group_rows <- sqldf('select t.loc, t.total as e208, t2.total as e303 from group_err_loc t,  group_err_loc t2 where t.err="208000" and t2.err="303000" and t.loc = t2.loc and t.loc in  group_locs')


## Get MySQL connection.

con <-  dbConnect(RMySQL::MySQL(), 
                  username = "lhfei", 
                  password = "Lhfei",
                  host = "localhost", 
                  port = 3306, 
                  dbname = "ip_repository"
)

## dbGetQuery | dbSendQuery

query <- paste("INSERT INTO GROUP_ERR_LOC(date, err, loc, total) VALUES(", paste(group_err_loc[1,], collapse = ", "), ")")
dbSendQuery(con, query)

group_err_loc



total_rows <- length(group_err_loc$Date)

for(i in c(1,2) ) {
  query <- NULL
   c_date <- paste('"', group_err_loc[[1]][i], '"')
    c_err <- paste('"', group_err_loc[[2]][i], '"')
    c_loc <- paste('"', group_err_loc[[3]][i], '"')
  c_total <- group_err_loc[[4]][i]
  
  query <- paste(c_date, c_err, c_loc, c_total, sep=", ", collapse = ", ")

  query <- paste("INSERT INTO GROUP_ERR_LOC(date, err, loc, total) VALUES(",  query,  ")")
  
  print(query )
  
  dbSendQuery(con, query)
}



#dbSendQuery(con, query)

query <- 'INSERT INTO GROUP_ERR_LOC(date, err, loc, total) VALUES( "316", "303000", "111.161.7.201", 14559 )'
dbSendQuery(con, query)




