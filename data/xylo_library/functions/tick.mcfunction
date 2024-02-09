execute if score $xylo_library xvc.load_status matches 0 run return 0

# global time
scoreboard players add #xlib.time xlib.op 1

# timers
scoreboard players operation #xlib.timer.2tick xlib.op = #xlib.time xlib.op
scoreboard players operation #xlib.timer.2tick xlib.op %= #2 xconst

scoreboard players operation #xlib.timer.4tick xlib.op = #xlib.time xlib.op
scoreboard players operation #xlib.timer.4tick xlib.op %= #4 xconst

scoreboard players operation #xlib.timer.5tick xlib.op = #xlib.time xlib.op
scoreboard players operation #xlib.timer.5tick xlib.op %= #5 xconst

scoreboard players operation #xlib.timer.10tick xlib.op = #xlib.time xlib.op
scoreboard players operation #xlib.timer.10tick xlib.op %= #10 xconst

scoreboard players operation #xlib.timer.1sec xlib.op = #xlib.time xlib.op
scoreboard players operation #xlib.timer.1sec xlib.op %= #20 xconst

scoreboard players operation #xlib.timer.2sec xlib.op = #xlib.time xlib.op
scoreboard players operation #xlib.timer.2sec xlib.op %= #40 xconst

scoreboard players operation #xlib.timer.3sec xlib.op = #xlib.time xlib.op
scoreboard players operation #xlib.timer.3sec xlib.op %= #60 xconst

scoreboard players operation #xlib.timer.4sec xlib.op = #xlib.time xlib.op
scoreboard players operation #xlib.timer.4sec xlib.op %= #80 xconst

scoreboard players operation #xlib.timer.5sec xlib.op = #xlib.time xlib.op
scoreboard players operation #xlib.timer.5sec xlib.op %= #100 xconst

#==<Pre Tick>==#

# check entities exist
function xylo_library:fixed_uuid_entities_summon

# pre tick
function xylo_items:pre_tick

#==<Player Tick>==#
execute as @a run function xylo_library:player_tick

#==<Tick>==#

# internal functions
execute as @e[type=minecraft:marker,tag=xlib.internal.clone] run function xylo_library:internal/clone/tick

# libraries
function xylo_items:tick
function xylo_projectiles:tick
# other packs
function #xylo_library:tick

#==<Post Tick>==#

# pre tick
execute as @a[scores={xlib.internal.gui.priority=0..}] run function xylo_library:internal/gui/post_tick

# kill gui items
kill @e[type=minecraft:item,nbt={Item:{tag:{xylo_library:{kill_if_dropped:1b}}}}]
