### Exploratory plotting


setwd("C:/Users/Eric/OneDrive/TWH Unit Testing Files")

library(tidyverse)
library(stargazer)
library(ggplot2)

load(file = "MP Melee Infantry for Analysis.rdata")

Condensed_MP_Melee_Units <- All_MP_Melee_Infantry %>%
  select(MP_cost, Faction, Name, HP_including_barrier, LD, Armor, Speed, 
         Shield_Block_Chance, MA:Ward_Save, can_skirmish:Melee_AP_WS, Melee_BvL,
         Melee_Bvi, primary_melee_weapon_contact_effect, Fire_Resist, mortal_status,
         Encourage_Att:Rowdy)



## Testing Predict
Core_Stats <- All_MP_Melee_Infantry %>%
  select(MP_cost, Faction, Name, HP_including_barrier, LD, Armor, MA, MD, Speed, 
         Melee_base_WS, Melee_AP_WS, CB, mortal_status)

core_reg <- lm(MP_cost ~ HP_including_barrier + LD + Armor + MA + MD + Speed + Melee_base_WS +
                 Melee_AP_WS + CB + mortal_status,
               data = Core_Stats)

table_core_reg <- stargazer(core_reg, type = "text")

doc_table_core_reg <- table_core_reg %>%
  write.csv(file = "core reg table.csv")

Unit_values <- Core_Stats %>%
  mutate(Predicted_MP_Cost = predict(core_reg, newdata=Core_Stats)) %>%
  mutate(Cost_difference = MP_cost - Predicted_MP_Cost)

Unit_values %>%
  select(Faction, Name, Cost_difference, MP_cost, Predicted_MP_Cost) %>%
  group_by(Faction) %>%
    write.csv(file = "core cost difference table.csv")
  
Unit_values %>%
  select(Faction, Name, Cost_difference, MP_cost, Predicted_MP_Cost) %>%
  slice_min(Cost_difference, n=10)

Unit_values %>%
  select(Faction, Name, Cost_difference, MP_cost, Predicted_MP_Cost) %>%
  slice_max(Cost_difference, n=10)


## Plotting WS correlation 


ggplot(Core_Stats, aes(Melee_base_WS, Melee_AP_WS)) + 
  geom_point()

# testing different WS measures


## Testing Predict
Core_Stats2 <- Core_Stats %>%
  mutate(Total_WS = Melee_base_WS + Melee_AP_WS) %>%
  mutate(AP_ratio = Melee_AP_WS/Total_WS*100) %>%
  
ggplot(Core_Stats2, aes(AP_ratio, MP_cost)) +
  geom_point()
  
Core_Stats2 <- Core_Stats2 %>%  
  mutate(AP_category = case_when(AP_ratio < 15 ~ "Low AP",
                                 AP_ratio >= 15 & AP_ratio <= 27 ~ "Normal AP (low)",
                                 AP_ratio > 27 & AP_ratio < 50 ~ "Normal AP (high)",
                                 AP_ratio >= 50 & AP_ratio < 100 ~ "High AP",
                                 AP_ratio == 100 ~ "All AP"))

Core_Stats2$AP_category <- as.factor(Core_Stats2$AP_category)
Core_Stats2 <- within(Core_Stats2, AP_category <- 
                                  relevel(AP_category, ref = "Low AP"))

Core_Stats2$mortal_status <- as.factor(Core_Stats2$mortal_status)
core2_reg <- lm(MP_cost ~ HP_including_barrier + LD + Armor + MA + MD + Speed + Total_WS +
                 AP_category + CB + mortal_status,
               data = Core_Stats2)

table_core2_reg <- stargazer(core2_reg, type = "text")

anova_result <- anova(core2_reg)
tukey_results <- TukeyHSD(anova_result)



Unit_values <- Core_Stats2 %>%
  mutate(Predicted_MP_Cost = predict(core_reg, newdata=Core_Stats2)) %>%
  mutate(Cost_difference = MP_cost - Predicted_MP_Cost)

Unit_values %>%
  select(Faction, Name, Cost_difference, MP_cost, Predicted_MP_Cost) %>%
  slice_min(Cost_difference, n=10)

Unit_values %>%
  select(Faction, Name, Cost_difference, MP_cost, Predicted_MP_Cost) %>%
  slice_max(Cost_difference, n=10)
