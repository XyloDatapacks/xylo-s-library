data modify storage xylo_retina:output Target set value "NONE"
data modify storage xylo_retina:output Distance set from storage xylo_retina:input MaxRecursionDepth
data modify storage xylo_retina:output HitEntityHead set value false
data remove storage xylo_retina:output TargetedBlock
data remove storage xylo_retina:output TargetedEntity
data remove storage xylo_retina:output PlacingPosition
data remove storage xylo_retina:output ContactSurface
data remove storage xylo_retina:output HitFace
execute store result score $int_X xylo_retina.__variable__ run data get entity @s Pos[0] 1
scoreboard players operation $test_X xylo_retina.__variable__ = $int_X xylo_retina.__variable__
scoreboard players operation $test_X xylo_retina.__variable__ /= $overflow_risk xylo_retina.__variable__
execute unless score $test_X xylo_retina.__variable__ matches -1..0 run tellraw @a ["",{"text":"[Error] ","color":"dark_red"},{"text":"Raycast X coordinate of ","color":"red"},{"score":{"name":"$int_X","objective":"xylo_retina.__variable__"},"color":"red"},{"text":" is out of range (-","color":"red"},{"score":{"name":"$overflow_risk","objective":"xylo_retina.__variable__"},"color":"red"},{"text":", ","color":"red"},{"score":{"name":"$overflow_risk","objective":"xylo_retina.__variable__"},"color":"red"},{"text":")","color":"red"}]
execute unless score $test_X xylo_retina.__variable__ matches -1..0 run return 0
execute store result score $int_Z xylo_retina.__variable__ run data get entity @s Pos[0] 1
scoreboard players operation $test_Z xylo_retina.__variable__ = $int_Z xylo_retina.__variable__
scoreboard players operation $test_Z xylo_retina.__variable__ /= $overflow_risk xylo_retina.__variable__
execute unless score $test_Z xylo_retina.__variable__ matches -1..0 run tellraw @a ["",{"text":"[Error] ","color":"dark_red"},{"text":"Raycast Z coordinate of ","color":"red"},{"score":{"name":"$int_Z","objective":"xylo_retina.__variable__"},"color":"red"},{"text":" is out of range (-","color":"red"},{"score":{"name":"$overflow_risk","objective":"xylo_retina.__variable__"},"color":"red"},{"text":", ","color":"red"},{"score":{"name":"$overflow_risk","objective":"xylo_retina.__variable__"},"color":"red"},{"text":")","color":"red"}]
execute unless score $test_Z xylo_retina.__variable__ matches -1..0 run return 0
execute store result score $block_distance xylo_retina.__variable__ run scoreboard players set $entity_distance xylo_retina.__variable__ 2147483647
execute store result score $hit_block xylo_retina.__variable__ store result score $hit_entity xylo_retina.__variable__ run scoreboard players set $contact xylo_retina.__variable__ 0
execute store result score $max_depth xylo_retina.__variable__ run data get storage xylo_retina:input MaxRecursionDepth
tag @s add xylo_retina.executing
execute if score $single_call xylo_retina.__variable__ matches 1.. run function xylo_retina:__private__/if_else/0
execute anchored eyes positioned ^ ^ ^ summon minecraft:marker run function xylo_retina:__private__/anonymous/0
scoreboard players operation $origin_X xylo_retina.__variable__ = $X xylo_retina.__variable__
scoreboard players operation $frac_origin_X xylo_retina.__variable__ = $X xylo_retina.__variable__
scoreboard players operation $frac_origin_X xylo_retina.__variable__ %= 480 xylo_retina.__int__
scoreboard players set $step_X xylo_retina.__variable__ 0
execute if score $output_vec3.X xylo_retina.__variable__ matches ..-1 run scoreboard players set $sign_X xylo_retina.__variable__ -1
execute if score $output_vec3.X xylo_retina.__variable__ matches 0.. run scoreboard players set $sign_X xylo_retina.__variable__ 1
scoreboard players set $delta_X xylo_retina.__variable__ 230400
scoreboard players operation $delta_X xylo_retina.__variable__ /= $output_vec3.X xylo_retina.__variable__
scoreboard players operation $delta_X xylo_retina.__variable__ /= $sign_X xylo_retina.__variable__
scoreboard players operation $distance_X xylo_retina.__variable__ = $X xylo_retina.__variable__
scoreboard players operation $distance_X xylo_retina.__variable__ *= $sign_X xylo_retina.__variable__
scoreboard players operation $distance_X xylo_retina.__variable__ *= -1 xylo_retina.__int__
scoreboard players operation $distance_X xylo_retina.__variable__ %= 480 xylo_retina.__int__
scoreboard players operation $distance_X xylo_retina.__variable__ *= $delta_X xylo_retina.__variable__
scoreboard players operation $distance_X xylo_retina.__variable__ /= 480 xylo_retina.__int__
execute if score $output_vec3.X xylo_retina.__variable__ matches 0 store result score $delta_X xylo_retina.__variable__ run scoreboard players set $distance_X xylo_retina.__variable__ 2147483647
scoreboard players operation $int_X xylo_retina.__variable__ = $X xylo_retina.__variable__
scoreboard players operation $int_X xylo_retina.__variable__ /= 480 xylo_retina.__int__
scoreboard players operation $origin_Y xylo_retina.__variable__ = $Y xylo_retina.__variable__
scoreboard players operation $frac_origin_Y xylo_retina.__variable__ = $Y xylo_retina.__variable__
scoreboard players operation $frac_origin_Y xylo_retina.__variable__ %= 480 xylo_retina.__int__
scoreboard players set $step_Y xylo_retina.__variable__ 0
execute if score $output_vec3.Y xylo_retina.__variable__ matches ..-1 run scoreboard players set $sign_Y xylo_retina.__variable__ -1
execute if score $output_vec3.Y xylo_retina.__variable__ matches 0.. run scoreboard players set $sign_Y xylo_retina.__variable__ 1
scoreboard players set $delta_Y xylo_retina.__variable__ 230400
scoreboard players operation $delta_Y xylo_retina.__variable__ /= $output_vec3.Y xylo_retina.__variable__
scoreboard players operation $delta_Y xylo_retina.__variable__ /= $sign_Y xylo_retina.__variable__
scoreboard players operation $distance_Y xylo_retina.__variable__ = $Y xylo_retina.__variable__
scoreboard players operation $distance_Y xylo_retina.__variable__ *= $sign_Y xylo_retina.__variable__
scoreboard players operation $distance_Y xylo_retina.__variable__ *= -1 xylo_retina.__int__
scoreboard players operation $distance_Y xylo_retina.__variable__ %= 480 xylo_retina.__int__
scoreboard players operation $distance_Y xylo_retina.__variable__ *= $delta_Y xylo_retina.__variable__
scoreboard players operation $distance_Y xylo_retina.__variable__ /= 480 xylo_retina.__int__
execute if score $output_vec3.Y xylo_retina.__variable__ matches 0 store result score $delta_Y xylo_retina.__variable__ run scoreboard players set $distance_Y xylo_retina.__variable__ 2147483647
scoreboard players operation $int_Y xylo_retina.__variable__ = $Y xylo_retina.__variable__
scoreboard players operation $int_Y xylo_retina.__variable__ /= 480 xylo_retina.__int__
scoreboard players operation $origin_Z xylo_retina.__variable__ = $Z xylo_retina.__variable__
scoreboard players operation $frac_origin_Z xylo_retina.__variable__ = $Z xylo_retina.__variable__
scoreboard players operation $frac_origin_Z xylo_retina.__variable__ %= 480 xylo_retina.__int__
scoreboard players set $step_Z xylo_retina.__variable__ 0
execute if score $output_vec3.Z xylo_retina.__variable__ matches ..-1 run scoreboard players set $sign_Z xylo_retina.__variable__ -1
execute if score $output_vec3.Z xylo_retina.__variable__ matches 0.. run scoreboard players set $sign_Z xylo_retina.__variable__ 1
scoreboard players set $delta_Z xylo_retina.__variable__ 230400
scoreboard players operation $delta_Z xylo_retina.__variable__ /= $output_vec3.Z xylo_retina.__variable__
scoreboard players operation $delta_Z xylo_retina.__variable__ /= $sign_Z xylo_retina.__variable__
scoreboard players operation $distance_Z xylo_retina.__variable__ = $Z xylo_retina.__variable__
scoreboard players operation $distance_Z xylo_retina.__variable__ *= $sign_Z xylo_retina.__variable__
scoreboard players operation $distance_Z xylo_retina.__variable__ *= -1 xylo_retina.__int__
scoreboard players operation $distance_Z xylo_retina.__variable__ %= 480 xylo_retina.__int__
scoreboard players operation $distance_Z xylo_retina.__variable__ *= $delta_Z xylo_retina.__variable__
scoreboard players operation $distance_Z xylo_retina.__variable__ /= 480 xylo_retina.__int__
execute if score $output_vec3.Z xylo_retina.__variable__ matches 0 store result score $delta_Z xylo_retina.__variable__ run scoreboard players set $distance_Z xylo_retina.__variable__ 2147483647
scoreboard players operation $int_Z xylo_retina.__variable__ = $Z xylo_retina.__variable__
scoreboard players operation $int_Z xylo_retina.__variable__ /= 480 xylo_retina.__int__
execute if score $debug_messages xylo_retina.__variable__ matches 1.. run tellraw @a ["",{"text":"Origin: "},{"text":"[","color":"yellow"},{"score":{"name":"$int_X","objective":"xylo_retina.__variable__"},"color":"yellow"},{"text":", ","color":"yellow"},{"score":{"name":"$int_Y","objective":"xylo_retina.__variable__"},"color":"yellow"},{"text":", ","color":"yellow"},{"score":{"name":"$int_Z","objective":"xylo_retina.__variable__"},"color":"yellow"},{"text":"]","color":"yellow"}]
scoreboard players set $step xylo_retina.__variable__ 0
execute store result score $offset_Y xylo_retina.__variable__ run data get entity @s Pos[1] -480
scoreboard players operation $offset_Y xylo_retina.__variable__ += $Y xylo_retina.__variable__
execute if score $offset_Y xylo_retina.__variable__ matches 776..778 positioned ~ ~1.62 ~ run function xylo_retina:traverse/loop
execute if score $offset_Y xylo_retina.__variable__ matches 608..610 positioned ~ ~1.27 ~ run function xylo_retina:traverse/loop
execute if score $offset_Y xylo_retina.__variable__ matches 192 positioned ~ ~0.4 ~ run function xylo_retina:traverse/loop
execute if score $hit_block xylo_retina.__variable__ matches 1.. run function xylo_retina:storage/block
execute if score $hit_entity xylo_retina.__variable__ matches 1.. run function xylo_retina:storage/entity
function #xylo_retina:on_hit
tag @s remove xylo_retina.executing