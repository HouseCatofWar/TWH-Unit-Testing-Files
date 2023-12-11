## Split attributes code

setwd("C:/Users/Eric/OneDrive/TWH Unit Testing Files")
library(tidyverse)

load(file = "Cleaned TW Unit Stats (melee contact complete).rdata")

# unique(All_Unit_Stats$attributes_1)  Run for attributes 1-8

# [1] "Can Fly||This unit can fly."                                                                                                                                                                                                                                                                                                                                                                                                                                 
# [2] "Encourage||This unit provides a [[img:icon_morale]][[/img]]leadership bonus to nearby allies. Units within range of both the [[img:icon_general]][[/img]]Lord's aura and an encouraging unit will receive the larger of the two bonuses."                                                                                                                                                                                                                    
# [4] "Vanguard Deployment||This unit can deploy outside the deployment zone."                                                                                                                                                                                                                                                                                                                                                                                      
# [5] "Woodsman||This unit can pass through trees."                                                                                                                                                                                                                                                                                                                                                                                                                 
# [6] "Immune to Psychology||The unit is immune to psychological attacks (Fear & Terror)."                                                                                                                                                                                                                                                                                                                                                                          
# [7] "Charge Reflection||When [[img:icon_braced]][[/img]]bracing, this unit deals additional damage when attacking charging enemies."                                                                                                                                                                                                                                                                                                                              
# [8] "Expendable||Witnessing friendly expendable units rout does not reduce other units' [[img:icon_morale]][[/img]]leadership, unless they are themselves expendable."                                                                                                                                                                                                                                                                                            
# [9] "Causes Fear||This unit frightens all enemy units, reducing their [[img:icon_morale]][[/img]]leadership when nearby. It is also immune to fear. Fear penalties do not stack."                                                                                                                                                                                                                                                                                 
# [10] "Causes Terror||This unit can cause terror, making its melee target rout for a short time. Units that cause terror are immune to terror and fear themselves."                                                                                                                                                                                                                                                                                                 
# [11] "Undead||This unit is Undead (does not rout, immune to terror, becomes unstable when [[img:icon_morale]][[/img]]{{tr:morale}} is low)."                                                                                                                                                                                                                                                                                                                       
# [13] "Strider||Speed and combat penalties caused by terrain are ignored by this unit."                                                                                                                                                                                                                                                                                                                                                                             
# [14] "Fire Whilst Moving||This unit can fire while on the move."                                                                                                                                                                                                                                                                                                                                                                                                   
# [17] "Daemonic||This unit is Daemonic (has physical resistance, does not rout, is immune to terror, takes damage when [[img:icon_morale]][[/img]]Leadership is low)"                                                                                                                                                                                                                                                                                               
# [18] "Construct||This unit is an animated construct (does not rout, is immune to terror, becomes unstable when [[img:icon_morale]][[/img]]Leadership is low). Necrotects can push it to its full combat potential and restore it in battle."                                                                                                                                                                                                                       
# [19] "Perfect Vigour||Even when performing the most fatiguing actions, this unit never loses vigour."                                                                                                                                                                                                                                                                                                                                                              
# [20] "Devastating Flanker||Entities with this attribute double their charge bonus when attacking the rear or flank of an entity."                                                                                                                                                                                                                                                                                                                                  
# [22] "Unbreakable||This unit does not suffer any form of [[img:icon_morale]][[/img]]leadership loss and will never rout."                                                                                                                                                                                                                                                                                                                                          
# [24] "Snipe||This unit remains hidden while firing."                                                                                                                                                                                                                                                                                                                                                                                                               
# [26] "Rampage||When this unit gets hurt it may go on a rampage against nearby enemy units, attacking the closest one and ignoring any orders given."                                                                                                                                                                                                                                                                                                               
# [27] "Ogre Charge||When attacking [[img:icon_braced]][[/img]]braced charge defenders, this unit only loses half of its [[img:icon_charge]][[/img]]charge bonus."                                                                                                                                                                                                                                                                                                   
# [31] "Immune to Contact Effects||Entities with this attribute ignore the effects of enemy contact effects such as [[img:icon_poison]][[/img]] Poison"                                                                                                                                                                                                                                                                                                              
# [32] "Expert Charge Defence||When [[img:icon_braced]][[/img]]bracing, this unit negates the [[img:icon_charge]][[/img]]charge bonus of any attacker."                                                                                                                                                                                                                                                                                                              
# [33] "Charge Defence vs. Large||When bracing[[img:icon_braced]][[/img]], this unit negates the [[img:icon_charge]][[/img]]charge bonus of any large attacker."                                                                                                                                                                                                                                                                                                     
# [34] "Mastery of Elemental Winds||When two or more units in the same army share this attribute, [[img:icon_spell_mastery]][[/img]] intensity increases the power of spells cast."                                                                                                                                                                                                                                                                                  
# [35] "Stalk||This unit can move hidden in any terrain."  


All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Flying_Att = if_else(attributes_1 == "Can Fly||This unit can fly." |
                                     attributes_2 == "Can Fly||This unit can fly." |
                                     attributes_3 == "Can Fly||This unit can fly." |
                                     attributes_4 == "Can Fly||This unit can fly." |
                                     attributes_5 == "Can Fly||This unit can fly." |
                                     attributes_6 == "Can Fly||This unit can fly." |
                                     attributes_7 == "Can Fly||This unit can fly." |
                                     attributes_8 == "Can Fly||This unit can fly." ,
                                   TRUE, FALSE, missing = FALSE)) 

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Encourage_Att = if_else(attributes_1 == "Encourage||This unit provides a [[img:icon_morale]][[/img]]leadership bonus to nearby allies. Units within range of both the [[img:icon_general]][[/img]]Lord's aura and an encouraging unit will receive the larger of the two bonuses." |
                                      attributes_2 == "Encourage||This unit provides a [[img:icon_morale]][[/img]]leadership bonus to nearby allies. Units within range of both the [[img:icon_general]][[/img]]Lord's aura and an encouraging unit will receive the larger of the two bonuses." |
                                      attributes_3 == "Encourage||This unit provides a [[img:icon_morale]][[/img]]leadership bonus to nearby allies. Units within range of both the [[img:icon_general]][[/img]]Lord's aura and an encouraging unit will receive the larger of the two bonuses." |
                                      attributes_4 == "Encourage||This unit provides a [[img:icon_morale]][[/img]]leadership bonus to nearby allies. Units within range of both the [[img:icon_general]][[/img]]Lord's aura and an encouraging unit will receive the larger of the two bonuses." |
                                      attributes_5 == "Encourage||This unit provides a [[img:icon_morale]][[/img]]leadership bonus to nearby allies. Units within range of both the [[img:icon_general]][[/img]]Lord's aura and an encouraging unit will receive the larger of the two bonuses." |
                                      attributes_6 == "Encourage||This unit provides a [[img:icon_morale]][[/img]]leadership bonus to nearby allies. Units within range of both the [[img:icon_general]][[/img]]Lord's aura and an encouraging unit will receive the larger of the two bonuses." |
                                      attributes_7 == "Encourage||This unit provides a [[img:icon_morale]][[/img]]leadership bonus to nearby allies. Units within range of both the [[img:icon_general]][[/img]]Lord's aura and an encouraging unit will receive the larger of the two bonuses." |
                                      attributes_8 == "Encourage||This unit provides a [[img:icon_morale]][[/img]]leadership bonus to nearby allies. Units within range of both the [[img:icon_general]][[/img]]Lord's aura and an encouraging unit will receive the larger of the two bonuses." ,
                                    TRUE, FALSE, missing = FALSE)) 

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Vanguard_Att= if_else(attributes_1 == "Vanguard Deployment||This unit can deploy outside the deployment zone." |
                                      attributes_2 == "Vanguard Deployment||This unit can deploy outside the deployment zone.." |
                                      attributes_3 == "Vanguard Deployment||This unit can deploy outside the deployment zone." |
                                      attributes_4 == "Vanguard Deployment||This unit can deploy outside the deployment zone." |
                                      attributes_5 == "Vanguard Deployment||This unit can deploy outside the deployment zone." |
                                      attributes_6 == "Vanguard Deployment||This unit can deploy outside the deployment zone." |
                                      attributes_7 == "Vanguard Deployment||This unit can deploy outside the deployment zone." |
                                      attributes_8 == "Vanguard Deployment||This unit can deploy outside the deployment zone." ,
                                    TRUE, FALSE, missing = FALSE)) 

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Woodsman_Att = if_else(attributes_1 == "Woodsman||This unit can pass through trees." |
                                      attributes_2 == "Woodsman||This unit can pass through trees." |
                                      attributes_3 == "Woodsman||This unit can pass through trees." |
                                      attributes_4 == "Woodsman||This unit can pass through trees." |
                                      attributes_5 == "Woodsman||This unit can pass through trees." |
                                      attributes_6 == "Woodsman||This unit can pass through trees." |
                                      attributes_7 == "Woodsman||This unit can pass through trees." |
                                      attributes_8 == "Woodsman||This unit can pass through trees." ,
                                    TRUE, FALSE, missing = FALSE)) 

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Immune_to_Psych_Att = if_else(attributes_1 == "Immune to Psychology||The unit is immune to psychological attacks (Fear & Terror)." |
                                      attributes_2 == "Immune to Psychology||The unit is immune to psychological attacks (Fear & Terror)." |
                                      attributes_3 == "Immune to Psychology||The unit is immune to psychological attacks (Fear & Terror)." |
                                      attributes_4 == "Immune to Psychology||The unit is immune to psychological attacks (Fear & Terror)." |
                                      attributes_5 == "Immune to Psychology||The unit is immune to psychological attacks (Fear & Terror)." |
                                      attributes_6 == "Immune to Psychology||The unit is immune to psychological attacks (Fear & Terror)." |
                                      attributes_7== "Immune to Psychology||The unit is immune to psychological attacks (Fear & Terror)." |
                                      attributes_8 == "Immune to Psychology||The unit is immune to psychological attacks (Fear & Terror)." ,
                                    TRUE, FALSE, missing = FALSE)) 

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Charge_Reflection_Att = if_else(attributes_1 == "Charge Reflection||When [[img:icon_braced]][[/img]]bracing, this unit deals additional damage when attacking charging enemies." |
                                      attributes_2 == "Charge Reflection||When [[img:icon_braced]][[/img]]bracing, this unit deals additional damage when attacking charging enemies." |
                                      attributes_3 == "Charge Reflection||When [[img:icon_braced]][[/img]]bracing, this unit deals additional damage when attacking charging enemies." |
                                      attributes_4 == "Charge Reflection||When [[img:icon_braced]][[/img]]bracing, this unit deals additional damage when attacking charging enemies." |
                                      attributes_5 == "Charge Reflection||When [[img:icon_braced]][[/img]]bracing, this unit deals additional damage when attacking charging enemies." |
                                      attributes_6 == "Charge Reflection||When [[img:icon_braced]][[/img]]bracing, this unit deals additional damage when attacking charging enemies." |
                                      attributes_7 == "Charge Reflection||When [[img:icon_braced]][[/img]]bracing, this unit deals additional damage when attacking charging enemies." |
                                      attributes_8 == "Charge Reflection||When [[img:icon_braced]][[/img]]bracing, this unit deals additional damage when attacking charging enemies." ,
                                    TRUE, FALSE, missing = FALSE)) 

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Expendable_Att = if_else(attributes_1 == "Expendable||Witnessing friendly expendable units rout does not reduce other units' [[img:icon_morale]][[/img]]leadership, unless they are themselves expendable." |
                                attributes_2 == "Expendable||Witnessing friendly expendable units rout does not reduce other units' [[img:icon_morale]][[/img]]leadership, unless they are themselves expendable." |
                                attributes_3 == "Expendable||Witnessing friendly expendable units rout does not reduce other units' [[img:icon_morale]][[/img]]leadership, unless they are themselves expendable." |
                                attributes_4 == "Expendable||Witnessing friendly expendable units rout does not reduce other units' [[img:icon_morale]][[/img]]leadership, unless they are themselves expendable." |
                                attributes_5 == "Expendable||Witnessing friendly expendable units rout does not reduce other units' [[img:icon_morale]][[/img]]leadership, unless they are themselves expendable." |
                                attributes_6 == "Expendable||Witnessing friendly expendable units rout does not reduce other units' [[img:icon_morale]][[/img]]leadership, unless they are themselves expendable.." |
                                attributes_7 == "Expendable||Witnessing friendly expendable units rout does not reduce other units' [[img:icon_morale]][[/img]]leadership, unless they are themselves expendable." |
                                attributes_8 == "Expendable||Witnessing friendly expendable units rout does not reduce other units' [[img:icon_morale]][[/img]]leadership, unless they are themselves expendable." ,
                              TRUE, FALSE, missing = FALSE)) 

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Fear_Att = if_else(attributes_1 == "Causes Fear||This unit frightens all enemy units, reducing their [[img:icon_morale]][[/img]]leadership when nearby. It is also immune to fear. Fear penalties do not stack." |
                                attributes_2 == "Causes Fear||This unit frightens all enemy units, reducing their [[img:icon_morale]][[/img]]leadership when nearby. It is also immune to fear. Fear penalties do not stack." |
                                attributes_3 == "Causes Fear||This unit frightens all enemy units, reducing their [[img:icon_morale]][[/img]]leadership when nearby. It is also immune to fear. Fear penalties do not stack." |
                                attributes_4 == "Causes Fear||This unit frightens all enemy units, reducing their [[img:icon_morale]][[/img]]leadership when nearby. It is also immune to fear. Fear penalties do not stack." |
                                attributes_5 == "Causes Fear||This unit frightens all enemy units, reducing their [[img:icon_morale]][[/img]]leadership when nearby. It is also immune to fear. Fear penalties do not stack." |
                                attributes_6 == "Causes Fear||This unit frightens all enemy units, reducing their [[img:icon_morale]][[/img]]leadership when nearby. It is also immune to fear. Fear penalties do not stack." |
                                attributes_7 == "Causes Fear||This unit frightens all enemy units, reducing their [[img:icon_morale]][[/img]]leadership when nearby. It is also immune to fear. Fear penalties do not stack." |
                                attributes_8 == "Causes Fear||This unit frightens all enemy units, reducing their [[img:icon_morale]][[/img]]leadership when nearby. It is also immune to fear. Fear penalties do not stack." ,
                              TRUE, FALSE, missing = FALSE)) 

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Terror_Att = if_else(attributes_1 == "Causes Terror||This unit can cause terror, making its melee target rout for a short time. Units that cause terror are immune to terror and fear themselves." |
                                attributes_2 == "Causes Terror||This unit can cause terror, making its melee target rout for a short time. Units that cause terror are immune to terror and fear themselves." |
                                attributes_3 == "Causes Terror||This unit can cause terror, making its melee target rout for a short time. Units that cause terror are immune to terror and fear themselves." |
                                attributes_4 == "Causes Terror||This unit can cause terror, making its melee target rout for a short time. Units that cause terror are immune to terror and fear themselves." |
                                attributes_5 == "Causes Terror||This unit can cause terror, making its melee target rout for a short time. Units that cause terror are immune to terror and fear themselves." |
                                attributes_6 == "Causes Terror||This unit can cause terror, making its melee target rout for a short time. Units that cause terror are immune to terror and fear themselves." |
                                attributes_7 == "Causes Terror||This unit can cause terror, making its melee target rout for a short time. Units that cause terror are immune to terror and fear themselves." |
                                attributes_8 == "Causes Terror||This unit can cause terror, making its melee target rout for a short time. Units that cause terror are immune to terror and fear themselves." ,
                              TRUE, FALSE, missing = FALSE)) 

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Undead_Att = if_else(attributes_1 == "Undead||This unit is Undead (does not rout, immune to terror, becomes unstable when [[img:icon_morale]][[/img]]{{tr:morale}} is low)." |
                                attributes_2 == "Undead||This unit is Undead (does not rout, immune to terror, becomes unstable when [[img:icon_morale]][[/img]]{{tr:morale}} is low)." |
                                attributes_3 == "Undead||This unit is Undead (does not rout, immune to terror, becomes unstable when [[img:icon_morale]][[/img]]{{tr:morale}} is low)." |
                                attributes_4 == "Undead||This unit is Undead (does not rout, immune to terror, becomes unstable when [[img:icon_morale]][[/img]]{{tr:morale}} is low)." |
                                attributes_5 == "Undead||This unit is Undead (does not rout, immune to terror, becomes unstable when [[img:icon_morale]][[/img]]{{tr:morale}} is low)." |
                                attributes_6 == "Undead||This unit is Undead (does not rout, immune to terror, becomes unstable when [[img:icon_morale]][[/img]]{{tr:morale}} is low)." |
                                attributes_7 == "Undead||This unit is Undead (does not rout, immune to terror, becomes unstable when [[img:icon_morale]][[/img]]{{tr:morale}} is low)." |
                                attributes_8 == "Undead||This unit is Undead (does not rout, immune to terror, becomes unstable when [[img:icon_morale]][[/img]]{{tr:morale}} is low).",
                              TRUE, FALSE, missing = FALSE)) 

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Strider_Att = if_else(attributes_1 == "Strider||Speed and combat penalties caused by terrain are ignored by this unit." |
                                attributes_2 == "Strider||Speed and combat penalties caused by terrain are ignored by this unit." |
                                attributes_3 == "Strider||Speed and combat penalties caused by terrain are ignored by this unit." |
                                attributes_4 == "Strider||Speed and combat penalties caused by terrain are ignored by this unit." |
                                attributes_5 == "Strider||Speed and combat penalties caused by terrain are ignored by this unit." |
                                attributes_6 == "Strider||Speed and combat penalties caused by terrain are ignored by this unit." |
                                attributes_7 == "Strider||Speed and combat penalties caused by terrain are ignored by this unit." |
                                attributes_8 == "Strider||Speed and combat penalties caused by terrain are ignored by this unit." ,
                              TRUE, FALSE, missing = FALSE)) 

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Fire_Whilst_Moving_Att = if_else(attributes_1 == "CFire Whilst Moving||This unit can fire while on the move." |
                                attributes_2 == "Fire Whilst Moving||This unit can fire while on the move." |
                                attributes_3 == "Fire Whilst Moving||This unit can fire while on the move." |
                                attributes_4 == "Fire Whilst Moving||This unit can fire while on the move." |
                                attributes_5 == "Fire Whilst Moving||This unit can fire while on the move." |
                                attributes_6 == "Fire Whilst Moving||This unit can fire while on the move." |
                                attributes_7 == "Fire Whilst Moving||This unit can fire while on the move." |
                                attributes_8 == "Fire Whilst Moving||This unit can fire while on the move." ,
                              TRUE, FALSE, missing = FALSE)) 

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Demonic_Att = if_else(attributes_1 == "Daemonic||This unit is Daemonic (has physical resistance, does not rout, is immune to terror, takes damage when [[img:icon_morale]][[/img]]Leadership is low)" |
                                attributes_2 == "Daemonic||This unit is Daemonic (has physical resistance, does not rout, is immune to terror, takes damage when [[img:icon_morale]][[/img]]Leadership is low)" |
                                attributes_3 == "Daemonic||This unit is Daemonic (has physical resistance, does not rout, is immune to terror, takes damage when [[img:icon_morale]][[/img]]Leadership is low)" |
                                attributes_4 == "Daemonic||This unit is Daemonic (has physical resistance, does not rout, is immune to terror, takes damage when [[img:icon_morale]][[/img]]Leadership is low)" |
                                attributes_5 == "Daemonic||This unit is Daemonic (has physical resistance, does not rout, is immune to terror, takes damage when [[img:icon_morale]][[/img]]Leadership is low)" |
                                attributes_6 == "Daemonic||This unit is Daemonic (has physical resistance, does not rout, is immune to terror, takes damage when [[img:icon_morale]][[/img]]Leadership is low)" |
                                attributes_7 == "Daemonic||This unit is Daemonic (has physical resistance, does not rout, is immune to terror, takes damage when [[img:icon_morale]][[/img]]Leadership is low)" |
                                attributes_8 == "Daemonic||This unit is Daemonic (has physical resistance, does not rout, is immune to terror, takes damage when [[img:icon_morale]][[/img]]Leadership is low)" ,
                              TRUE, FALSE, missing = FALSE)) 

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Construct_Att = if_else(attributes_1 == "Construct||This unit is an animated construct (does not rout, is immune to terror, becomes unstable when [[img:icon_morale]][[/img]]Leadership is low). Necrotects can push it to its full combat potential and restore it in battle." |
                                attributes_2 == "Construct||This unit is an animated construct (does not rout, is immune to terror, becomes unstable when [[img:icon_morale]][[/img]]Leadership is low). Necrotects can push it to its full combat potential and restore it in battle." |
                                attributes_3 == "Construct||This unit is an animated construct (does not rout, is immune to terror, becomes unstable when [[img:icon_morale]][[/img]]Leadership is low). Necrotects can push it to its full combat potential and restore it in battle." |
                                attributes_4 == "Construct||This unit is an animated construct (does not rout, is immune to terror, becomes unstable when [[img:icon_morale]][[/img]]Leadership is low). Necrotects can push it to its full combat potential and restore it in battle." |
                                attributes_5 == "Construct||This unit is an animated construct (does not rout, is immune to terror, becomes unstable when [[img:icon_morale]][[/img]]Leadership is low). Necrotects can push it to its full combat potential and restore it in battle." |
                                attributes_6 == "Construct||This unit is an animated construct (does not rout, is immune to terror, becomes unstable when [[img:icon_morale]][[/img]]Leadership is low). Necrotects can push it to its full combat potential and restore it in battle." |
                                attributes_7 == "Construct||This unit is an animated construct (does not rout, is immune to terror, becomes unstable when [[img:icon_morale]][[/img]]Leadership is low). Necrotects can push it to its full combat potential and restore it in battle." |
                                attributes_8 == "Construct||This unit is an animated construct (does not rout, is immune to terror, becomes unstable when [[img:icon_morale]][[/img]]Leadership is low). Necrotects can push it to its full combat potential and restore it in battle." ,
                              TRUE, FALSE, missing = FALSE)) 

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Perfect_Vigor_Att = if_else(attributes_1 == "Perfect Vigour||Even when performing the most fatiguing actions, this unit never loses vigour." |
                                attributes_2 == "Perfect Vigour||Even when performing the most fatiguing actions, this unit never loses vigour." |
                                attributes_3 == "Perfect Vigour||Even when performing the most fatiguing actions, this unit never loses vigour.." |
                                attributes_4 == "Perfect Vigour||Even when performing the most fatiguing actions, this unit never loses vigour." |
                                attributes_5 == "Perfect Vigour||Even when performing the most fatiguing actions, this unit never loses vigour." |
                                attributes_6 == "Perfect Vigour||Even when performing the most fatiguing actions, this unit never loses vigour." |
                                attributes_7 == "Perfect Vigour||Even when performing the most fatiguing actions, this unit never loses vigour." |
                                attributes_8 == "Perfect Vigour||Even when performing the most fatiguing actions, this unit never loses vigour." ,
                              TRUE, FALSE, missing = FALSE)) 

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Devastating_Flanker_Att = if_else(attributes_1 == "Devastating Flanker||Entities with this attribute double their charge bonus when attacking the rear or flank of an entity." |
                                attributes_2 == "Devastating Flanker||Entities with this attribute double their charge bonus when attacking the rear or flank of an entity." |
                                attributes_3 == "Devastating Flanker||Entities with this attribute double their charge bonus when attacking the rear or flank of an entity." |
                                attributes_4 == "Devastating Flanker||Entities with this attribute double their charge bonus when attacking the rear or flank of an entity." |
                                attributes_5 == "Devastating Flanker||Entities with this attribute double their charge bonus when attacking the rear or flank of an entity." |
                                attributes_6 == "Devastating Flanker||Entities with this attribute double their charge bonus when attacking the rear or flank of an entity." |
                                attributes_7 == "Devastating Flanker||Entities with this attribute double their charge bonus when attacking the rear or flank of an entity." |
                                attributes_8 == "Devastating Flanker||Entities with this attribute double their charge bonus when attacking the rear or flank of an entity." ,
                              TRUE, FALSE, missing = FALSE)) 

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Unbreakable_Att = if_else(attributes_1 == "Unbreakable||This unit does not suffer any form of [[img:icon_morale]][[/img]]leadership loss and will never rout." |
                                attributes_2 == "Unbreakable||This unit does not suffer any form of [[img:icon_morale]][[/img]]leadership loss and will never rout." |
                                attributes_3 == "Unbreakable||This unit does not suffer any form of [[img:icon_morale]][[/img]]leadership loss and will never rout." |
                                attributes_4 == "Unbreakable||This unit does not suffer any form of [[img:icon_morale]][[/img]]leadership loss and will never rout." |
                                attributes_5 == "Unbreakable||This unit does not suffer any form of [[img:icon_morale]][[/img]]leadership loss and will never rout." |
                                attributes_6 == "Unbreakable||This unit does not suffer any form of [[img:icon_morale]][[/img]]leadership loss and will never rout." |
                                attributes_7 == "Unbreakable||This unit does not suffer any form of [[img:icon_morale]][[/img]]leadership loss and will never rout." |
                                attributes_8 == "Unbreakable||This unit does not suffer any form of [[img:icon_morale]][[/img]]leadership loss and will never rout." ,
                              TRUE, FALSE, missing = FALSE)) 

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Snipe_Att = if_else(attributes_1 == "Snipe||This unit remains hidden while firing." |
                                attributes_2 == "Snipe||This unit remains hidden while firing." |
                                attributes_3 == "Snipe||This unit remains hidden while firing." |
                                attributes_4 == "Snipe||This unit remains hidden while firing." |
                                attributes_5 == "Snipe||This unit remains hidden while firing." |
                                attributes_6 == "Snipe||This unit remains hidden while firing." |
                                attributes_7 == "Snipe||This unit remains hidden while firing." |
                                attributes_8 == "Snipe||This unit remains hidden while firing.",
                              TRUE, FALSE, missing = FALSE)) 

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Rampage_Att = if_else(attributes_1 == "Rampage||When this unit gets hurt it may go on a rampage against nearby enemy units, attacking the closest one and ignoring any orders given." |
                                attributes_2 == "Rampage||When this unit gets hurt it may go on a rampage against nearby enemy units, attacking the closest one and ignoring any orders given." |
                                attributes_3 == "Rampage||When this unit gets hurt it may go on a rampage against nearby enemy units, attacking the closest one and ignoring any orders given." |
                                attributes_4 == "Rampage||When this unit gets hurt it may go on a rampage against nearby enemy units, attacking the closest one and ignoring any orders given." |
                                attributes_5 == "Rampage||When this unit gets hurt it may go on a rampage against nearby enemy units, attacking the closest one and ignoring any orders given." |
                                attributes_6 == "Rampage||When this unit gets hurt it may go on a rampage against nearby enemy units, attacking the closest one and ignoring any orders given." |
                                attributes_7 == "Rampage||When this unit gets hurt it may go on a rampage against nearby enemy units, attacking the closest one and ignoring any orders given." |
                                attributes_8 == "Rampage||When this unit gets hurt it may go on a rampage against nearby enemy units, attacking the closest one and ignoring any orders given.",
                              TRUE, FALSE, missing = FALSE)) 

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Ogre_Charge_Att = if_else(attributes_1 == "Ogre Charge||When attacking [[img:icon_braced]][[/img]]braced charge defenders, this unit only loses half of its [[img:icon_charge]][[/img]]charge bonus." |
                                attributes_2 == "Ogre Charge||When attacking [[img:icon_braced]][[/img]]braced charge defenders, this unit only loses half of its [[img:icon_charge]][[/img]]charge bonus." |
                                attributes_3 == "Ogre Charge||When attacking [[img:icon_braced]][[/img]]braced charge defenders, this unit only loses half of its [[img:icon_charge]][[/img]]charge bonus." |
                                attributes_4 == "Ogre Charge||When attacking [[img:icon_braced]][[/img]]braced charge defenders, this unit only loses half of its [[img:icon_charge]][[/img]]charge bonus." |
                                attributes_5 == "Ogre Charge||When attacking [[img:icon_braced]][[/img]]braced charge defenders, this unit only loses half of its [[img:icon_charge]][[/img]]charge bonus." |
                                attributes_6 == "Ogre Charge||When attacking [[img:icon_braced]][[/img]]braced charge defenders, this unit only loses half of its [[img:icon_charge]][[/img]]charge bonus." |
                                attributes_7 = "Ogre Charge||When attacking [[img:icon_braced]][[/img]]braced charge defenders, this unit only loses half of its [[img:icon_charge]][[/img]]charge bonus." |
                                attributes_8 == "Ogre Charge||When attacking [[img:icon_braced]][[/img]]braced charge defenders, this unit only loses half of its [[img:icon_charge]][[/img]]charge bonus.",
                              TRUE, FALSE, missing = FALSE)) 

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Immune_to_Contact_Effects_Att = if_else(attributes_1 == "Immune to Contact Effects||Entities with this attribute ignore the effects of enemy contact effects such as [[img:icon_poison]][[/img]] Poison" |
                                attributes_2 == "Immune to Contact Effects||Entities with this attribute ignore the effects of enemy contact effects such as [[img:icon_poison]][[/img]] Poison" |
                                attributes_3 == "Immune to Contact Effects||Entities with this attribute ignore the effects of enemy contact effects such as [[img:icon_poison]][[/img]] Poison" |
                                attributes_4 == "Immune to Contact Effects||Entities with this attribute ignore the effects of enemy contact effects such as [[img:icon_poison]][[/img]] Poison" |
                                attributes_5 == "Immune to Contact Effects||Entities with this attribute ignore the effects of enemy contact effects such as [[img:icon_poison]][[/img]] Poison" |
                                attributes_6 == "Immune to Contact Effects||Entities with this attribute ignore the effects of enemy contact effects such as [[img:icon_poison]][[/img]] Poison" |
                                attributes_7 == "Immune to Contact Effects||Entities with this attribute ignore the effects of enemy contact effects such as [[img:icon_poison]][[/img]] Poison" |
                                attributes_8 == "Immune to Contact Effects||Entities with this attribute ignore the effects of enemy contact effects such as [[img:icon_poison]][[/img]] Poison",
                              TRUE, FALSE, missing = FALSE)) 

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Charge_Defense_vs_Large_Att = if_else(attributes_1 == "Charge Defence vs. Large||When bracing[[img:icon_braced]][[/img]], this unit negates the [[img:icon_charge]][[/img]]charge bonus of any large attacker." |
                                attributes_2 == "Charge Defence vs. Large||When bracing[[img:icon_braced]][[/img]], this unit negates the [[img:icon_charge]][[/img]]charge bonus of any large attacker." |
                                attributes_3 == "Charge Defence vs. Large||When bracing[[img:icon_braced]][[/img]], this unit negates the [[img:icon_charge]][[/img]]charge bonus of any large attacker." |
                                attributes_4 == "Charge Defence vs. Large||When bracing[[img:icon_braced]][[/img]], this unit negates the [[img:icon_charge]][[/img]]charge bonus of any large attacker." |
                                attributes_5 == "Charge Defence vs. Large||When bracing[[img:icon_braced]][[/img]], this unit negates the [[img:icon_charge]][[/img]]charge bonus of any large attacker." |
                                attributes_6 == "Charge Defence vs. Large||When bracing[[img:icon_braced]][[/img]], this unit negates the [[img:icon_charge]][[/img]]charge bonus of any large attacker." |
                                attributes_7 == "Charge Defence vs. Large||When bracing[[img:icon_braced]][[/img]], this unit negates the [[img:icon_charge]][[/img]]charge bonus of any large attacker." |
                                attributes_8 == "Charge Defence vs. Large||When bracing[[img:icon_braced]][[/img]], this unit negates the [[img:icon_charge]][[/img]]charge bonus of any large attacker.",
                              TRUE, FALSE, missing = FALSE)) 

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Mastery_of_Elemental_Winds_Att = if_else(attributes_1 == "Mastery of Elemental Winds||When two or more units in the same army share this attribute, [[img:icon_spell_mastery]][[/img]] intensity increases the power of spells cast." |
                                attributes_2 == "Mastery of Elemental Winds||When two or more units in the same army share this attribute, [[img:icon_spell_mastery]][[/img]] intensity increases the power of spells cast." |
                                attributes_3 == "Mastery of Elemental Winds||When two or more units in the same army share this attribute, [[img:icon_spell_mastery]][[/img]] intensity increases the power of spells cast." |
                                attributes_4 == "Mastery of Elemental Winds||When two or more units in the same army share this attribute, [[img:icon_spell_mastery]][[/img]] intensity increases the power of spells cast." |
                                attributes_5 == "Mastery of Elemental Winds||When two or more units in the same army share this attribute, [[img:icon_spell_mastery]][[/img]] intensity increases the power of spells cast." |
                                attributes_6 == "Mastery of Elemental Winds||When two or more units in the same army share this attribute, [[img:icon_spell_mastery]][[/img]] intensity increases the power of spells cast." |
                                attributes_7 == "Mastery of Elemental Winds||When two or more units in the same army share this attribute, [[img:icon_spell_mastery]][[/img]] intensity increases the power of spells cast." |
                                attributes_8 == "Mastery of Elemental Winds||When two or more units in the same army share this attribute, [[img:icon_spell_mastery]][[/img]] intensity increases the power of spells cast.",
                              TRUE, FALSE, missing = FALSE)) 

All_Unit_Stats <- All_Unit_Stats %>%
  mutate(Stalk_Att = if_else(attributes_1 == "Stalk||This unit can move hidden in any terrain." |
                                attributes_2 == "Stalk||This unit can move hidden in any terrain." |
                                attributes_3 == "Stalk||This unit can move hidden in any terrain." |
                                attributes_4 == "Stalk||This unit can move hidden in any terrain." |
                                attributes_5 == "Stalk||This unit can move hidden in any terrain." |
                                attributes_6 == "Stalk||This unit can move hidden in any terrain." |
                                attributes_7 == "Stalk||This unit can move hidden in any terrain." |
                                attributes_8 == "Stalk||This unit can move hidden in any terrain.",
                              TRUE, FALSE, missing = FALSE)) 

# save(All_Unit_Stats, file= "Cleaned TW Unit Stats (attributes complete).rdata", compress = F)





