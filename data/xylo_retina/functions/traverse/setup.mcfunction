data modify storage xylo_retina:output Target set value "NONE"
data modify storage xylo_retina:output Distance set from storage xylo_retina:input MaxRecursionDepth
data modify storage xylo_retina:output HitEntityHead set value false
data remove storage xylo_retina:output TargetedBlock
data remove storage xylo_retina:output TargetedEntity
data remove storage xylo_retina:output PlacingPosition
data remove storage xylo_retina:output ContactSurface
data remove storage xylo_retina:output HitFace
data remove storage xylo_retina:output ContactCoordinates
execute unless score $override_executing retina.__variable__ matches 1 positioned ~-0.5 ~-0.5 ~-0.5 run tag @e[dx=0] add retina.executing
# moved to anonymous/0: execute if score $single_call retina.__variable__ matches 1.. run function xylo_retina:__private__/if_else/0
execute summon minecraft:marker run function xylo_retina:__private__/anonymous/0
scoreboard players reset $override_input_pitch retina.__variable__

#moved this block below to reuse coord get from anonymous/0
scoreboard players operation $test_X retina.__variable__ = $X retina.__variable__
scoreboard players operation $test_X retina.__variable__ /= $overflow_risk retina.__variable__
execute unless score $test_X retina.__variable__ matches -1..0 run tellraw @a ["",{"text":"[Error] ","color":"dark_red"},{"text":"Raycast X coordinate of ","color":"red"},{"score":{"name":"$int_X","objective":"retina.__variable__"},"color":"red"},{"text":" is out of range (-","color":"red"},{"score":{"name":"$overflow_risk","objective":"retina.__variable__"},"color":"red"},{"text":", ","color":"red"},{"score":{"name":"$overflow_risk","objective":"retina.__variable__"},"color":"red"},{"text":")","color":"red"}]
execute unless score $test_X retina.__variable__ matches -1..0 run return 0
scoreboard players operation $test_Z retina.__variable__ = $Z retina.__variable__
scoreboard players operation $test_Z retina.__variable__ /= $overflow_risk retina.__variable__
execute unless score $test_Z retina.__variable__ matches -1..0 run tellraw @a ["",{"text":"[Error] ","color":"dark_red"},{"text":"Raycast Z coordinate of ","color":"red"},{"score":{"name":"$int_Z","objective":"retina.__variable__"},"color":"red"},{"text":" is out of range (-","color":"red"},{"score":{"name":"$overflow_risk","objective":"retina.__variable__"},"color":"red"},{"text":", ","color":"red"},{"score":{"name":"$overflow_risk","objective":"retina.__variable__"},"color":"red"},{"text":")","color":"red"}]
execute unless score $test_Z retina.__variable__ matches -1..0 run return 0
execute store result score $block_distance retina.__variable__ run scoreboard players set $entity_distance retina.__variable__ 2147483647
execute store result score $hit_block retina.__variable__ store result score $hit_entity retina.__variable__ run scoreboard players set $contact retina.__variable__ 0
execute store result score $max_depth retina.__variable__ run data get storage xylo_retina:input MaxRecursionDepth

execute store result score $max_traveled_distance_square retina.__variable__ run data get storage xylo_retina:input MaxTravelDistance
scoreboard players operation $max_traveled_distance_square retina.__variable__ *= $max_traveled_distance_square retina.__variable__
scoreboard players set $traveled_distance_square retina.__variable__ 0
scoreboard players set $traveled_distance_X retina.__variable__ 0
scoreboard players set $traveled_distance_Y retina.__variable__ 0
scoreboard players set $traveled_distance_Z retina.__variable__ 0

scoreboard players operation $origin_X retina.__variable__ = $X retina.__variable__
scoreboard players operation $frac_origin_X retina.__variable__ = $X retina.__variable__
scoreboard players operation $frac_origin_X retina.__variable__ %= 480 retina.__int__
scoreboard players set $step_X retina.__variable__ 0
execute if score $output_vec3.X retina.__variable__ matches ..-1 run scoreboard players set $sign_X retina.__variable__ -1
execute if score $output_vec3.X retina.__variable__ matches 0.. run scoreboard players set $sign_X retina.__variable__ 1
scoreboard players set $delta_X retina.__variable__ 230400
scoreboard players operation $delta_X retina.__variable__ /= $output_vec3.X retina.__variable__
scoreboard players operation $delta_X retina.__variable__ /= $sign_X retina.__variable__
scoreboard players operation $distance_X retina.__variable__ = $X retina.__variable__
scoreboard players operation $distance_X retina.__variable__ *= $sign_X retina.__variable__
scoreboard players operation $distance_X retina.__variable__ *= -1 retina.__int__
scoreboard players operation $distance_X retina.__variable__ %= 480 retina.__int__
scoreboard players operation $distance_X retina.__variable__ *= $delta_X retina.__variable__
scoreboard players operation $distance_X retina.__variable__ /= 480 retina.__int__
execute if score $output_vec3.X retina.__variable__ matches 0 store result score $delta_X retina.__variable__ run scoreboard players set $distance_X retina.__variable__ 2147483647
scoreboard players operation $int_X retina.__variable__ = $X retina.__variable__
scoreboard players operation $int_X retina.__variable__ /= 480 retina.__int__
scoreboard players operation $origin_Y retina.__variable__ = $Y retina.__variable__
scoreboard players operation $frac_origin_Y retina.__variable__ = $Y retina.__variable__
scoreboard players operation $frac_origin_Y retina.__variable__ %= 480 retina.__int__
scoreboard players set $step_Y retina.__variable__ 0
execute if score $output_vec3.Y retina.__variable__ matches ..-1 run scoreboard players set $sign_Y retina.__variable__ -1
execute if score $output_vec3.Y retina.__variable__ matches 0.. run scoreboard players set $sign_Y retina.__variable__ 1
scoreboard players set $delta_Y retina.__variable__ 230400
scoreboard players operation $delta_Y retina.__variable__ /= $output_vec3.Y retina.__variable__
scoreboard players operation $delta_Y retina.__variable__ /= $sign_Y retina.__variable__
scoreboard players operation $distance_Y retina.__variable__ = $Y retina.__variable__
scoreboard players operation $distance_Y retina.__variable__ *= $sign_Y retina.__variable__
scoreboard players operation $distance_Y retina.__variable__ *= -1 retina.__int__
scoreboard players operation $distance_Y retina.__variable__ %= 480 retina.__int__
scoreboard players operation $distance_Y retina.__variable__ *= $delta_Y retina.__variable__
scoreboard players operation $distance_Y retina.__variable__ /= 480 retina.__int__
execute if score $output_vec3.Y retina.__variable__ matches 0 store result score $delta_Y retina.__variable__ run scoreboard players set $distance_Y retina.__variable__ 2147483647
scoreboard players operation $int_Y retina.__variable__ = $Y retina.__variable__
scoreboard players operation $int_Y retina.__variable__ /= 480 retina.__int__
scoreboard players operation $origin_Z retina.__variable__ = $Z retina.__variable__
scoreboard players operation $frac_origin_Z retina.__variable__ = $Z retina.__variable__
scoreboard players operation $frac_origin_Z retina.__variable__ %= 480 retina.__int__
scoreboard players set $step_Z retina.__variable__ 0
execute if score $output_vec3.Z retina.__variable__ matches ..-1 run scoreboard players set $sign_Z retina.__variable__ -1
execute if score $output_vec3.Z retina.__variable__ matches 0.. run scoreboard players set $sign_Z retina.__variable__ 1
scoreboard players set $delta_Z retina.__variable__ 230400
scoreboard players operation $delta_Z retina.__variable__ /= $output_vec3.Z retina.__variable__
scoreboard players operation $delta_Z retina.__variable__ /= $sign_Z retina.__variable__
scoreboard players operation $distance_Z retina.__variable__ = $Z retina.__variable__
scoreboard players operation $distance_Z retina.__variable__ *= $sign_Z retina.__variable__
scoreboard players operation $distance_Z retina.__variable__ *= -1 retina.__int__
scoreboard players operation $distance_Z retina.__variable__ %= 480 retina.__int__
scoreboard players operation $distance_Z retina.__variable__ *= $delta_Z retina.__variable__
scoreboard players operation $distance_Z retina.__variable__ /= 480 retina.__int__
execute if score $output_vec3.Z retina.__variable__ matches 0 store result score $delta_Z retina.__variable__ run scoreboard players set $distance_Z retina.__variable__ 2147483647
scoreboard players operation $int_Z retina.__variable__ = $Z retina.__variable__
scoreboard players operation $int_Z retina.__variable__ /= 480 retina.__int__
execute if score $debug_messages retina.__variable__ matches 1.. run tellraw @a ["",{"text":"Origin: "},{"text":"[","color":"yellow"},{"score":{"name":"$int_X","objective":"retina.__variable__"},"color":"yellow"},{"text":", ","color":"yellow"},{"score":{"name":"$int_Y","objective":"retina.__variable__"},"color":"yellow"},{"text":", ","color":"yellow"},{"score":{"name":"$int_Z","objective":"retina.__variable__"},"color":"yellow"},{"text":"]","color":"yellow"}]
scoreboard players set $step retina.__variable__ 0

#execute store result score $offset_Y retina.__variable__ run data get entity @s Pos[1] -480
#scoreboard players operation $offset_Y retina.__variable__ += $Y retina.__variable__
#execute if score $offset_Y retina.__variable__ matches 776..778 positioned ~ ~1.62 ~ run function xylo_retina:traverse/loop
#execute if score $offset_Y retina.__variable__ matches 608..610 positioned ~ ~1.27 ~ run function xylo_retina:traverse/loop
#execute if score $offset_Y retina.__variable__ matches 192 positioned ~ ~0.4 ~ run function xylo_retina:traverse/loop
function xylo_retina:traverse/loop
execute if score $hit_block retina.__variable__ matches 1.. run function xylo_retina:storage/block
execute if score $hit_entity retina.__variable__ matches 1.. run function xylo_retina:storage/entity
scoreboard players reset $expand_entity_check retina.__variable__
scoreboard players reset $ignore_blocks retina.__variable__

function #xylo_retina:on_hit
execute unless score $override_executing retina.__variable__ matches 1 positioned ~-0.5 ~-0.5 ~-0.5 run tag @e[dx=0] remove retina.executing
scoreboard players reset $override_executing retina.__variable__