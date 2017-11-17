

# define commons fields:

KEY_NAMES <- c("UID", "IP",  "LOC", "TM",  "VID")

# load data
miss_18 <- read.delim("E:/R_Workspace/ipserver/data/miss_18.txt", header=FALSE)
miss_17 <- read.delim("E:/R_Workspace/ipserver/data/miss_17.txt", header=FALSE)
miss_16 <- read.delim("E:/R_Workspace/ipserver/data/miss_16.txt", header=FALSE)

# format data
names(miss_18) <- KEY_NAMES
names(miss_17) <- KEY_NAMES
names(miss_16) <- KEY_NAMES

miss_18$TM <- as.POSIXct((miss_18$TM+0.1)/1000, origin = "1970-01-01")
miss_17$TM <- as.POSIXct((miss_17$TM+0.1)/1000, origin = "1970-01-01")
miss_16$TM <- as.POSIXct((miss_16$TM+0.1)/1000, origin = "1970-01-01")

