data remove storage xylo_retina:data Surfaces
data modify storage xylo_retina:data Surfaces set value {Top:[],Bottom:[],West:[],East:[],North:[],South:[]}
scoreboard players set $max xylo_retina.id 0
scoreboard players set $check_for_head xylo_retina.__variable__ 0
tag @e[type=!#xylo_retina:intangible] remove xylo_retina.possible_target
execute align xyz as @e[type=!#xylo_retina:intangible,tag=!xylo_retina.executing,dx=0,dy=0,dz=0] at @s run function xylo_retina:check/entity/get_hitbox
scoreboard players set $contact xylo_retina.__variable__ 0
execute if data storage xylo_retina:data Surfaces run function xylo_retina:find_closest_surface/main
execute if score $contact xylo_retina.__variable__ matches 1.. run scoreboard players operation $entity_distance xylo_retina.__variable__ = $min_distance_to_surface xylo_retina.__variable__
scoreboard players operation $hit_entity xylo_retina.__variable__ = $contact xylo_retina.__variable__
execute if score $hit_block xylo_retina.__variable__ matches 1.. if score $hit_entity xylo_retina.__variable__ matches 1.. if score $debug_messages xylo_retina.__variable__ matches 1.. run tellraw @a ["",{"text":"Distance comparison: entity_distance = ","color":"gold"},{"score":{"name":"$entity_distance","objective":"xylo_retina.__variable__"},"color":"gold"},{"text":", block_distance = ","color":"gold"},{"score":{"name":"$block_distance","objective":"xylo_retina.__variable__"},"color":"gold"}]
execute if score $hit_block xylo_retina.__variable__ matches 1.. if score $hit_entity xylo_retina.__variable__ matches 1.. if score $entity_distance xylo_retina.__variable__ < $block_distance xylo_retina.__variable__ run scoreboard players set $hit_block xylo_retina.__variable__ 0
execute if score $hit_block xylo_retina.__variable__ matches 1.. if score $hit_entity xylo_retina.__variable__ matches 1.. if score $entity_distance xylo_retina.__variable__ >= $block_distance xylo_retina.__variable__ run scoreboard players set $hit_entity xylo_retina.__variable__ 0