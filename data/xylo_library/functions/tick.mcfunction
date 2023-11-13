execute if score $xylo_library xvc.load_status matches 0 run return 0

# global time
scoreboard players add #xlib.time xlib.op 1

# timers
scoreboard players operation #xlib.timer.4tick xlib.op = #xlib.time xlib.op
scoreboard players operation #xlib.timer.4tick xlib.op %= #4 xconst

scoreboard players operation #xlib.timer.5tick xlib.op = #xlib.time xlib.op
scoreboard players operation #xlib.timer.5tick xlib.op %= #5 xconst

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

# pre tick
function xylo_items:pre_tick

# tick
execute as @a run function xylo_library:player_tick
function xylo_items:tick
function xylo_projectiles:tick
function #xylo_library:tick

