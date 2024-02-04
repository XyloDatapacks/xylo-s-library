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

# player
scoreboard objectives add xlib.player.selected_slot dummy
scoreboard objectives add xlib.player.health_obj health
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
scoreboard objectives add xlib.player._dmg_dealth minecraft.custom:minecraft.damage_dealt
scoreboard objectives add xlib.player.dealth_damage dummy
scoreboard objectives add xlib.player._dmg_taken minecraft.custom:minecraft.damage_taken
scoreboard objectives add xlib.player.taken_damage dummy
scoreboard objectives add xlib.player.leave_game minecraft.custom:minecraft.leave_game
scoreboard objectives add xlib.player.joining minecraft.custom:minecraft.leave_game
scoreboard objectives add xlib.player.sneak_time minecraft.custom:minecraft.sneak_time
scoreboard objectives add xlib.player.sneaking dummy
scoreboard objectives add xlib.player.double_sneak dummy
scoreboard objectives add xlib.player.double_sneak_time dummy

# clone
scoreboard objectives add xlib.internal.clone.generate.end_time dummy
scoreboard objectives add xlib.internal.clone.generate.start_time dummy
scoreboard objectives add xlib.internal.clone.import.invis_time dummy

#==<Other Inits>==#

# functions
function xylo_library:utilities/uuid/load

# distance calc (UUID: 0000000d-0109-0097-0116-000000000104)
execute unless entity 0000000d-0109-0097-0116-000000000104 run summon minecraft:item_display 29999999.0 0 12341232.0 {CustomName:'{"text":"xylo_library.distance_calc"}',Tags:["math","smithed.entity","smithed.strict"],UUID:[I;13,17367191,18219008,260]}

# marker (UUID:545ec994-ae69-485d-9604-981ce1612a99)
execute unless entity 545ec994-ae69-485d-9604-981ce1612a99 run summon minecraft:marker 29999999.0 0 12341232.0 {UUID:[I; 1415498132, -1368831907, -1778083812, -513725799],CustomName:'{"text":"xylo_library"}',Tags:["smithed.entity","smithed.strict"]}

# revoke advancements
advancement revoke @a from xylo_library:revoke

# shulker
setblock 29999999 0 12341232 minecraft:yellow_shulker_box

# load
function xylo_items:load
function xylo_projectiles:load
function #xylo_library:load


