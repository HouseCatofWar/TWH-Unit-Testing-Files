### Creating Faction Ability Variable with a loop




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

Faction_Ability_Names <- c("Primal Fury", "Strength in Numbers", "Scurry Away!", "Rage", "By Our Blood",
                   "Martial Prowess", "Martial Mastery", "Malign Authority", "Contempt", 
                   "Battle Harmony: Yin", "Battle Harmony: Yang", "The Peasant's Duty", "Knight",
                   "Murderous Prowess", "Murderous Mastery")

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Faction_Ability = "None")

# Code works right!
for( i in Faction_Ability_Names) {
  All_Unit_Stats <- All_Unit_Stats %>%
    mutate(Faction_Ability = if_else(abilities_1 == i |
                                       abilities_2 == i |
                                       abilities_3 == i |
                                       abilities_4 == i |
                                       abilities_5 == i |
                                       abilities_6 == i |
                                       abilities_7 == i |
                                       abilities_8 == i |
                                       abilities_9 == i |
                                       abilities_10 == i, 
                                     i, Faction_Ability, Faction_Ability))
}

### Adding more unit abilities 

## non-RoR melee infantry Abilities

Infantry_Ability_Names <- c(
  "Frenzy",
  "Guardians of the Wildwood",
  "Whirling Death",
  "Woven Mist",
  "Storm of Blades",
  "Concealment Bombs",
  "Gnoblar Traps",
  "Cloud of Flies",
  "Regeneration",
  "Enrage",
  "Primal Instincts",
  "Opportunist Murderer",
  "Deathblow",
  "Liquid Fortification",
  "Backstabbers",
  "The Hunger",
  "Blood Oath",
  "Cowardly Despoilers",
  "Rowdy")



for (i in Infantry_Ability_Names) {
  All_Unit_Stats <- All_Unit_Stats %>%
    mutate(!!i := if_else(abilities_1 == i|
                            abilities_2 == i|
                            abilities_3 == i|
                            abilities_4 == i|
                            abilities_5 == i|
                            abilities_6 == i|
                            abilities_7 == i|
                            abilities_8 == i|
                            abilities_9 == i|
                            abilities_10 == i, 
                          TRUE, FALSE, FALSE))
}

save(All_Unit_Stats, file= "Cleaned TW Unit Stats (All melee infantry abilities complete).rdata", compress = F)




