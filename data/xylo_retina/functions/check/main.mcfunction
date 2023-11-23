scoreboard players add $step retina.__variable__ 1
scoreboard players set $check_for_head retina.__variable__ 0
execute unless score $ignore_blocks retina.__variable__ matches 1 run function xylo_retina:check/block/main
execute if data storage xylo_retina:input {TargetEntities: true} run function xylo_retina:check/entity/main


scoreboard players operation $traveled_distance_square_1 retina.__variable__ = $traveled_distance_X retina.__variable__
scoreboard players operation $traveled_distance_square_1 retina.__variable__ *= $traveled_distance_X retina.__variable__
scoreboard players operation $traveled_distance_square_2 retina.__variable__ = $traveled_distance_Y retina.__variable__
scoreboard players operation $traveled_distance_square_2 retina.__variable__ *= $traveled_distance_Y retina.__variable__
scoreboard players operation $traveled_distance_square_3 retina.__variable__ = $traveled_distance_Z retina.__variable__
scoreboard players operation $traveled_distance_square_3 retina.__variable__ *= $traveled_distance_Z retina.__variable__
scoreboard players operation $traveled_distance_square retina.__variable__ = $traveled_distance_square_1 retina.__variable__
scoreboard players operation $traveled_distance_square retina.__variable__ += $traveled_distance_square_2 retina.__variable__
scoreboard players operation $traveled_distance_square retina.__variable__ += $traveled_distance_square_3 retina.__variable__

#modified
execute if score $traveled_distance_square retina.__variable__ >= $max_traveled_distance_square retina.__variable__ if score $debug_messages retina.__variable__ matches 1.. run tellraw @a ["",{"text":"Failed to find anything within ","italic":true,"color":"light_purple"},{"score":{"name":"$step","objective":"retina.__variable__"},"color":"light_purple"},{"text":" blocks. End coordinates: ","color":"light_purple"},{"text":"[","bold":true,"color":"light_purple"},{"score":{"name":"$int_X","objective":"retina.__variable__"},"color":"light_purple"},{"text":", ","color":"light_purple"},{"score":{"name":"$int_Y","objective":"retina.__variable__"},"color":"light_purple"},{"text":", ","color":"light_purple"},{"score":{"name":"$int_Z","objective":"retina.__variable__"},"color":"light_purple"},{"text":"]","color":"light_purple"}]
execute if score $step retina.__variable__ >= $max_depth retina.__variable__ if score $debug_messages retina.__variable__ matches 1.. run tellraw @a ["",{"text":"Failed to find anything within ","italic":true,"color":"light_purple"},{"score":{"name":"$step","objective":"retina.__variable__"},"color":"light_purple"},{"text":" blocks. End coordinates: ","color":"light_purple"},{"text":"[","bold":true,"color":"light_purple"},{"score":{"name":"$int_X","objective":"retina.__variable__"},"color":"light_purple"},{"text":", ","color":"light_purple"},{"score":{"name":"$int_Y","objective":"retina.__variable__"},"color":"light_purple"},{"text":", ","color":"light_purple"},{"score":{"name":"$int_Z","objective":"retina.__variable__"},"color":"light_purple"},{"text":"]","color":"light_purple"}]
execute if score $traveled_distance_square retina.__variable__ < $max_traveled_distance_square retina.__variable__ if score $step retina.__variable__ < $max_depth retina.__variable__ if score $hit_block retina.__variable__ matches 0 if score $hit_entity retina.__variable__ matches 0 run function xylo_retina:traverse/loop
#old
#execute if score $step retina.__variable__ >= $max_depth retina.__variable__ if score $debug_messages retina.__variable__ matches 1.. run tellraw @a ["",{"text":"Failed to find anything within ","italic":true,"color":"light_purple"},{"score":{"name":"$step","objective":"retina.__variable__"},"color":"light_purple"},{"text":" blocks. End coordinates: ","color":"light_purple"},{"text":"[","bold":true,"color":"light_purple"},{"score":{"name":"$int_X","objective":"retina.__variable__"},"color":"light_purple"},{"text":", ","color":"light_purple"},{"score":{"name":"$int_Y","objective":"retina.__variable__"},"color":"light_purple"},{"text":", ","color":"light_purple"},{"score":{"name":"$int_Z","objective":"retina.__variable__"},"color":"light_purple"},{"text":"]","color":"light_purple"}]
#execute if score $step retina.__variable__ < $max_depth retina.__variable__ if score $hit_block retina.__variable__ matches 0 if score $hit_entity retina.__variable__ matches 0 run function xylo_retina:traverse/loop

