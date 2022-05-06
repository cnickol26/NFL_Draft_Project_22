library(tidyverse)

stats_14_20<-read.csv("college_statistics.csv")

stats_14_20_skill<-stats_14_20 %>% filter(pos_abbr %in% c("QB","RB","WR","TE"))

draft<-read.csv("2000-2021 Draft Picks.csv")

draft_skill<-draft %>% filter(Position %in% c("QB","RB","WR","TE"))

names<-draft_skill$Name

stats_14_20_skill<-stats_14_20_skill %>% filter(player_name %in% names)

stats_14_20_skill_pivot <- stats_14_20_skill %>% 
  select(player_id,player_name,season) %>% 
  group_by(player_name) %>% 
  unique(stats_14_20_skill$season)
