tag @s add xlib.utilities.un_agro.mob
scoreboard players operation @s xlib.utilities.un_agro.reset_time = #xlib.time xlib.op
scoreboard players add @s xlib.utilities.un_agro.reset_time 4
attribute @s minecraft:generic.follow_range modifier add 1234-1234-1234-0000-0001 "xylo_library:utilities.un_agro" -100000 add

schedule function xylo_library:utilities/un_agro/remove 5t append