print("start computing ...")

## input the script of formate data
source("rdriven.R")

## direct output to a file
sink(file="f:/report.txt", append=FALSE, split=FALSE)

## summary report
summary(PUSH_LOG)


## describe report
#library(Hmisc)
#describe(PUSH_LOG)

## return output to the terminal
#dev.off()

## import event log data
source("uba.R")
print("::--------------- Summary EVENT LOG ---------------:: ")
summary(EVENT_LOG)

print("::--------------- Hits ---------------:: ")
source("phase.R")
push_event_time

# stop sinking
sink()

print("computed done.")
