#> xylo_iris:raycast/on_hit
#
# Writes all available information about the encountered block or entity
# See xylo_iris:get_target for full documentation
#
# @private
# @within xylo_iris:raycast/loop

tag @s remove xylo_iris.executing

# Write target type (one of BLOCK, ENTITY)
execute if score $block_hit xylo_iris matches 1 if score $entity_hit xylo_iris matches 0 run data modify storage xylo_iris:output TargetType set value "BLOCK"
execute if score $entity_hit xylo_iris matches 1 if score $block_hit xylo_iris matches 0 run data modify storage xylo_iris:output TargetType set value "ENTITY"
execute if score $block_hit xylo_iris matches 1 if score $entity_hit xylo_iris matches 1 if score $block_distance xylo_iris <= $entity_distance xylo_iris run data modify storage xylo_iris:output TargetType set value "BLOCK"
execute if score $block_hit xylo_iris matches 1 if score $entity_hit xylo_iris matches 1 if score $block_distance xylo_iris > $entity_distance xylo_iris run data modify storage xylo_iris:output TargetType set value "ENTITY"

# Write targeted block
execute if data storage xylo_iris:output {TargetType: "BLOCK"} run data modify storage xylo_iris:output TargetedBlock set value [0, 0, 0]
execute if data storage xylo_iris:output {TargetType: "BLOCK"} store result storage xylo_iris:output TargetedBlock[0] int 1 run scoreboard players get $[x] xylo_iris
execute if data storage xylo_iris:output {TargetType: "BLOCK"} store result storage xylo_iris:output TargetedBlock[1] int 1 run scoreboard players get $[y] xylo_iris
execute if data storage xylo_iris:output {TargetType: "BLOCK"} store result storage xylo_iris:output TargetedBlock[2] int 1 run scoreboard players get $[z] xylo_iris
execute if data storage xylo_iris:output {TargetType: "BLOCK"} align xyz run summon minecraft:marker ~0.5 ~0.5 ~0.5 {Tags: ["xylo_iris", "xylo_iris.targeted_block"]}

# Write targeted entity
execute if data storage xylo_iris:output {TargetType: "ENTITY"} run data modify storage xylo_iris:output TargetedEntity.id set from storage xylo_iris:data TargetedBox.entity_id
execute if data storage xylo_iris:output {TargetType: "ENTITY"} run data remove storage xylo_iris:data TargetedBox.entity_id
execute if data storage xylo_iris:output {TargetType: "ENTITY"} run data remove storage xylo_iris:data TargetedFace.entity_id
execute if data storage xylo_iris:output {TargetType: "ENTITY"} store result score $entity_id xylo_iris run data get storage xylo_iris:output TargetedEntity.id
execute if data storage xylo_iris:output {TargetType: "ENTITY"} as @e[tag=xylo_iris.possible_target] if score @s xylo_iris.id = $entity_id xylo_iris run function xylo_iris:raycast/_on_hit_register_entity
execute if data storage xylo_iris:output {TargetType: "ENTITY"} run tag @e remove xylo_iris.possible_target

# Write target position
data modify storage xylo_iris:output TargetPosition.tile set value [0, 0, 0]
data modify storage xylo_iris:op target_pos_macro set value {x:0,y:0,z:0,x_dec:0,y_dec:0,z_dec:0}
execute store result storage xylo_iris:output TargetPosition.tile[0] int 1 store result storage xylo_iris:op target_pos_macro.x int 1 run scoreboard players get $[x] xylo_iris
execute store result storage xylo_iris:output TargetPosition.tile[1] int 1 store result storage xylo_iris:op target_pos_macro.y int 1 run scoreboard players get $[y] xylo_iris
execute store result storage xylo_iris:output TargetPosition.tile[2] int 1 store result storage xylo_iris:op target_pos_macro.z int 1 run scoreboard players get $[z] xylo_iris
data modify storage xylo_iris:output TargetPosition.point set from storage xylo_iris:data TargetPoint
execute store result score ${x} xylo_iris run data get storage xylo_iris:output TargetPosition.point[0] 1000000
execute store result score ${y} xylo_iris run data get storage xylo_iris:output TargetPosition.point[1] 1000000
execute store result score ${z} xylo_iris run data get storage xylo_iris:output TargetPosition.point[2] 1000000
data modify storage xylo_iris:op target_pos_macro.x_dec set from storage xylo_iris:output TargetPosition.point[0]
data modify storage xylo_iris:op target_pos_macro.y_dec set from storage xylo_iris:output TargetPosition.point[1]
data modify storage xylo_iris:op target_pos_macro.z_dec set from storage xylo_iris:output TargetPosition.point[2]
execute summon minecraft:marker run function xylo_iris:raycast/_on_hit_target_pos with storage xylo_iris:op target_pos_macro


# Write targeted box
data modify storage xylo_iris:output TargetedBox set from storage xylo_iris:data TargetedBox

# Write targeted face
data modify storage xylo_iris:output TargetedFace set from storage xylo_iris:data TargetedFace
execute if data storage xylo_iris:output TargetedFace{Direction: "WEST_EAST"} if score $dx xylo_iris matches 0.. run data modify storage xylo_iris:output TargetedFace.Direction set value "WEST"
execute if data storage xylo_iris:output TargetedFace{Direction: "WEST_EAST"} if score $dx xylo_iris matches ..-1 run data modify storage xylo_iris:output TargetedFace.Direction set value "EAST"
execute if data storage xylo_iris:output TargetedFace{Direction: "UP_DOWN"} if score $dy xylo_iris matches 0.. run data modify storage xylo_iris:output TargetedFace.Direction set value "DOWN"
execute if data storage xylo_iris:output TargetedFace{Direction: "UP_DOWN"} if score $dy xylo_iris matches ..-1 run data modify storage xylo_iris:output TargetedFace.Direction set value "UP"
execute if data storage xylo_iris:output TargetedFace{Direction: "NORTH_SOUTH"} if score $dz xylo_iris matches 0.. run data modify storage xylo_iris:output TargetedFace.Direction set value "NORTH"
execute if data storage xylo_iris:output TargetedFace{Direction: "NORTH_SOUTH"} if score $dz xylo_iris matches ..-1 run data modify storage xylo_iris:output TargetedFace.Direction set value "SOUTH"

# Write place position
data modify storage xylo_iris:output PlacePosition.tile set value [0, 0, 0]
scoreboard players operation $place_position_x xylo_iris = $[x] xylo_iris
scoreboard players operation $place_position_y xylo_iris = $[y] xylo_iris
scoreboard players operation $place_position_z xylo_iris = $[z] xylo_iris
execute if data storage xylo_iris:output TargetedFace{Direction:"EAST"} run scoreboard players add $place_position_x xylo_iris 1 
execute if data storage xylo_iris:output TargetedFace{Direction:"WEST"} run scoreboard players remove $place_position_x xylo_iris 1 
execute if data storage xylo_iris:output TargetedFace{Direction:"UP"} run scoreboard players add $place_position_y xylo_iris 1 
execute if data storage xylo_iris:output TargetedFace{Direction:"DOWN"} run scoreboard players remove $place_position_y xylo_iris 1 
execute if data storage xylo_iris:output TargetedFace{Direction:"SOUTH"} run scoreboard players add $place_position_z xylo_iris 1 
execute if data storage xylo_iris:output TargetedFace{Direction:"NORTH"} run scoreboard players remove $place_position_z xylo_iris 1 
execute store result storage xylo_iris:output PlacePosition.tile[0] int 1 run scoreboard players get $place_position_x xylo_iris
execute store result storage xylo_iris:output PlacePosition.tile[1] int 1 run scoreboard players get $place_position_y xylo_iris
execute store result storage xylo_iris:output PlacePosition.tile[2] int 1 run scoreboard players get $place_position_z xylo_iris

# Write total distance
execute if data storage xylo_iris:output {TargetType: "BLOCK"} run scoreboard players operation $total_distance xylo_iris += $block_distance xylo_iris
execute if data storage xylo_iris:output {TargetType: "ENTITY"} run scoreboard players operation $total_distance xylo_iris += $entity_distance xylo_iris
execute store result storage xylo_iris:output Distance double 0.000001 run scoreboard players get $total_distance xylo_iris

# Run callback
execute if data storage xylo_iris:settings Callback run data modify storage xylo_iris:args function set from storage xylo_iris:settings Callback
execute if data storage xylo_iris:settings Callback run function xylo_iris:raycast/macro_functions/callback with storage xylo_iris:args

return run scoreboard players get $total_distance xylo_iris
