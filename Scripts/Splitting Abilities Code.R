## Split attributes code

setwd("C:/Users/Eric/OneDrive/TWH Unit Testing Files")
library(tidyverse)

load(file = "Cleaned TW Unit Stats (attributes complete).rdata")



# unique(All_Unit_Stats$abilities_1) Run for abilities 1-10

### Faction Abilities

# "Primal Fury"                         
# "Strength in Numbers" "Scurry Away!"              
# "Rage"                           
# "By Our Blood"                  
# "Martial Prowess"                
# "Martial Mastery"
# "Malign Authority"
# "Contempt"
# "Battle Harmony: Yin"           
# "Battle Harmony: Yang"  
# "The Peasant's Duty"  
# "Knight"
# "Murderous Prowess"   
# "Murderous Mastery"


All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Faction_Ability = "None") %>%
  mutate(Faction_Ability = if_else(abilities_1 == "Primal Fury" |
                                     abilities_2 == "Primal Fury" |
                                     abilities_3 == "Primal Fury" |
                                     abilities_4 == "Primal Fury" |
                                     abilities_5 == "Primal Fury" |
                                     abilities_6 == "Primal Fury" |
                                     abilities_7 == "Primal Fury" |
                                     abilities_8 == "Primal Fury" |
                                     abilities_9 == "Primal Fury" |
                                     abilities_10 == "Primal Fury", 
                                "Primal Fury", Faction_Ability, Faction_Ability)) %>%
  mutate(Faction_Ability = if_else(abilities_1 == "Rage" |
                                       abilities_2 == "Rage" |
                                       abilities_3 == "Rage" |
                                       abilities_4 == "Rage" |
                                       abilities_5 == "Rage" |
                                       abilities_6 == "Rage" |
                                       abilities_7 == "Rage" |
                                       abilities_8 == "Rage" |
                                       abilities_9 == "Rage" |
                                       abilities_10 == "Rage", 
                                  "Rage", Faction_Ability, Faction_Ability)) %>%
  mutate(Faction_Ability = if_else(abilities_1 == "By Our Blood" |
                                   abilities_2 == "By Our Blood" |
                                   abilities_3 == "By Our Blood" |
                                   abilities_4 == "By Our Blood" |
                                   abilities_5 == "By Our Blood" |
                                   abilities_6 == "By Our Blood" |
                                   abilities_7 == "By Our Blood" |
                                   abilities_8 == "By Our Blood" |
                                   abilities_9 == "By Our Blood" |
                                   abilities_10 == "By Our Blood", 
                                 "By Our Blood", Faction_Ability, Faction_Ability)) %>%
  mutate(Faction_Ability = if_else(abilities_1 == "Strength in Numbers" |
                                     abilities_2 == "Strength in Numbers" |
                                     abilities_3 == "Strength in Numbers" |
                                     abilities_4 == "Strength in Numbers" |
                                     abilities_5 == "Strength in Numbers" |
                                     abilities_6 == "Strength in Numbers" |
                                     abilities_7 == "Strength in Numbers" |
                                     abilities_8 == "Strength in Numbers" |
                                     abilities_9 == "Strength in Numbers" |
                                     abilities_10 == "Strength in Numbers", 
                                   "Strength in Numbers/Scurry Away", Faction_Ability, Faction_Ability)) %>%
  mutate(Faction_Ability = if_else(abilities_1 == "Battle Harmony: Yin"  |
                                     abilities_2 == "Battle Harmony: Yin"  |
                                     abilities_3 == "Battle Harmony: Yin"  |
                                     abilities_4 == "Battle Harmony: Yin"  |
                                     abilities_5 == "Battle Harmony: Yin"  |
                                     abilities_6 == "Battle Harmony: Yin"  |
                                     abilities_7 == "Battle Harmony: Yin"  |
                                     abilities_8 == "Battle Harmony: Yin"  |
                                     abilities_9 == "Battle Harmony: Yin"  |
                                     abilities_10 == "Battle Harmony: Yin" , 
                                   "Battle Harmony: Yin" , Faction_Ability, Faction_Ability)) %>%
  mutate(Faction_Ability = if_else(abilities_1 == "Battle Harmony: Yang" |
                                     abilities_2 == "Battle Harmony: Yang" |
                                     abilities_3 == "Battle Harmony: Yang" |
                                     abilities_4 == "Battle Harmony: Yang" |
                                     abilities_5 == "Battle Harmony: Yang" |
                                     abilities_6 == "Battle Harmony: Yang" |
                                     abilities_7 == "Battle Harmony: Yang" |
                                     abilities_8 == "Battle Harmony: Yang" |
                                     abilities_9 == "Battle Harmony: Yang" |
                                     abilities_10 == "Battle Harmony: Yang", 
                                   "Battle Harmony: Yang", Faction_Ability, Faction_Ability)) %>%
  mutate(Faction_Ability = if_else(abilities_1 == "The Peasant's Duty"  |
                                     abilities_2 == "The Peasant's Duty"  |
                                     abilities_3 == "The Peasant's Duty"  |
                                     abilities_4 == "The Peasant's Duty"  |
                                     abilities_5 == "The Peasant's Duty"  |
                                     abilities_6 == "The Peasant's Duty"  |
                                     abilities_7 == "The Peasant's Duty"  |
                                     abilities_8 == "The Peasant's Duty"  |
                                     abilities_10 == "The Peasant's Duty", 
                                   "The Peasant's Duty", Faction_Ability, Faction_Ability)) %>%
  mutate(Faction_Ability = if_else(abilities_1 == "Knight" |
                                     abilities_2 == "Knight" |
                                     abilities_3 == "Knight" |
                                     abilities_4 == "Knight" |
                                     abilities_5 == "Knight" |
                                     abilities_6 == "Knight" |
                                     abilities_7 == "Knight" |
                                     abilities_8 == "Knight" |
                                     abilities_9 == "Knight" |
                                     abilities_10 == "Knight", 
                                   "Knight", Faction_Ability, Faction_Ability)) %>%
  mutate(Faction_Ability = if_else(abilities_1 == "Contempt" |
                                     abilities_2 == "Contempt" |
                                     abilities_3 == "Contempt" |
                                     abilities_4 == "Contempt" |
                                     abilities_5 == "Contempt" |
                                     abilities_6 == "Contempt" |
                                     abilities_7 == "Contempt" |
                                     abilities_8 == "Contempt" |
                                     abilities_9 == "Contempt" |
                                     abilities_10 == "Contempt", 
                                   "Contempt", Faction_Ability, Faction_Ability)) %>%
  mutate(Faction_Ability = if_else(abilities_1 == "Malign Authority" |
                                     abilities_2 == "Malign Authority" |
                                     abilities_3 == "Malign Authority" |
                                     abilities_4 == "Malign Authority" |
                                     abilities_5 == "Malign Authority" |
                                     abilities_6 == "Malign Authority" |
                                     abilities_7 == "Malign Authority" |
                                     abilities_8 == "Malign Authority" |
                                     abilities_9 == "Malign Authority" |
                                     abilities_10 == "Malign Authority", 
                                   "Malign Authority", Faction_Ability, Faction_Ability)) %>%
  mutate(Faction_Ability = if_else(abilities_1 == "Martial Prowess" |
                                     abilities_2 == "Martial Prowess" |
                                     abilities_3 == "Martial Prowess" |
                                     abilities_4 == "Martial Prowess" |
                                     abilities_5 == "Martial Prowess" |
                                     abilities_6 == "Martial Prowess" |
                                     abilities_7 == "Martial Prowess" |
                                     abilities_8 == "Martial Prowess" |
                                     abilities_9 == "Martial Prowess" |
                                     abilities_10 == "Martial Prowess", 
                                   "Martial Prowess", Faction_Ability, Faction_Ability)) %>%
  mutate(Faction_Ability = if_else(abilities_1 == "Martial Mastery" |
                                     abilities_2 == "Martial Mastery" |
                                     abilities_3 == "Martial Mastery" |
                                     abilities_4 == "Martial Mastery" |
                                     abilities_5 == "Martial Mastery" |
                                     abilities_6 == "Martial Mastery" |
                                     abilities_7 == "Martial Mastery" |
                                     abilities_8 == "Martial Mastery" |
                                     abilities_9 == "Martial Mastery" |
                                     abilities_10 == "Martial Mastery", 
                                   "Martial Mastery", Faction_Ability, Faction_Ability)) %>%
  mutate(Faction_Ability = if_else(abilities_1 == "Murderous Prowess" |
                                     abilities_2 == "Murderous Prowess" |
                                     abilities_3 == "Murderous Prowess" |
                                     abilities_4 == "Murderous Prowess" |
                                     abilities_5 == "Murderous Prowess" |
                                     abilities_6 == "Murderous Prowess" |
                                     abilities_7 == "Murderous Prowess" |
                                     abilities_8 == "Murderous Prowess" |
                                     abilities_9 == "Murderous Prowess" |
                                     abilities_10 == "Murderous Prowess", 
                                   "Murderous Prowess", Faction_Ability, Faction_Ability)) %>%
  mutate(Faction_Ability = if_else(abilities_1 == "Murderous Mastery" |
                                     abilities_2 == "Murderous Mastery" |
                                     abilities_3 == "Murderous Mastery" |
                                     abilities_4 == "Murderous Mastery" |
                                     abilities_5 == "Murderous Mastery" |
                                     abilities_6 == "Murderous Mastery" |
                                     abilities_7 == "Murderous Mastery" |
                                     abilities_8 == "Murderous Mastery" |
                                     abilities_9 == "Murderous Mastery" |
                                     abilities_10 == "Murderous Mastery", 
                                   "Murderous Mastery", Faction_Ability, Faction_Ability))

# save(All_Unit_Stats, file= "Cleaned TW Unit Stats (faction abilities complete).rdata", compress = F)




### non-RoR melee infantry Abilities

# "Frenzy"                        
# "Guardians of the Wildwood"
# "Whirling Death"                
# "Woven Mist" 
# "Storm of Blades"  
# "Concealment Bombs"    
# "Gnoblar Traps"                  
# "Cloud of Flies"     
# "Regeneration"                  
# "Enrage"                         
# "Primal Instincts"   
# "Opportunist Murderer"          
# "Deathblow"                      
# "Liquid Fortification"  
# "Backstabbers"
# "The Hunger"                    
# "Blood Oath"           
# "Cowardly Despoilers"            
# "Rowdy"