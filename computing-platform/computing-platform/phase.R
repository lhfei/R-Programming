############################################################
# 统计标量： 推荐系统准确率统计
# 测试数据： PUSH_LOG.txt | EVENT_LOG.txt
############################################################

## 各时间段内 推荐的新闻总素
library(sqldf)
push_by_time <- sqldf("SELECT p.TIME, COUNT(p.TIME) as TOTAL 
  FROM PUSH_LOG p 
  GROUP BY p.TIME ORDER BY TOTAL desc")

# 各时间段内 推荐给各用户的新闻总数
push_by_time_user <- sqldf("SELECT p.USER_ID, p.TIME, count(p.USER_ID) as TOTAL
  FROM PUSH_LOG p
  GROUP BY p.USER_ID, p.TIME
  HAVING count(p.USER_ID)>0  
  ORDER BY TOTAL desc")


# 各时间段内 用户点击新闻情况统计
event_by_time <- sqldf("SELECT e.TIME, COUNT(e.TIME) as TOTAL
  FROM EVENT_LOG e
  GROUP BY e.TIME
  ORDER BY TOTAL desc ")
# 各时间段内 用户、用户点击新闻情况统计
event_by_time_user <- sqldf("SELECT e.USER_ID, e.TIME, COUNT(e.USER_ID) as TOTAL
  FROM EVENT_LOG e
  GROUP BY e.USER_ID, e.TIME
  ORDER BY TOTAL desc ")

# 各时间段内 推荐的新闻总数 与 用户点击的新闻总数
push_event_time <- merge(push_by_time, event_by_time, by="TIME")

push_event_time$hits <- push_event_time$TOTAL.x/push_event_time$TOTAL.y
