#Data was acquired via Opera Phenix Plus High-Content Screening System
#Focus on immune cell move along Z axis
#Cell travel along Z axis and upon different treatments, cells behave differently - that�s what we want to investigate

rm(list = ls())
setwd("/Desktop/Analysis_DJ/Analysis_DJ_immune/Analysis_immune cells")


#0.0 - loading packages------------
library(dplyr)
library(tidyverse)
library(ggridges)
library(writexl)
library(openxlsx)

library(SmartEDA)
library(ggplot2)
library(vioplot)
library(beanplot)

library(gganimate)


#1.0 - loading data in right format to explore time points - test gsub function--------------
EPA_time <- read.delim("Day2-4 - immune cells.txt", header = TRUE)
unique(EPA_time$Timepoint)
EPA_time_mod <- EPA_time %>% 
  mutate(Timepoint = gsub("2", "1", .$Timepoint)) %>% 
  mutate(Timepoint = gsub("3", "1", .$Timepoint))
unique(EPA_time_mod$Timepoint)
View(EPA_time_mod)

#1.1.day_0 to 1----
data_day_1 <- read.delim("Day 0 - immune cells.txt", header = TRUE)
View(data_day_1)
unique(data_day_1$Timepoint) #only 1 therefore it is correct


#1.2.day_2 to 2-----
data_day_2 <- read.delim("Day 1 - immune cells.txt", header = TRUE)
View(data_day_2)

unique(data_day_2$Timepoint) #only 1 therefore correct it to 2
data_day_2 <- data_day_2 %>% 
  mutate(Timepoint = gsub("1", "2", .$Timepoint))
View(data_day_2)

#1.3.day_2-4 to 3,4,5-----
data_day_3_5 <- read.delim("Day2-4 - immune cells.txt", header = TRUE)
View(data_day_3_5)
unique(data_day_3_5$Timepoint)  # isolate them into separated dataset based on date

##1.3.1 day_3-----
data_day_3 <- data_day_3_5 %>% 
  filter(Timepoint == "1") %>% 
  mutate(Timepoint = gsub("1", "3", .$Timepoint))
View(data_day_3)
unique(data_day_3$Timepoint)


##1.3.1 day_4------
data_day_4 <- data_day_3_5 %>% 
  filter(Timepoint == "2") %>% 
  mutate(Timepoint = gsub("2", "4", .$Timepoint))
View(data_day_4)
unique(data_day_4$Timepoint)


##1.3.1 day_5-----
data_day_5 <- data_day_3_5 %>% 
  filter(Timepoint == "3") %>% 
  mutate(Timepoint = gsub("3", "5", .$Timepoint))
View(data_day_5)
unique(data_day_5$Timepoint)


#1.4.day_6 -----
data_day_6 <- read.delim("Day5 - immune cells.txt", header = TRUE)
unique(data_day_6$Timepoint) # 1 to 6
data_day_6 <- data_day_6 %>% 
  mutate(Timepoint = gsub("1", "6", .$Timepoint))

#1.5 day_7-----
data_day_7 <- read.delim("Day 6 - immune cells.txt", header = TRUE)
data_day_7 <- data_day_7 %>% 
  mutate(Timepoint = gsub("1", "7", .$Timepoint))

#1.6 day_8-----
data_day_8 <- read.delim("Day7 - immune cells.txt", header = TRUE)
data_day_8 <- data_day_8 %>% 
  mutate(Timepoint = gsub("1", "8", .$Timepoint))

#1.6 day_9------
data_day_9 <- read.delim("Day8 - immune cells.txt", header = TRUE)
data_day_9 <- data_day_9 %>% 
  mutate(Timepoint = gsub("1", "9", .$Timepoint))


names(data_day_1) # print col names to copy them directly 

data_day_1 <- data_day_1 %>% 
  select("Row", "Column", "Timepoint", "Object.No", "immune.cells...z.position.immune.cells.Centroid.Z..µm.") %>% 
  rename_at('immune.cells...z.position.immune.cells.Centroid.Z..µm.', ~'Z_position')

data_day_2 <- data_day_2 %>% 
  select("Row", "Column", "Timepoint", "Object.No", "immune.cells...z.position.immune.cells.Centroid.Z..µm.") %>% 
  rename_at('immune.cells...z.position.immune.cells.Centroid.Z..µm.', ~'Z_position')


data_day_3 <- data_day_3 %>% 
  select("Row", "Column", "Timepoint", "Object.No", "immune.cells...z.position.immune.cells.Centroid.Z..µm.") %>% 
  rename_at('immune.cells...z.position.immune.cells.Centroid.Z..µm.', ~'Z_position')


data_day_4 <- data_day_4 %>% 
  select("Row", "Column", "Timepoint", "Object.No", "immune.cells...z.position.immune.cells.Centroid.Z..µm.") %>% 
  rename_at('immune.cells...z.position.immune.cells.Centroid.Z..µm.', ~'Z_position')


data_day_5 <- data_day_5 %>% 
  select("Row", "Column", "Timepoint", "Object.No", "immune.cells...z.position.immune.cells.Centroid.Z..µm.") %>% 
  rename_at('immune.cells...z.position.immune.cells.Centroid.Z..µm.', ~'Z_position')


data_day_6 <- data_day_6 %>% 
  select("Row", "Column", "Timepoint", "Object.No", "immune.cells...z.position.immune.cells.Centroid.Z..µm.") %>% 
  rename_at('immune.cells...z.position.immune.cells.Centroid.Z..µm.', ~'Z_position')


data_day_7 <- data_day_7 %>% 
  select("Row", "Column", "Timepoint", "Object.No", "immune.cells...z.position.immune.cells.Centroid.Z..µm.") %>% 
  rename_at('immune.cells...z.position.immune.cells.Centroid.Z..µm.', ~'Z_position')


data_day_8 <- data_day_8 %>% 
  select("Row", "Column", "Timepoint", "Object.No", "immune.cells...z.position.immune.cells.Centroid.Z..µm.") %>% 
  rename_at('immune.cells...z.position.immune.cells.Centroid.Z..µm.', ~'Z_position')


data_day_9 <- data_day_9 %>% 
  select("Row", "Column", "Timepoint", "Object.No", "immune.cells...z.position.immune.cells.Centroid.Z..µm.") %>% 
  rename_at('immune.cells...z.position.immune.cells.Centroid.Z..µm.', ~'Z_position')

View(data_day_2)

#2.0_full_join--------
##2.1_test full join-----
EDA_join <- data_day_1 %>% 
  full_join(data_day_2)  # class is diff - adjustment data_day_1$Timepoint should be character as well

##2.2_determine classes to be able to join them----
class(data_day_1$Timepoint) #int-->ch
class(data_day_2$Timepoint) #chr
class(data_day_3$Timepoint) #chr 
class(data_day_4$Timepoint) #chr
class(data_day_5$Timepoint) #chr
class(data_day_6$Timepoint) #chr
class(data_day_7$Timepoint) #chr
class(data_day_8$Timepoint) #chr
class(data_day_9$Timepoint) #int-->ch

data_day_1$Timepoint <- as.character(data_day_1$Timepoint)#int-->ch
data_day_9$Timepoint <- as.character(data_day_9$Timepoint)#int-->ch

EDA_join <- data_day_1 %>% 
  full_join(data_day_2)  # OK

##2.3_QC of full join----
nrow(data_day_1) #247253
nrow(data_day_2) # 774978
nrow(EDA_join) # 102222231

1022231-247253 # =774978
View(EDA_join) #OK

#3 full_join all into data_all----
data_all <- data_day_1 %>% 
  full_join(data_day_2) %>% 
  full_join(data_day_3) %>% 
  full_join(data_day_4) %>% 
  full_join(data_day_5) %>% 
  full_join(data_day_6) %>% 
  full_join(data_day_7) %>% 
  full_join(data_day_8) %>% 
  full_join(data_day_9)  #all in same shape - joined

nrow(data_all) #5482482



#4_0 check all variable/all timepoints-----
##4.1 - cleaning/missing values-----

View(ExpData(data=data_all, type = 2))  # no missing values - everything seems good class amybe need some adjustment
unique(data_all$Row)  # all 6 ok because of 2x triplicates
unique(data_all$Column)  # from 5 until 11 because negative CTRLs are not included



##4.2 - transforming $Timepoint and Z position chr into intiger-----

data_all$Timepoint <- as.integer(data_all$Timepoint)
data_all$Z_position <- as.integer(data_all$Z_position)

View(ExpData(data=data_all, type = 2))  # no missing values - everything seems good 

##4.3_EDA - naming based on conditions------
#QC for ROWs since the experiment was running in a 96-well plate
unique(data_all$Row)# 7
data_all <- data_all %>% 
  mutate(Treatment = case_when(Column == 5 & (Row == 2 | Row == 3 | Row == 4) ~ 'Media ctrl (5K NCI+15K T)',
                               Column == 6 & (Row == 2 | Row == 3 | Row == 4) ~ '4pg E-3Ab (5K NCI+15K T)',
                               Column == 7 & (Row == 2 | Row == 3 | Row == 4) ~ '20pg E-3Ab (5K NCI+15K T)',
                               Column == 8 & (Row == 2 | Row == 3 | Row == 4) ~ 'Media ctrl (5K NCI)',
                               Column == 9 & (Row == 2 | Row == 3 | Row == 4) ~ '4pg E-3Ab (5K NCI)',
                               Column == 10 & (Row == 2 | Row == 3 | Row == 4) ~ '20pg E-3Ab (5K NCI)',
                               Column == 11 & (Row == 2 | Row == 3 | Row == 4) ~ 'Media ctrl (15K T)',
                               Column == 5 & (Row == 5 | Row == 6 | Row == 7) ~ 'Media ctrl (5K NCI+5K T)',
                               Column == 6 & (Row == 5 | Row == 6 | Row == 7) ~ '4pg E-3Ab (5K NCI+5K T)',
                               Column == 7 & (Row == 5 | Row == 6 | Row == 7) ~ '20pg E-3Ab (5K NCI+5K T)',
                               Column == 8 & (Row == 5 | Row == 6 | Row == 7) ~ 'Media ctrl (5K NCIhCX)',
                               Column == 9 & (Row == 5 | Row == 6 | Row == 7) ~ '4pg E-3Ab (5K NCIhCX)',
                               Column == 10 & (Row == 5 | Row == 6 | Row == 7) ~ '20pg E-3Ab (5K NCIhCX)',
                               Column == 11 & (Row == 5 | Row == 6 | Row == 7) ~ '20pg E-3Ab (15K T)'))

####Outliers####
#Since the machine did not track the object in time - there is no need to remove outliers.


##4.4_exclude E7, B8 and G11 wells from the whole dataset because of damaged gel (checked under MC)-----
clean_data_all <- data_all %>% 
  filter(Row != 5 | Column != 7) %>% 
  filter(Row != 2 | Column != 8) %>% 
  filter(Row != 7 | Column != 11)


unique(clean_data_all$Row) #2-7
unique(clean_data_all$Column) #5-11
View(clean_data_all)

#5_visulization----
##5.1_BoxPlot for all time points separately----
clean_data_all %>% 
  filter(Timepoint == 1) %>% 
  ggplot() +
  aes(x = "", y = Z_position, colour = Treatment) +
  geom_boxplot(fill = "#112446", width = 1.25) +
  scale_color_hue(direction = -1) +
  theme_light()+
  ylim(-250, 1250)+
  ggtitle("Z positions time point 1")

clean_data_all %>% 
  filter(Timepoint == 2) %>% 
  ggplot() +
  aes(x = "", y = Z_position, colour = Treatment) +
  geom_boxplot(fill = "#112446", width = 1.25) +
  scale_color_hue(direction = -1) +
  theme_light()+
  ylim(-250, 1250)+
  ggtitle("Z positions time point 2")

clean_data_all %>% 
  filter(Timepoint == 3) %>% 
  ggplot() +
  aes(x = "", y = Z_position, colour = Treatment) +
  geom_boxplot(fill = "#112446", width = 1.25) +
  scale_color_hue(direction = -1) +
  theme_light()+
  ylim(-250, 1250)+
  ggtitle("Z positions time point 3")

clean_data_all %>% 
  filter(Timepoint == 4) %>% 
  ggplot() +
  aes(x = "", y = Z_position, colour = Treatment) +
  geom_boxplot(fill = "#112446", width = 1.25) +
  scale_color_hue(direction = -1) +
  theme_light()+
  ylim(-250, 1250)+
  ggtitle("Z positions time point 4")

clean_data_all %>% 
  filter(Timepoint == 5) %>% 
  ggplot() +
  aes(x = "", y = Z_position, colour = Treatment) +
  geom_boxplot(fill = "#112446", width = 1.25) +
  scale_color_hue(direction = -1) +
  theme_light()+
  ylim(-250, 1250)+
  ggtitle("Z positions time point 5")

clean_data_all %>% 
  filter(Timepoint == 6) %>% 
  ggplot() +
  aes(x = "", y = Z_position, colour = Treatment) +
  geom_boxplot(fill = "#112446", width = 1.25) +
  scale_color_hue(direction = -1) +
  theme_light()+
  ylim(-250, 1250)+
  ggtitle("Z positions time point 6")


clean_data_all %>% 
  filter(Timepoint == 7) %>% 
  ggplot() +
  aes(x = "", y = Z_position, colour = Treatment) +
  geom_boxplot(fill = "#112446", width = 1.25) +
  scale_color_hue(direction = -1) +
  theme_light()+
  ylim(-250, 1250)+
  ggtitle("Z positions time point 7")


clean_data_all %>% 
  filter(Timepoint == 8) %>% 
  ggplot() +
  aes(x = "", y = Z_position, colour = Treatment) +
  geom_boxplot(fill = "#112446", width = 1.25) +
  scale_color_hue(direction = -1) +
  theme_light()+
  ylim(-250, 1250)+
  ggtitle("Z positions time point 8")


clean_data_all %>% 
  filter(Timepoint == 9) %>% 
  ggplot() +
  aes(x = "", y = Z_position, colour = Treatment) +
  geom_boxplot(fill = "#112446", width = 1.25) +
  scale_color_hue(direction = -1) +
  theme_light()+
  ylim(-250, 1250)+
  ggtitle("Z positions time point 9")


##5.2_visualize Z positions for all timepoints animated - boxplot ----

clean_data_all %>% 
  ggplot() +
  aes(x = "", y = Z_position, colour = Treatment) +
  geom_boxplot(fill = "#112446", width = 1.25) +
  scale_color_hue(direction = -1) +
  theme_light()+
  ylim(-250, 1250)+
  labs(title = 'Timepoint: {frame_time}')+
  transition_time(Timepoint)+
  ease_aes('linear')

# Save as gif:
anim_save("boxplot_all_timepoint.gif")


#we have Z position between 0-1000 ideally but in order to be make it better to visualize we focus on only the bottom 500�m
#Furthermore remove negative numbers
#6_define arrival range and remove negative Z positions----

under_500_clean_data_all <- clean_data_all %>% 
  filter(Z_position < 500 & Z_position > 0)

View(under_500_clean_data_all)


unique(data_all$Timepoint) # OK
unique(clean_data_all$Timepoint) #OK
unique(under_500_clean_data_all$Timepoint) #OK



#7_RidgePlot with under 500- all timepoint- animated-----
under_500_clean_data_all %>%
  ggplot()+
  aes(x = Z_position, y = Treatment, fill = Treatment)+
  geom_density_ridges_gradient(scale = 3, rel_min_height = 0.01)+
  theme(legend.position = "none")+
  scale_x_continuous(limits = c(0, 200))+
  ggtitle("Z positions of time point X")+
  labs(title = 'Timepoint: {frame_time}')+
  transition_time(Timepoint)+
  ease_aes('linear')

# Save at gif:
anim_save("RidgePlot_all_timepoint.gif")


#8_export clean, under 500�m data for Tableau----
write.xlsx(under_500_clean_data_all, 'under_500.xlsx')

