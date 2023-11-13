tag @e remove xylo_retina.target
scoreboard players reset * xylo_retina.hit
kill @e[type=marker,tag=xylo_retina.endpoint]
execute store result score $input_pitch xylo_retina.__variable__ run data get entity @s Rotation[1] 10
execute store result score $input_yaw xylo_retina.__variable__ run data get entity @s Rotation[0] 10
execute if score $debug_messages xylo_retina.__variable__ matches 1.. run tellraw @a ["",{"text":"Pitch: ","bold":false,"color":"white"},{"score":{"name":"$input_pitch","objective":"xylo_retina.__variable__"},"color":"red"},{"text":", ","color":"red"},{"text":"Yaw: ","bold":false,"color":"white"},{"score":{"name":"$input_yaw","objective":"xylo_retina.__variable__"},"color":"red"}]
function xylo_retina:math/gimbal_to_vec
execute if score $debug_messages xylo_retina.__variable__ matches 1.. run tellraw @a ["",{"text":"Facing Vector: "},{"text":"[","color":"gold"},{"score":{"name":"$output_vec3.X","objective":"xylo_retina.__variable__"},"color":"gold"},{"text":", ","color":"gold"},{"score":{"name":"$output_vec3.Y","objective":"xylo_retina.__variable__"},"color":"gold"},{"text":", ","color":"gold"},{"score":{"name":"$output_vec3.Z","objective":"xylo_retina.__variable__"},"color":"gold"},{"text":"]","color":"gold"}]