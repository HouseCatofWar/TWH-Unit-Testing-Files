

setwd("C:/Users/Eric/OneDrive/TWH Unit Testing Files")

library(tidyverse)

load("C:/Users/Eric/OneDrive/TWH Unit Testing Files/Cleaned TW Unit Stats (All melee infantry abilities complete).rdata")



### Selecting only generic melee infantry units

All_Melee_Infantry <- All_Unit_Stats %>%
  filter(RoR == F, elector == F, blessed == F, crafted == F, tech == F, Unit_Type == "Melee Infantry")


For_excel_melee_inf <- All_Melee_Infantry %>%
  select(Faction, Name, MP_cost) %>%
  group_by(Faction) %>%
  write.csv(file = "Melee Infantry test.csv")


## remove misclassified units
All_MP_Melee_Infantry <- All_Melee_Infantry %>%
  filter(Name != "Grail Reliquae", Name != "Explosive Squig", Name != "Plague Toads of Nurgle",
         Name != "Spider Hatchlings", Name != "Squig Herd", Name != "Athel Tamarha Faithbearers",
         Name != "Gate Guard", Name != "Skin Wolves", Name != "Skin Wolves (Armoured)", 
         Name != "Gorgers", Name != "Warp-Grinders", Name != "Sartosa Free Company", 
         Name != "Malevolent Dryads", Name != "Aspiring Champions")

## remove units on the wrong faction
All_MP_Melee_Infantry <- All_MP_Melee_Infantry %>%
  filter(Name != "Dryads" | Faction != "High_Elves", Name != "Crypt Ghouls" | Faction != "Tomb_Kings")


# save
save(All_MP_Melee_Infantry, file= "MP Melee Infantry for Analysis.rdata", compress = F)


## recategorize real units that should not be melee infantry
types <-  unique(All_Unit_Stats$Unit_Type) 
print(types)

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Unit_Type = replace(Unit_Type, Name == "Skin Wolves" | Name == "Skin Wolves (Armoured)" |
                               Name == "Maws of Savagery (Skin Wolves - Armoured)" |
                               Name == "Plague Toads of Nurgle" | Name== "Squig Herd" |
                               Name == "Gorgers" | Name=="Aspiring Champions", "Monstrous Infantry"))

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Unit_Type = replace(Unit_Type, Name == "Warp-Grinders" | Name == "Grail Reliquae" ,
                             "Specialist"))


## variable manipulation
# barrier as HP
All_Unit_Stats <- All_Unit_Stats %>%
  mutate(HP_including_barrier = barrier_health + health)
# variable NA to 0
All_Unit_Stats$Missile_Resist[is.na(All_Unit_Stats$Missile_Resist)] <- 0

All_Unit_Stats$Melee_BvL[is.na(All_Unit_Stats$Melee_BvL)] <- 0

All_Unit_Stats$Melee_Bvi[is.na(All_Unit_Stats$Melee_Bvi)] <- 0


All_Unit_Stats$primary_melee_weapon_contact_effect[is.na(All_Unit_Stats$primary_melee_weapon_contact_effect)] <- "None"


## Add a mortal/undead/demonic variable
All_Unit_Stats <- All_Unit_Stats %>%
  mutate(mortal_status = case_when(Undead_Att == T  ~ "Undead",
                                   Demonic_Att == T ~ "Demonic",
                                   Undead_Att == F & Demonic_Att == F ~ "Mortal"))


#cleaning
All_MP_Melee_Infantry$primary_melee_weapon_contact_effect <- as.factor(All_MP_Melee_Infantry$primary_melee_weapon_contact_effect)
All_MP_Melee_Infantry <- within(All_MP_Melee_Infantry, primary_melee_weapon_contact_effect <- 
                                  relevel(primary_melee_weapon_contact_effect, ref = "None"))



## Save to update all unit stats file with corrected unit types
save(All_Unit_Stats, file= "Cleaned TW Unit Stats (All melee infantry abilities complete).rdata", compress = F)






check <- All_MP_Melee_Infantry %>%
  select(Name, primary_melee_weapon_splash_attack_max_attacks, primary_melee_weapon_splash_attack_target_size) %>%
  arrange(desc(primary_melee_weapon_splash_attack_max_attacks))




