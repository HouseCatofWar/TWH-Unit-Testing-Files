### TWH melee infantry unit regression analysis

setwd("C:/Users/Eric/OneDrive/TWH Unit Testing Files")

library(tidyverse)
library(stargazer)

load(file = "MP Melee Infantry for Analysis.rdata")


### Regression with everything

## Only relevant variables

Condensed_MP_Melee_Units <- All_MP_Melee_Infantry %>%
  select(MP_cost, Faction, Name, HP_including_barrier, LD, Armor, Speed, 
         Shield_Block_Chance, MA:Ward_Save, can_skirmish:Melee_AP_WS, Melee_BvL,
         Melee_Bvi, primary_melee_weapon_contact_effect, Fire_Resist, Encourage_Att:Rowdy)

For_excel_melee_inf <- Condensed_MP_Melee_Units %>%
  write.csv(file = "Melee Infantry test.csv")

## base stat reg
reg1 <- lm(MP_cost ~ HP_including_barrier + LD + Armor + MA + MD + Speed + Melee_base_WS +
             Melee_AP_WS + CB, 
           data = Condensed_MP_Melee_Units)

table_reg1 <- stargazer(reg1, type = "text")


## Regression with everything

reg2 <- lm(MP_cost ~ HP_including_barrier + LD + Armor + MA + MD + Speed + Melee_base_WS +
      Melee_AP_WS + CB + Shield_Block_Chance + Fire_Weakness + Fire_Resist + Phys_Resist +
      Missile_Resist + Magic_Resist + Ward_Save + primary_melee_weapon_is_flaming +
      primary_melee_weapon_is_magical + primary_melee_weapon_contact_effect, 
      data = Condensed_MP_Melee_Units)

table_reg2 <- stargazer(reg2, type = "text")




# only mortals reg
only_mortals <- Condensed_MP_Melee_Units %>%
  filter(Undead_Att == F, Demonic_Att == F)

reg3 <- lm(MP_cost ~ HP_including_barrier + LD + Armor + MA + MD + Speed + Melee_base_WS +
             Melee_AP_WS + CB, 
           data = only_mortals)

table_reg3 <- stargazer(reg3, type = "text")
# Only mortals makes LD's coefficient larger and more significant. 
# Probably should consider it separately 


