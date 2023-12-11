### Total Warhammer Unit Stats File Cleaning and Organization

setwd("C:/Users/Eric/OneDrive/TWH Unit Testing Files")

library(tidyverse)

## Import and create Rdata file
library(readxl)
# TW_unit_stats_for_import <- read_excel("TW unit stats for import.xlsx")
# All_Unit_Stats <- TW_unit_stats_for_import
# save(All_Unit_Stats, file= "Cleaned TW Unit Stats.rdata", compress = F)
# load(file = "Cleaned TW Unit Stats.rdata")


## Clean Column Titles
All_Unit_Stats <- rename(All_Unit_Stats, RoR = ror, Name = name, Unit_Type = caste)
All_Unit_Stats <- rename(All_Unit_Stats, MP_cost = multiplayer_cost, Speed = speed, Armor= armour,
                         Shield_Block_Chance = parry_chance, LD = leadership, MA = melee_attack,
                         MD = melee_defence, CB = charge_bonus,Melee_base_WS = 
                           primary_melee_weapon_base_damage, Melee_AP_WS = primary_melee_weapon_ap_damage,
                         Magic_Resist = damage_mod_magic, Phys_Resist = damage_mod_physical, 
                         Missile_Resist = damage_mod_missile, Ward_Save = damage_mod_all,
                         Melee_Attack_Interval = primary_melee_weapon_melee_attack_interval, 
                         Melee_Bvi = primary_melee_weapon_bonus_v_infantry, 
                         Melee_BvL = primary_melee_weapon_bonus_v_large)


# Clean Faction Names
All_Unit_Stats$Faction <- replace(All_Unit_Stats$Faction, All_Unit_Stats$Faction 
                                  == "wh_dlc05_wef_wood_elves", "Wood_Elves")
All_Unit_Stats$Faction <- replace(All_Unit_Stats$Faction, All_Unit_Stats$Faction 
                                  == "wh_main_vmp_vampire_counts", "Vampire_Counts")
All_Unit_Stats$Faction <- replace(All_Unit_Stats$Faction, All_Unit_Stats$Faction 
                                  == "wh3_main_tze_tzeentch", "Tzeentch")
All_Unit_Stats$Faction <- replace(All_Unit_Stats$Faction, All_Unit_Stats$Faction
                                  == "wh3_main_dae_daemon_prince", "DoC")
All_Unit_Stats$Faction <- replace(All_Unit_Stats$Faction, All_Unit_Stats$Faction
                                  == "wh2_dlc09_tmb_tomb_kings", "Tomb_Kings")
All_Unit_Stats$Faction <- replace(All_Unit_Stats$Faction, All_Unit_Stats$Faction
                                  == "wh_main_chs_chaos", "WoC")
All_Unit_Stats$Faction <- replace(All_Unit_Stats$Faction, All_Unit_Stats$Faction
                                  == "wh3_main_sla_slaanesh", "Slaanesh")
All_Unit_Stats$Faction <- replace(All_Unit_Stats$Faction, All_Unit_Stats$Faction
                                  == "wh2_main_skv_skaven", "Skaven")
All_Unit_Stats$Faction <- replace(All_Unit_Stats$Faction, All_Unit_Stats$Faction
                                  == "wh3_main_ogr_ogre_kingdoms", "Ogres")
All_Unit_Stats$Faction <- replace(All_Unit_Stats$Faction, All_Unit_Stats$Faction
                                  == "wh3_main_nur_nurgle", "Nurgle")
All_Unit_Stats$Faction <- replace(All_Unit_Stats$Faction, All_Unit_Stats$Faction
                                  == "wh_dlc08_nor_norsca", "Norsca")
All_Unit_Stats$Faction <- replace(All_Unit_Stats$Faction, All_Unit_Stats$Faction
                                  == "wh2_main_lzd_lizardmen", "Lizardmen")
All_Unit_Stats$Faction <- replace(All_Unit_Stats$Faction, All_Unit_Stats$Faction
                                  == "wh2_main_def_dark_elves", "Dark_Elves")
All_Unit_Stats$Faction <- replace(All_Unit_Stats$Faction, All_Unit_Stats$Faction
                                  == "wh3_main_ksl_kislev", "Kislev")
All_Unit_Stats$Faction <- replace(All_Unit_Stats$Faction, All_Unit_Stats$Faction
                                  == "wh_main_emp_empire", "Empire")
All_Unit_Stats$Faction <- replace(All_Unit_Stats$Faction, All_Unit_Stats$Faction
                                  == "wh_main_dwf_dwarfs", "Dwarfs")
All_Unit_Stats$Faction <- replace(All_Unit_Stats$Faction, All_Unit_Stats$Faction
                                  == "wh3_main_kho_khorne", "Khorne")
All_Unit_Stats$Faction <- replace(All_Unit_Stats$Faction, All_Unit_Stats$Faction
                                  == "wh2_main_hef_high_elves", "High_Elves")
All_Unit_Stats$Faction <- replace(All_Unit_Stats$Faction, All_Unit_Stats$Faction
                                  == "wh_main_grn_greenskins", "Greenskins")
All_Unit_Stats$Faction <- replace(All_Unit_Stats$Faction, All_Unit_Stats$Faction
                                  == "wh3_main_cth_cathay_mp", "Cathay")
All_Unit_Stats$Faction <- replace(All_Unit_Stats$Faction, All_Unit_Stats$Faction
                                  == "wh2_dlc11_cst_vampire_coast", "Vampire_Coast")
All_Unit_Stats$Faction <- replace(All_Unit_Stats$Faction, All_Unit_Stats$Faction
                                  == "wh3_dlc23_chd_legion_of_azgorh", "Chaos_Dwarfs")
All_Unit_Stats$Faction <- replace(All_Unit_Stats$Faction, All_Unit_Stats$Faction
                                  == "wh_dlc03_bst_beastmen", "Beastmen")
All_Unit_Stats$Faction <- replace(All_Unit_Stats$Faction, All_Unit_Stats$Faction
                                  == "wh_main_brt_bretonnia", "Bretonnia")


# Drop units without a faction because they are all duplicates (likely summons)
All_Unit_Stats <- subset(All_Unit_Stats, Faction != "NA")


## Split fire weakness and resist
All_Unit_Stats$damage_mod_flame[is.na(All_Unit_Stats$damage_mod_flame)] <- 0

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Fire_Resist = damage_mod_flame)
  
All_Unit_Stats$Fire_Resist <- replace(All_Unit_Stats$Fire_Resist, 
                                      All_Unit_Stats$Fire_Resist < 0, 0) 
All_Unit_Stats <- rename(All_Unit_Stats, Fire_Weakness = damage_mod_flame)
All_Unit_Stats$Fire_Weakness <- replace(All_Unit_Stats$Fire_Weakness,
                                        All_Unit_Stats$Fire_Weakness > 0, 0) 

  
## Split weapon contact effects
# unique(All_Unit_Stats$primary_melee_weapon_contact_effect)
# [1] "Poison!"                                                                 
# [2] NA                                                                        
# [3] "Sundered Armour"                                                         
# [4] "Frostbite!"                                                              
# [5] "Dampen!\\\\n[[img:icon_magical_attacks]][[/img]] Removes Magical Attacks"
# [6] "Warpflame!"                                                              
# [7] "Soporific Musk!"                                                         
# [8] "Charmed!"                                                                
# [9] "Euphoric!"                                                               
# [10] "Weeping Blade"                                                           
# [11] "Contaminated!"                                                           
# [12] "Zzzzap!"                                                                 
# [13] "Dazed!"                                                                  
# [14] "Dark Blood Tainted"                                                      
# [15] "Madness of Khaine!"                                                      
# [16] "Disrupted!"                                                              
# [17] "Flammable!"                                                              
# [18] "Burnt!"                      

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Poison_Contact = if_else(primary_melee_weapon_contact_effect == "Poison!",
                                  TRUE, FALSE, missing = FALSE))

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Sundered_Armor_Contact = if_else(primary_melee_weapon_contact_effect == "Sundered Armour",
                                  TRUE, FALSE, missing = FALSE))

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Frostbite_Contact = if_else(primary_melee_weapon_contact_effect == "Frostbite!",
                                  TRUE, FALSE, missing = FALSE))

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Dampen_Contact = if_else(primary_melee_weapon_contact_effect == "Dampen!\\\\n[[img:icon_magical_attacks]][[/img]] Removes Magical Attacks",
                                  TRUE, FALSE, missing = FALSE))

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Warpflame_Contact = if_else(primary_melee_weapon_contact_effect == "Warpflame!",
                                  TRUE, FALSE, missing = FALSE))

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Soporific_Musk_Contact = if_else(primary_melee_weapon_contact_effect == "Soporific Musk!",
                                  TRUE, FALSE, missing = FALSE))

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Charmed_Contact = if_else(primary_melee_weapon_contact_effect == "Charmed!",
                                  TRUE, FALSE, missing = FALSE))

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Euphoric_Contact = if_else(primary_melee_weapon_contact_effect == "Euphoric!",
                                 TRUE, FALSE, missing = FALSE))

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Weeping_Blade_Contact = if_else(primary_melee_weapon_contact_effect == "Weeping Blade",
                                  TRUE, FALSE, missing = FALSE))

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Contaminated_Contact = if_else(primary_melee_weapon_contact_effect == "Contaminated!",
                                        TRUE, FALSE, missing = FALSE))

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Zzzzap_Contact = if_else(primary_melee_weapon_contact_effect == "Zzzzap!",
                                  TRUE, FALSE, missing = FALSE))

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Dazed_Contact = if_else(primary_melee_weapon_contact_effect == "Dazed!",
                                  TRUE, FALSE, missing = FALSE))

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Dark_Blood_Tainted_Contact = if_else(primary_melee_weapon_contact_effect == "Dark Blood Tainted",
                                 TRUE, FALSE, missing = FALSE))

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Madness_of_Khaine_Contact = if_else(primary_melee_weapon_contact_effect == "Madness of Khaine!",
                                 TRUE, FALSE, missing = FALSE))

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Disrupted_Contact = if_else(primary_melee_weapon_contact_effect == "Disrupted!",
                                  TRUE, FALSE, missing = FALSE))

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Flammable_Contact = if_else(primary_melee_weapon_contact_effect == "Flammable!",
                                 TRUE, FALSE, missing = FALSE))

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Burnt_Contact = if_else(primary_melee_weapon_contact_effect == "Burnt!",
                                 TRUE, FALSE, missing = FALSE))

# 
# save(All_Unit_Stats, file= "Cleaned TW Unit Stats (melee contact complete).rdata", compress = F)

