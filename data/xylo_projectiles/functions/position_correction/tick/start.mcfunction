# in: "xylo_projectiles:op projectile_correction_tick{motion}"
# context: as projectile correction entity (passenger of the projectile)

# rotation
data remove storage xylo_projectiles:op macro_data
execute on vehicle run data modify storage xylo_projectiles:op temp_array set from entity @s Motion
data modify storage xylo_projectiles:op macro_data merge value {position_x:0.0d,position_y:0.0d,position_z:0.0d}
data modify storage xylo_projectiles:op macro_data.position_x set from storage xylo_projectiles:op temp_array[0]
data modify storage xylo_projectiles:op macro_data.position_y set from storage xylo_projectiles:op temp_array[1]
data modify storage xylo_projectiles:op macro_data.position_z set from storage xylo_projectiles:op temp_array[2]
execute at @s run function xylo_projectiles:position_correction/tick/rotation with storage xylo_projectiles:op macro_data
# motion
execute store result score @s xproj.position_correction.motion_x run data get storage xylo_projectiles:op temp_array[0] 10000
execute store result score @s xproj.position_correction.motion_y run data get storage xylo_projectiles:op temp_array[1] 10000
execute store result score @s xproj.position_correction.motion_z run data get storage xylo_projectiles:op temp_array[2] 10000

