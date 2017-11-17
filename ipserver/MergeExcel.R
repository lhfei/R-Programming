library('sqldf')

first <- read.csv("C:/Users/lihf/Desktop/first.csv");

second <- read.csv("C:/Users/lihf/Desktop/second.csv");

third <- sqldf('select a.Name, a. Code, a. Before, a. Num, b.Num, b.Contact, a.Address from second a inner join first b on a.Name = b.Name and a.Code = b.Code ');

View(third)

write.csv(third, file="E:/R_Workspace/ipserver/data/report/merge.csv")