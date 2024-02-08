# <@> item display
# marker entity as passenger with hex_uuid in "data.xylo_projectiles.position_correction.shooter"
# in: "xylo_projectiles:op projectile_correction_setup{motion}"
# context: rotated in motion direction as projectile correction entity

tp @s ~ ~ ~ ~ ~

scoreboard players operation @s xproj.position_correction.creation_time = #xlib.time xlib.op

execute store result score @s xproj.position_correction.motion_x run data get storage xylo_projectiles:op projectile_correction_setup.motion[0] 10000
execute store result score @s xproj.position_correction.motion_y run data get storage xylo_projectiles:op projectile_correction_setup.motion[1] 10000
execute store result score @s xproj.position_correction.motion_z run data get storage xylo_projectiles:op projectile_correction_setup.motion[2] 10000



tag @s add xproj.position_correction.with_marker