#trade union

trade_union_density_rate <- read.csv("E:/R Projects/Daten_MA//Masterarbeit/data/trade_union_density_rate.csv")


#cleaning

df_trade_union_density_rate <- trade_union_density_rate %>% rename(country = ï..ref_area.label) %>%
  select(country,time,obs_value)

#plot
ggplot(df_trade_union_density_rate, aes(x = time, y = obs_value, colour = country)) + 
  geom_line() + theme_bw()


# strike

days_not_worked <- read.csv("E:/R Projects/Daten_MA//Masterarbeit/data/days_not_worked.csv")

workers_involved <- read.csv("E:/R Projects/Daten_MA//Masterarbeit/data/workers_inv.csv")

# cleaning


df_days_not_worked  <- days_not_worked  %>% rename(country = ï..ref_area.label) %>% 
  select(country,time,obs_value,classif1.label) %>%
  filter(classif1.label == "Economic activity (Broad sector): Total") %>% 
  rename(days = obs_value) %>% mutate(days_in_th = days/1000)

df_workers_involved  <- workers_involved  %>% rename(country = ï..ref_area.label) %>% 
  select(country,time,obs_value,classif1.label) %>%
  filter(classif1.label == "Economic activity (Broad sector): Total") %>% rename(workers_in_th = obs_value) %>% 
  mutate(workers = workers_in_th*1000)


#plot

ggplot(df_days_not_worked, aes(x = time, y = days_in_th)) + 
  geom_line()+ facet_grid(rows = vars(country), scales = "free_y") + 
  ggtitle("Tage nicht gearbeitet in tausend pro Land") + theme_bw() 



ggplot(df_workers_involved, aes(x = time, y = workers_in_th)) + 
  geom_line() + facet_grid(rows = vars(country), scales = "free_y") +
  ggtitle("Beteiligte Arbeitnehmer:innen") + theme_bw()

#create switzerland df

switzerland_days <- df_days_not_worked %>% filter(country == "Switzerland")

switzerland_workers <- df_workers_involved %>% filter(country == "Switzerland")

# plot for Switzerland

ggplot(switzerland_days, aes(time,days_in_th))+geom_line() + theme_bw()

ggplot(switzerland_workers, aes(time, workers_in_th))+geom_line() + theme_bw()
# create Id variable for a join

df_days_not_worked$id <- paste(df_days_not_worked$country, df_days_not_worked$time, sep = "")

df_workers_involved$id <- paste(df_workers_involved$country, df_workers_involved$time, sep = "")

# inner join

complete_df <- inner_join(df_days_not_worked, df_workers_involved, by = "id")

# more cleaning
complete_df <- complete_df %>% rename(involved_workers_th = obs_value.y) %>% 
  rename(days = obs_value.x) %>% mutate(involed_workers = involved_workers_th*1000)



