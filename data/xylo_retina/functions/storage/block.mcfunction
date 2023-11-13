data modify storage xylo_retina:output Target set value "BLOCK"
data modify storage xylo_retina:output TargetedBlock set value [0,0,0]
data modify storage xylo_retina:output PlacingPosition set value [0,0,0]
data modify storage xylo_retina:output ContactCoordinates set value [0.0d,0.0d,0.0d]
data modify storage xylo_retina:output ContactSurface set from storage xylo_retina:data ContactSurface
execute if score $X0 xylo_retina.__variable__ matches ..-1 run scoreboard players add $X0 xylo_retina.__variable__ 480
execute if score $Y0 xylo_retina.__variable__ matches ..-1 run scoreboard players add $Y0 xylo_retina.__variable__ 480
execute store result storage xylo_retina:output TargetedBlock[0] int 1 run scoreboard players get $int_X xylo_retina.__variable__
execute store result storage xylo_retina:output PlacingPosition[0] int 1 run scoreboard players get $prev_X xylo_retina.__variable__
scoreboard players operation $targeted_X xylo_retina.__variable__ += $origin_X xylo_retina.__variable__
execute store result storage xylo_retina:output ContactCoordinates[0] double 0.0020833333333333333 run scoreboard players get $targeted_X xylo_retina.__variable__
execute if score $nearest_axis xylo_retina.__variable__ matches 0 run function xylo_retina:__private__/if_else/23
execute store result storage xylo_retina:output TargetedBlock[1] int 1 run scoreboard players get $int_Y xylo_retina.__variable__
execute store result storage xylo_retina:output PlacingPosition[1] int 1 run scoreboard players get $prev_Y xylo_retina.__variable__
scoreboard players operation $targeted_Y xylo_retina.__variable__ += $origin_Y xylo_retina.__variable__
execute store result storage xylo_retina:output ContactCoordinates[1] double 0.0020833333333333333 run scoreboard players get $targeted_Y xylo_retina.__variable__
execute if score $nearest_axis xylo_retina.__variable__ matches 1 run function xylo_retina:__private__/if_else/24
execute store result storage xylo_retina:output TargetedBlock[2] int 1 run scoreboard players get $int_Z xylo_retina.__variable__
execute store result storage xylo_retina:output PlacingPosition[2] int 1 run scoreboard players get $prev_Z xylo_retina.__variable__
scoreboard players operation $targeted_Z xylo_retina.__variable__ += $origin_Z xylo_retina.__variable__
execute store result storage xylo_retina:output ContactCoordinates[2] double 0.0020833333333333333 run scoreboard players get $targeted_Z xylo_retina.__variable__
execute if score $nearest_axis xylo_retina.__variable__ matches 2 run function xylo_retina:__private__/if_else/25
scoreboard players operation $total_distance xylo_retina.__variable__ /= 480 xylo_retina.__int__
execute if score $total_distance xylo_retina.__variable__ matches ..-1 run scoreboard players operation $total_distance xylo_retina.__variable__ *= -1 xylo_retina.__int__
execute store result storage xylo_retina:output Distance double 0.0020833333333333333 run scoreboard players get $total_distance xylo_retina.__variable__
execute if data storage xylo_retina:input {EndpointEntity: true} summon minecraft:marker run function xylo_retina:__private__/anonymous/9