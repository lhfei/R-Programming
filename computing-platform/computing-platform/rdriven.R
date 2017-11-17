## import data
PUSH_LOG <- read.csv("data/PUSH_LOG.csv", header=TRUE, sep="")

library(sqldf)
ptimes <- sqldf("select p.TIME FROM PUSH_LOG p GROUP BY p.TIME")

ptimes <- ptimes$TIME

rangeLen <- length(ptimes)

for(t in 2:rangeLen){
  
  # total all news in data range
  tSize <- PUSH_LOG$USER_ID[which(PUSH_LOG$TIME == ptimes[t]) ]
  tSize <- length(tSize)

  # generate temporary USER_ID
  for(i in 1:tSize) {
    if(i < 10){
      userid[i] <-  paste("U0", i, sep="")
    }else {
      userid[i] <-  paste("U", i, sep="")
    }
  }
  
  userid <- userid[1:tSize]
  
  PUSH_LOG$USER_ID[which(PUSH_LOG$TIME == ptimes[t])] <- userid
}
