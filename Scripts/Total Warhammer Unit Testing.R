### Total Warhammer Unit Testing

setwd("C:/Users/Eric/OneDrive/TWH Unit Testing Files")

library(tidyverse)


# Defining a Marauder
Marauder <- c("WoC", "Marauder", 15, 34, 28, 21, 7)
names(Marauder) <- c("Faction", "Name", "Armor", "Melee Attack", "Melee Defense", 
                     "Non-AP Weapon Damage", "AP Weapon Damage")
print(Marauder)

# Defining a Chaos Warrior
Chaos_Warrior <- c("WoC", "Chaos Warrior", 100, 36, 44, 26, 10)
names(Chaos_Warrior) <- c("Faction", "Name", "Armor", "Melee Attack", "Melee Defense", 
                     "Non-AP Weapon Damage", "AP Weapon Damage")
print(Chaos_Warrior)
  
## Stat vectors
Armor_Values <- c(0:200)
Melee_Attack <- c(0:100)
Melee_Defense <- c(0:100)
Non_AP_Weapon_Damage <- c(1:150)
AP_Weapon_Damage <- c(1:150)


## Defining an attack functions
Hit_Chance <- function(MA,MD) {
  if ((35 + MA - MD)/100 < .1) {
    return(.1)
  }
  (35 + MA - MD)/100
}

Armor_Reduction <- function(Armor) {
  mean(Armor:(Armor/2))/100
}

Mean_DMG_per_Hit <- function(Non_AP_WS, AP_WS, Armor) {
  (Non_AP_WS*(1-Armor_Reduction(Armor)) + AP_WS)
}

Mean_DMG_per_ATK<- function(MA, MD, Non_AP_WS, AP_WS, Armor) {
  Hit_Chance(MA,MD) * Mean_DMG_per_Hit(Non_AP_WS,AP_WS,Armor)
}
