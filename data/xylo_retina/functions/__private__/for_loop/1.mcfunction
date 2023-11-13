scoreboard players operation $input_vec3.X xylo_retina.__variable__ = $i xylo_retina.__variable__
scoreboard players operation $input_vec3.X xylo_retina.__variable__ *= 2 xylo_retina.__int__
scoreboard players add $input_vec3.X xylo_retina.__variable__ 10
scoreboard players operation $input_vec3.X xylo_retina.__variable__ -= $horizontal_count xylo_retina.__variable__
execute if score $horizontal_count xylo_retina.__variable__ matches 10 run function xylo_retina:__private__/if_else/1
scoreboard players set __math__.rng.bound xylo_retina.__variable__ 2147483647
function xylo_retina:__private__/math_random/main
scoreboard players operation $spread xylo_retina.__variable__ = __math__.rng.result xylo_retina.__variable__
scoreboard players add $spread xylo_retina.__variable__ 1
scoreboard players operation $spread xylo_retina.__variable__ %= $spread_range xylo_retina.__variable__
scoreboard players operation $spread xylo_retina.__variable__ += $spread_least xylo_retina.__variable__
execute if score $spread_range xylo_retina.__variable__ matches 0 run scoreboard players operation $spread xylo_retina.__variable__ = $spread_least xylo_retina.__variable__
scoreboard players operation $input_vec3.X xylo_retina.__variable__ *= $spread xylo_retina.__variable__
scoreboard players operation $input_vec3.X xylo_retina.__variable__ /= 100 xylo_retina.__int__
scoreboard players operation $input_vec3.Y xylo_retina.__variable__ = $j xylo_retina.__variable__
scoreboard players operation $input_vec3.Y xylo_retina.__variable__ *= 2 xylo_retina.__int__
scoreboard players add $input_vec3.Y xylo_retina.__variable__ 10
scoreboard players operation $input_vec3.Y xylo_retina.__variable__ -= $vertical_count xylo_retina.__variable__
execute if score $vertical_count xylo_retina.__variable__ matches 10 run function xylo_retina:__private__/if_else/2
scoreboard players set __math__.rng.bound xylo_retina.__variable__ 2147483647
function xylo_retina:__private__/math_random/main
scoreboard players operation $spread xylo_retina.__variable__ = __math__.rng.result xylo_retina.__variable__
scoreboard players add $spread xylo_retina.__variable__ 1
scoreboard players operation $spread xylo_retina.__variable__ %= $spread_range xylo_retina.__variable__
scoreboard players operation $spread xylo_retina.__variable__ += $spread_least xylo_retina.__variable__
execute if score $spread_range xylo_retina.__variable__ matches 0 run scoreboard players operation $spread xylo_retina.__variable__ = $spread_least xylo_retina.__variable__
scoreboard players operation $input_vec3.Y xylo_retina.__variable__ *= $spread xylo_retina.__variable__
scoreboard players operation $input_vec3.Y xylo_retina.__variable__ /= 100 xylo_retina.__int__
scoreboard players set $input_vec3.Z xylo_retina.__variable__ 500
execute if score $debug_messages xylo_retina.__variable__ matches 1.. run tellraw @a ["",{"text":"Input Vector: "},{"text":"[","color":"red","italic":true},{"score":{"name":"$input_vec3.X","objective":"xylo_retina.__variable__"},"italic":true,"color":"red"},{"text":", ","italic":true,"color":"red"},{"score":{"name":"$input_vec3.Y","objective":"xylo_retina.__variable__"},"italic":true,"color":"red"},{"text":", ","italic":true,"color":"red"},{"score":{"name":"$input_vec3.Z","objective":"xylo_retina.__variable__"},"italic":true,"color":"red"},{"text":"]","italic":true,"color":"red"}]
scoreboard players set $length xylo_retina.__variable__ 0
scoreboard players operation $temp xylo_retina.__variable__ = $input_vec3.X xylo_retina.__variable__
scoreboard players operation $temp xylo_retina.__variable__ *= $input_vec3.X xylo_retina.__variable__
scoreboard players operation $length xylo_retina.__variable__ += $temp xylo_retina.__variable__
scoreboard players operation $temp xylo_retina.__variable__ = $input_vec3.Y xylo_retina.__variable__
scoreboard players operation $temp xylo_retina.__variable__ *= $input_vec3.Y xylo_retina.__variable__
scoreboard players operation $length xylo_retina.__variable__ += $temp xylo_retina.__variable__
scoreboard players operation $temp xylo_retina.__variable__ = $input_vec3.Z xylo_retina.__variable__
scoreboard players operation $temp xylo_retina.__variable__ *= $input_vec3.Z xylo_retina.__variable__
scoreboard players operation $length xylo_retina.__variable__ += $temp xylo_retina.__variable__
scoreboard players operation __math__.N xylo_retina.__variable__ = $length xylo_retina.__variable__
function xylo_retina:__private__/math_sqrt/main
scoreboard players operation $length xylo_retina.__variable__ = __math__.x_n xylo_retina.__variable__
function xylo_retina:math/gimbal_to_matrix
scoreboard players operation $input_mat3.XX xylo_retina.__variable__ = $output_mat3.XX xylo_retina.__variable__
scoreboard players operation $input_mat3.XY xylo_retina.__variable__ = $output_mat3.XY xylo_retina.__variable__
scoreboard players operation $input_mat3.XZ xylo_retina.__variable__ = $output_mat3.XZ xylo_retina.__variable__
scoreboard players operation $input_mat3.YX xylo_retina.__variable__ = $output_mat3.YX xylo_retina.__variable__
scoreboard players operation $input_mat3.YY xylo_retina.__variable__ = $output_mat3.YY xylo_retina.__variable__
scoreboard players operation $input_mat3.YZ xylo_retina.__variable__ = $output_mat3.YZ xylo_retina.__variable__
scoreboard players operation $input_mat3.ZX xylo_retina.__variable__ = $output_mat3.ZX xylo_retina.__variable__
scoreboard players operation $input_mat3.ZY xylo_retina.__variable__ = $output_mat3.ZY xylo_retina.__variable__
scoreboard players operation $input_mat3.ZZ xylo_retina.__variable__ = $output_mat3.ZZ xylo_retina.__variable__
function xylo_retina:math/matrix_transform
scoreboard players operation $output_vec3.X xylo_retina.__variable__ *= 480 xylo_retina.__int__
scoreboard players operation $output_vec3.X xylo_retina.__variable__ /= $length xylo_retina.__variable__
scoreboard players operation $output_vec3.Y xylo_retina.__variable__ *= 480 xylo_retina.__int__
scoreboard players operation $output_vec3.Y xylo_retina.__variable__ /= $length xylo_retina.__variable__
scoreboard players operation $output_vec3.Z xylo_retina.__variable__ *= 480 xylo_retina.__int__
scoreboard players operation $output_vec3.Z xylo_retina.__variable__ /= $length xylo_retina.__variable__
execute if score $debug_messages xylo_retina.__variable__ matches 1.. run tellraw @a ["",{"text":"Angled Vector: "},{"text":"[","color":"gold","italic":true},{"score":{"name":"$output_vec3.X","objective":"xylo_retina.__variable__"},"italic":true,"color":"gold"},{"text":", ","italic":true,"color":"gold"},{"score":{"name":"$output_vec3.Y","objective":"xylo_retina.__variable__"},"italic":true,"color":"gold"},{"text":", ","italic":true,"color":"gold"},{"score":{"name":"$output_vec3.Z","objective":"xylo_retina.__variable__"},"italic":true,"color":"gold"},{"text":"]","italic":true,"color":"gold"}]
function xylo_retina:traverse/setup
scoreboard players add $j xylo_retina.__variable__ 10
execute if score $j xylo_retina.__variable__ < $vertical_count xylo_retina.__variable__ run function xylo_retina:__private__/for_loop/1