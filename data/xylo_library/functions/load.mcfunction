# clear schedule load check
schedule clear xylo_library:load_check

# validation
function xylo_library:xvc/start
execute if score $xylo_library xvc.load_status matches 0 run return 0
scoreboard players set $xylo_library xvc.load_status 1
# Reset scoreboards so packs can set values accurate for current load.
scoreboard players set xlib.xylo load.status 1

# op
scoreboard objectives add xlib.op dummy
scoreboard objectives add xlib.test dummy
# version
execute store result score #xlib.pack_version xlib.op run data get storage xvc_version:op packs[{namespace:"xylo_library"}].version
scoreboard objectives add xlib.player_version dummy

# const
scoreboard objectives add xconst dummy
scoreboard players set #-1000 xconst -1000
scoreboard players set #-5 xconst -5
scoreboard players set #-2 xconst -2
scoreboard players set #-1 xconst -1
scoreboard players set #0 xconst 0
scoreboard players set #1 xconst 1
scoreboard players set #2 xconst 2
scoreboard players set #3 xconst 3
scoreboard players set #4 xconst 4
scoreboard players set #5 xconst 5
scoreboard players set #6 xconst 6
scoreboard players set #7 xconst 7
scoreboard players set #8 xconst 8
scoreboard players set #9 xconst 9
scoreboard players set #10 xconst 10
scoreboard players set #11 xconst 11
scoreboard players set #12 xconst 12
scoreboard players set #13 xconst 13
scoreboard players set #14 xconst 14
scoreboard players set #15 xconst 15
scoreboard players set #16 xconst 16
scoreboard players set #17 xconst 17
scoreboard players set #18 xconst 18
scoreboard players set #19 xconst 19
scoreboard players set #20 xconst 20
scoreboard players set #25 xconst 25
scoreboard players set #30 xconst 30
scoreboard players set #36 xconst 36
scoreboard players set #40 xconst 40
scoreboard players set #50 xconst 50
scoreboard players set #60 xconst 60
scoreboard players set #80 xconst 80
scoreboard players set #90 xconst 90
scoreboard players set #99 xconst 99
scoreboard players set #100 xconst 100
scoreboard players set #119 xconst 119
scoreboard players set #150 xconst 150
scoreboard players set #200 xconst 200
scoreboard players set #250 xconst 250
scoreboard players set #400 xconst 400
scoreboard players set #500 xconst 500
scoreboard players set #600 xconst 600
scoreboard players set #1000 xconst 1000
scoreboard players set #2000 xconst 2000
scoreboard players set #4214 xconst 4214
scoreboard players set #5000 xconst 5000
scoreboard players set #10000 xconst 10000
scoreboard players set #50000 xconst 50000
scoreboard players set #50436 xconst 50436
scoreboard players set #90000 xconst 90000
scoreboard players set #99000 xconst 99000
scoreboard players set #100000 xconst 100000

#==<objectives>==#

# internal 
scoreboard objectives add xlib.internal.air_toggle dummy

# player
scoreboard objectives add xlib.player.selected_slot dummy
scoreboard objectives add xlib.player.health_obj health
scoreboard objectives add xlib.player.health_nbt dummy
scoreboard objectives add xlib.player.max_health dummy
scoreboard objectives add xlib.player._died minecraft.custom:minecraft.deaths
scoreboard objectives add xlib.player.died dummy
scoreboard objectives add xlib.player.reapawn_status dummy
scoreboard objectives add xlib.player.rotation_x dummy
scoreboard objectives add xlib.player.rotation_y dummy
scoreboard objectives add xlib.player.motion_x dummy
scoreboard objectives add xlib.player.motion_y dummy
scoreboard objectives add xlib.player.motion_z dummy
scoreboard objectives add xlib.player.on_ground dummy
scoreboard objectives add xlib.player._jump minecraft.custom:minecraft.jump
scoreboard objectives add xlib.player.jumped dummy
scoreboard objectives add xlib.player._dmg_dealt minecraft.custom:minecraft.damage_dealt
scoreboard objectives add xlib.player.dealt_damage_value dummy
scoreboard objectives add xlib.player.dealt_damage dummy
scoreboard objectives add xlib.player.dealt_damage_direct dummy
scoreboard objectives add xlib.player.dealt_damage_indirect dummy
scoreboard objectives add xlib.player._dmg_taken minecraft.custom:minecraft.damage_taken
scoreboard objectives add xlib.player.taken_damage dummy
scoreboard objectives add xlib.player.leave_game minecraft.custom:minecraft.leave_game
scoreboard objectives add xlib.player.joining minecraft.custom:minecraft.leave_game
scoreboard objectives add xlib.player.sneak_time minecraft.custom:minecraft.sneak_time
scoreboard objectives add xlib.player.sneaking dummy
scoreboard objectives add xlib.player.double_sneak dummy
scoreboard objectives add xlib.player.double_sneak_time dummy
scoreboard objectives add xlib.player.inventory_changed dummy
scoreboard objectives add xlib.player.selected_slot_old dummy
scoreboard objectives add xlib.player.selected_slot_changed dummy

# wfoas
scoreboard objectives add xlib.player.wfoas.used_stat minecraft.used:minecraft.warped_fungus_on_a_stick
scoreboard objectives add xlib.player.wfoas.used dummy
scoreboard objectives add xlib.player.wfoas.used_mh dummy
scoreboard objectives add xlib.player.wfoas.used_oh dummy

# utilities
scoreboard objectives add xlib.utilities.un_agro.reset_time dummy

# clone
scoreboard objectives add xlib.internal.clone.generate.end_time dummy
scoreboard objectives add xlib.internal.clone.generate.start_time dummy
scoreboard objectives add xlib.internal.clone.import.invis_time dummy

# gui
scoreboard objectives add xlib.internal.gui.priority dummy

# blocks
scoreboard objectives add xlib.internal.blocks.block_data dummy

#==<Other Inits>==#

# teams 
team add xlib.no_collision "xlib.no_collision"
team modify xlib.no_collision collisionRule never

# internal load
function xylo_library:internal/gui/generate/load
function xylo_library:internal/hit_detection/load

# utilities load
function xylo_library:utilities/uuid/load

#fixed uuid entities
function xylo_library:fixed_uuid_entities_summon
# shulker
setblock 29999999 0 12341232 minecraft:yellow_shulker_box
# command block
setblock 29999999 0 12341233 minecraft:repeating_command_block{auto:1b,Command:"function #xylo_library:command_block_tick"} replace

# revoke advancements
advancement revoke @a from xylo_library:revoke

# load
function xylo_items:load
function xylo_projectiles:load
function #xylo_library:load


