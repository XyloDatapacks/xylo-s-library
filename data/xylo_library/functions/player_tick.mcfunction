# UPDATE VERSION
execute unless score @s xlib.player_version = #xlib.pack_version xlib.op run function xylo_library:player_init

#==<Player Data>==#
data modify storage xylo_library:op player_data set from entity @s {}

scoreboard players operation @s xlib.player.selected_slot_old = @s xlib.player.selected_slot
execute store result score @s xlib.player.selected_slot run data get storage xylo_library:op player_data.SelectedItemSlot
execute store success score @s xlib.player.selected_slot_changed unless score @s xlib.player.selected_slot = @s xlib.player.selected_slot_old

execute store result score @s xlib.player.rotation_x run data get storage xylo_library:op player_data.Rotation[0] 100
execute store result score @s xlib.player.rotation_y run data get storage xylo_library:op player_data.Rotation[1] 100

execute store result score @s xlib.player.motion_x run data get storage xylo_library:op player_data.Motion[0] 10000
execute store result score @s xlib.player.motion_y run data get storage xylo_library:op player_data.Motion[1] 10000
execute store result score @s xlib.player.motion_z run data get storage xylo_library:op player_data.Motion[2] 10000

execute store result score @s xlib.player.on_ground run data get storage xylo_library:op player_data.OnGround

#==<Action Detection>==#

# inventory changed
execute store success score @s xlib.player.inventory_changed run advancement revoke @s only xylo_library:player/inventory_changed

# death and respawn
execute store result score @s xlib.player.health_nbt run data get storage xylo_library:op player_data.Health 100
execute store success score @s xlib.player.died run scoreboard players reset @s[scores={xlib.player._died=1..}] xlib.player._died
scoreboard players set @s[scores={xlib.player.reapawn_status=1}] xlib.player.reapawn_status 0
scoreboard players set @s[scores={xlib.player.reapawn_status=-1,xlib.player.health_nbt=1..}] xlib.player.reapawn_status 1
execute if score @s xlib.player.died matches 1 run scoreboard players set @s xlib.player.reapawn_status -1

# jump
execute store success score @s xlib.player.jumped run scoreboard players reset @s[scores={xlib.player._jump=1..}] xlib.player._jump

# damage dealt
execute store success score @s xlib.player.dealt_damage run advancement revoke @s only xylo_library:player/damage_dealt
scoreboard players operation @s[scores={xlib.player._dmg_dealt=1..}] xlib.player.dealt_damage_value >< @s xlib.player._dmg_dealt
scoreboard players reset @s xlib.player._dmg_dealt
# damage dealt direct
execute store success score @s xlib.player.dealt_damage_direct run advancement revoke @s only xylo_library:player/damage_dealt_direct
# damage dealt indirect
execute store success score @s xlib.player.dealt_damage_indirect if entity @s[scores={xlib.player.dealt_damage=1,xlib.player.dealt_damage_direct=0}]

# damage taken
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
