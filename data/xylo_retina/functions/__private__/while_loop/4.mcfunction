function xylo_retina:find_closest_surface/store_coords
execute if score $debug_messages xylo_retina.__variable__ matches 1.. run tellraw @a ["",{"text":"[NORTH] ","italic":true,"bold":true},{"text":"Z0: ","color":"white"},{"color":"light_purple","score":{"name":"$Z0","objective":"xylo_retina.__variable__"}}]
function xylo_retina:__private__/anonymous/7
data remove storage xylo_retina:data List[-1]
scoreboard players remove $surfaces xylo_retina.__variable__ 1
scoreboard players remove $cuboid_id xylo_retina.__variable__ 1
execute if score $surfaces xylo_retina.__variable__ matches 1.. run function xylo_retina:__private__/while_loop/4