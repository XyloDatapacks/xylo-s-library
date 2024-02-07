scoreboard players set $entity_half_width xylo_iris 450000
scoreboard players set $entity_height xylo_iris 500000

execute store result score $phantom_size xylo_iris run data get entity @s Size
execute if score $phantom_size xylo_iris matches 0 run return 0
scoreboard players set $phantom_extra_width xylo_iris 67500
scoreboard players operation $phantom_extra_width xylo_iris *= $phantom_size xylo_iris
scoreboard players operation $entity_half_width xylo_iris += $phantom_extra_width xylo_iris
scoreboard players set $phantom_extra_height xylo_iris 75000
scoreboard players operation $phantom_extra_height xylo_iris *= $phantom_size xylo_iris
scoreboard players operation $entity_height xylo_iris += $phantom_extra_height xylo_iris
