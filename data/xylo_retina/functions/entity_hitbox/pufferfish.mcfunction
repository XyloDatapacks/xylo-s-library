execute store result score $pufferfish_puffstate xylo_retina.__variable__ run data get entity @s PuffState
execute if score $pufferfish_puffstate xylo_retina.__variable__ matches 0 run scoreboard players set $entity_half_width xylo_retina.__variable__ 84
execute if score $pufferfish_puffstate xylo_retina.__variable__ matches 0 run scoreboard players set $entity_height xylo_retina.__variable__ 168
execute if score $pufferfish_puffstate xylo_retina.__variable__ matches 1 run scoreboard players set $entity_half_width xylo_retina.__variable__ 120
execute if score $pufferfish_puffstate xylo_retina.__variable__ matches 1 run scoreboard players set $entity_height xylo_retina.__variable__ 240
execute if score $pufferfish_puffstate xylo_retina.__variable__ matches 2 run scoreboard players set $entity_half_width xylo_retina.__variable__ 168
execute if score $pufferfish_puffstate xylo_retina.__variable__ matches 2 run scoreboard players set $entity_height xylo_retina.__variable__ 336