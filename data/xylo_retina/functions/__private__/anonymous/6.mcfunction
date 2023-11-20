execute if score $output_vec3.Y retina.__variable__ matches 0 run return 0
scoreboard players operation $distance retina.__variable__ = $Y0 retina.__variable__
scoreboard players operation $distance retina.__variable__ /= $output_vec3.Y retina.__variable__
execute if score $debug_messages retina.__variable__ matches 1.. run tellraw @a ["",{"text":"Distance: ","italic":true},{"color":"light_purple","score":{"name":"$distance","objective":"retina.__variable__"}}]
execute unless score $distance retina.__variable__ < $min_distance_to_surface retina.__variable__ run return 0
scoreboard players operation $X_intersection retina.__variable__ = $Y0 retina.__variable__
scoreboard players operation $X_intersection retina.__variable__ *= $output_vec3.X retina.__variable__
scoreboard players operation $X_intersection retina.__variable__ /= $output_vec3.Y retina.__variable__
scoreboard players operation $Y_intersection retina.__variable__ = $Y0 retina.__variable__
scoreboard players operation $Z_intersection retina.__variable__ = $Y0 retina.__variable__
scoreboard players operation $Z_intersection retina.__variable__ *= $output_vec3.Z retina.__variable__
scoreboard players operation $Z_intersection retina.__variable__ /= $output_vec3.Y retina.__variable__
execute if score $debug_messages retina.__variable__ matches 1.. run tellraw @a ["",{"text":"[TOP] ","italic":true,"bold":true},{"text":"X-Int: ","bold":false},{"italic":false,"color":"light_purple","score":{"name":"$X_intersection","objective":"retina.__variable__"}},{"text":", ","italic":false,"color":"light_purple"},{"text":"X0: ","italic":true,"color":"white"},{"italic":false,"color":"light_purple","score":{"name":"$X0","objective":"retina.__variable__"}},{"text":", ","italic":false,"color":"light_purple"},{"text":"X1: ","italic":true,"color":"white"},{"italic":false,"color":"light_purple","score":{"name":"$X1","objective":"retina.__variable__"}}]
execute if score $debug_messages retina.__variable__ matches 1.. run tellraw @a ["",{"text":"[TOP] ","italic":true,"bold":true},{"text":"Z-Int: ","bold":false},{"italic":false,"color":"light_purple","score":{"name":"$Z_intersection","objective":"retina.__variable__"}},{"text":", ","italic":false,"color":"light_purple"},{"text":"Z0: ","italic":true,"color":"white"},{"italic":false,"color":"light_purple","score":{"name":"$Z0","objective":"retina.__variable__"}},{"text":", ","italic":false,"color":"light_purple"},{"text":"Z1: ","italic":true,"color":"white"},{"italic":false,"color":"light_purple","score":{"name":"$Z1","objective":"retina.__variable__"}}]
execute if score $X_intersection retina.__variable__ >= $X0 retina.__variable__ if score $X_intersection retina.__variable__ <= $X1 retina.__variable__ if score $Z_intersection retina.__variable__ >= $Z0 retina.__variable__ if score $Z_intersection retina.__variable__ <= $Z1 retina.__variable__ run function xylo_retina:__private__/if_else/6