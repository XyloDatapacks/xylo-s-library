execute store result score $horizontal_count xylo_retina.__variable__ run data get storage xylo_retina:input HorizontalCount 10
execute store result score $vertical_count xylo_retina.__variable__ run data get storage xylo_retina:input VerticalCount 10
execute store result score $centered_count xylo_retina.__variable__ run data get storage xylo_retina:input CenteredCount 1
execute if score $horizontal_count xylo_retina.__variable__ matches ..0 run tellraw @a ["",{"text":"[Error] ","color":"dark_red"},{"text":"HorizontalCount storage has invalid value of ","color":"red"},{"score":{"name":"$horizontal_count","objective":"xylo_retina.__variable__"},"color":"red"}]
execute if score $horizontal_count xylo_retina.__variable__ matches ..0 run return 0
execute if score $vertical_count xylo_retina.__variable__ matches ..0 run tellraw @a ["",{"text":"[Error] ","color":"dark_red"},{"text":"VerticalCount storage has invalid value of ","color":"red"},{"score":{"name":"$vertical_count","objective":"xylo_retina.__variable__"},"color":"red"}]
execute if score $vertical_count xylo_retina.__variable__ matches ..0 run return 0
execute if score $centered_count xylo_retina.__variable__ matches ..-1 run tellraw @a ["",{"text":"[Error] ","color":"dark_red"},{"text":"CenteredCount storage has invalid value of ","color":"red"},{"score":{"name":"$centered_count","objective":"xylo_retina.__variable__"},"color":"red"}]
execute if score $centered_count xylo_retina.__variable__ matches ..-1 run return 0
execute store result score $spread_least xylo_retina.__variable__ run data get storage xylo_retina:input SpreadFactor[0]
execute store result score $spread_range xylo_retina.__variable__ run data get storage xylo_retina:input SpreadFactor[1]
scoreboard players operation $spread_range xylo_retina.__variable__ -= $spread_least xylo_retina.__variable__
scoreboard players set $single_call xylo_retina.__variable__ 0
tag @e remove xylo_retina.target
scoreboard players reset * xylo_retina.hit
kill @e[type=marker,tag=xylo_retina.endpoint]
execute store result score $input_pitch xylo_retina.__variable__ run data get entity @s Rotation[1] 10
execute store result score $input_yaw xylo_retina.__variable__ run data get entity @s Rotation[0] 10
scoreboard players set $i xylo_retina.__variable__ 0
execute if score $i xylo_retina.__variable__ < $horizontal_count xylo_retina.__variable__ run function xylo_retina:__private__/for_loop/0
scoreboard players set $k xylo_retina.__variable__ 0
execute if score $k xylo_retina.__variable__ < $centered_count xylo_retina.__variable__ run function xylo_retina:__private__/for_loop/2
scoreboard players set $single_call xylo_retina.__variable__ 1