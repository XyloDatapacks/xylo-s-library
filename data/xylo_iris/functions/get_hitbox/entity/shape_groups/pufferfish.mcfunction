execute store result score $pufferfish_puffstate xylo_iris run data get entity @s PuffState
execute if score $pufferfish_puffstate xylo_iris matches 0 run scoreboard players set $entity_half_width xylo_iris 175000
execute if score $pufferfish_puffstate xylo_iris matches 0 run scoreboard players set $entity_height xylo_iris 350000
execute if score $pufferfish_puffstate xylo_iris matches 1 run scoreboard players set $entity_half_width xylo_iris 250000
execute if score $pufferfish_puffstate xylo_iris matches 1 run scoreboard players set $entity_height xylo_iris 500000
execute if score $pufferfish_puffstate xylo_iris matches 2 run scoreboard players set $entity_half_width xylo_iris 350000
execute if score $pufferfish_puffstate xylo_iris matches 2 run scoreboard players set $entity_height xylo_iris 700000
