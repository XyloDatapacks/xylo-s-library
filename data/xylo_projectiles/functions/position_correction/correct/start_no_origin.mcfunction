# <@> entity with marker passenger
# execute as proj correction entity at @s
# motion vector stored in proj correction sb *10'000
# sb "xproj.position_correction.creation_time" init for @s
# origin saved in marker as hex_uuid in "data.xylo_projectiles.position_correction.shooter"

# out: "xproj.position_correction.hit_entity xproj.op" -> "xylo_projectiles:op entity_hit.uuid"

# get distance
data remove storage xylo_projectiles:op macro_data
execute store result storage xylo_projectiles:op macro_data.x double 0.0001 run scoreboard players get @s xproj.position_correction.motion_x
execute store result storage xylo_projectiles:op macro_data.y double 0.0001 run scoreboard players get @s xproj.position_correction.motion_y
execute store result storage xylo_projectiles:op macro_data.z double 0.0001 run scoreboard players get @s xproj.position_correction.motion_z
function xylo_library:utilities/distance/distance with storage xylo_projectiles:op macro_data
execute store result score xproj.position_correction.max_distance xproj.op run data get storage xylo_library:op distance_out 2000
scoreboard players add xproj.position_correction.max_distance xproj.op 2000

# get origin
execute if score @s xproj.position_correction.creation_time = @s xproj.position_correction.creation_time run scoreboard players add @s xproj.position_correction.creation_time 4
execute unless score @s xproj.position_correction.creation_time <= #xlib.time xlib.op on passengers if entity @s[tag=xproj.position_correction] run function xylo_projectiles:position_correction/correct/get_origin with entity @s data.xylo_projectiles.position_correction


# change position (loop return "xproj.position_correction.max_distance xproj.op" = {0: if found bock/entity}, {-1: no found})
scoreboard players set xproj.position_correction.hit_entity xproj.op 0
execute positioned ~ ~-0.24 ~ positioned ^ ^ ^-1 run function xylo_projectiles:position_correction/correct/retina
execute if score xproj.position_correction.has_result xproj.op matches 0 run data modify entity @s Pos set from storage xylo_projectiles:op corrected_pos
execute at @s run tp @s ^ ^ ^


# execute at @s run summon minecraft:armor_stand ^ ^ ^ {Marker:1b}
# execute if score xproj.position_correction.hit_entity xproj.op matches 1 run say hit
# execute if score xproj.position_correction.hit_entity xproj.op matches 0 run say missed