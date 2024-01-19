#==<Player Data>==#
data modify storage xylo_library:op player_data set from entity @s {}
execute store result score @s xlib.player.selected_slot run data get storage xylo_library:op player_data.SelectedItemSlot

execute store result score @s xlib.player.rotation_x run data get storage xylo_library:op player_data.Rotation[0] 100
execute store result score @s xlib.player.rotation_y run data get storage xylo_library:op player_data.Rotation[1] 100

execute store result score @s xlib.player.motion_x run data get storage xylo_library:op player_data.Motion[0] 10000
execute store result score @s xlib.player.motion_y run data get storage xylo_library:op player_data.Motion[1] 10000
execute store result score @s xlib.player.motion_z run data get storage xylo_library:op player_data.Motion[2] 10000

execute store result score @s xlib.player.on_ground run data get storage xylo_library:op player_data.OnGround

#==<Action Detection>==#

# death and respawn
execute store success score @s xlib.player.died run scoreboard players reset @s[scores={xlib.player._died=1..}] xlib.player._died
scoreboard players set @s[scores={xlib.player.reapawn_status=1}] xlib.player.reapawn_status 0
scoreboard players set @s[scores={xlib.player.reapawn_status=-1,xlib.player.health_obj=1..}] xlib.player.reapawn_status 1
execute if score @s xlib.player.died matches 1 run scoreboard players set @s xlib.player.reapawn_status -1

# jump
execute store success score @s xlib.player.jumped run scoreboard players reset @s[scores={xlib.player._jump=1..}] xlib.player._jump

# damage
execute store success score @s xlib.player.dealth_damage run scoreboard players reset @s[scores={xlib.player._dmg_dealth=1..}] xlib.player._dmg_dealth
execute store success score @s xlib.player.taken_damage run scoreboard players reset @s[scores={xlib.player._dmg_taken=1..}] xlib.player._dmg_taken

# join
execute store success score @s xlib.player.joining run scoreboard players reset @s[scores={xlib.player.leave_game=1..}] xlib.player.leave_game

#==<Double Sneak Detection>==#

# double sneak
scoreboard players operation @s[scores={xlib.player.sneak_time=1..,xlib.player.sneaking=0}] xlib.player.double_sneak_time = #xlib.time xlib.op
scoreboard players add @s[scores={xlib.player.sneak_time=1..,xlib.player.sneaking=0}] xlib.player.double_sneak_time 10
scoreboard players remove @s[scores={xlib.player.sneak_time=1..,xlib.player.sneaking=0}] xlib.player.double_sneak 1
scoreboard players remove @s[scores={xlib.player.sneak_time=0,xlib.player.sneaking=1}] xlib.player.double_sneak 1

execute if score @s[scores={xlib.player.double_sneak=..1}] xlib.player.double_sneak_time < #xlib.time xlib.op run scoreboard players set @s xlib.player.double_sneak 0
scoreboard players set @s[scores={xlib.player.double_sneak=1}] xlib.player.double_sneak 0
scoreboard players set @s[scores={xlib.player.double_sneak=..-4}] xlib.player.double_sneak 1

# sneaking
execute store success score @s xlib.player.sneaking run scoreboard players set @s[scores={xlib.player.sneak_time=1..}] xlib.player.sneak_time 0





#==<Call Player Ticks>==#
function xylo_items:player_tick
function #xylo_library:player_tick
