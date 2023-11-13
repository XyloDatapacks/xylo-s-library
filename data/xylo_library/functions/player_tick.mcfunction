data modify storage xylo_library:op player_data set from entity @s {}
execute store result score @s xlib.player.selected_slot run data get storage xylo_library:op player_data.SelectedItemSlot

execute store result score @s xlib.player.rotation_x run data get storage xylo_library:op player_data.Rotation[0] 100
execute store result score @s xlib.player.rotation_y run data get storage xylo_library:op player_data.Rotation[1] 100

execute store result score @s xlib.player.motion_x run data get storage xylo_library:op player_data.Motion[0] 10000
execute store result score @s xlib.player.motion_y run data get storage xylo_library:op player_data.Motion[1] 10000
execute store result score @s xlib.player.motion_z run data get storage xylo_library:op player_data.Motion[2] 10000

execute store success score @s xlib.player.died run scoreboard players reset @s[scores={xlib.player._died=1..}] xlib.player._died
scoreboard players set @s[scores={xlib.player.reapawn_status=1}] xlib.player.reapawn_status 0
scoreboard players set @s[scores={xlib.player.reapawn_status=-1,xlib.player.health_obj=1..}] xlib.player.reapawn_status 1
execute if score @s xlib.player.died matches 1 run scoreboard players set @s xlib.player.reapawn_status -1



function #xylo_library:player_tick