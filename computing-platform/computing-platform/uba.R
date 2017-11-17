## This is User behavior collection log.

# import data
EVENT_LOG <- read.table("data/EVENT_LOG.txt", head=TRUE)


#EVENT_LOG$USER_ID[EVENT_LOG$TYPE %% 571 == 1] <- "U01"
#EVENT_LOG$USER_ID[EVENT_LOG$TYPE %% 571 == 12] <- "U12"
#EVENT_LOG$USER_ID[EVENT_LOG$TYPE %% 571 == 23] <- "U23"
#EVENT_LOG$USER_ID[EVENT_LOG$TYPE %% 571 == 34] <- "U34"
#EVENT_LOG$USER_ID[EVENT_LOG$TYPE %% 571 == 45] <- "U45"
#EVENT_LOG$USER_ID[EVENT_LOG$TYPE %% 571 == 56] <- "U56"
#EVENT_LOG$USER_ID[EVENT_LOG$TYPE %% 571 == 67] <- "U67"
#EVENT_LOG$USER_ID[EVENT_LOG$TYPE %% 571 == 78] <- "U78"
#EVENT_LOG$USER_ID[EVENT_LOG$TYPE %% 571 == 89] <- "U89"
#write.table(EVENT_LOG, file="data/EVENT_LOG.txt", append=FALSE)


## direct output to a file
#sink(file="data/report/uba.txt", append=FALSE, split=FALSE)

#summary(EVENT_LOG)

#sink()