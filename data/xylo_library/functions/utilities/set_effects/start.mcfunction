# <@> player
# in: "xylo_library:op set_effects_in"

execute at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["xlib.utilities.set_effect_new"],Age:-1,WaitTime:-1,Radius:0.0f,Duration:2,RadiusOnUse:-1f}
data modify storage xylo_library:op utilities_set_effects set value {Tags:["smithed.entity","smithed.strict"]}
data modify storage xylo_library:op utilities_set_effects.effects set from storage xylo_library:op set_effects_in
execute at @s run data modify entity @e[type=minecraft:area_effect_cloud,limit=1,distance=..0.001,tag=xlib.utilities.set_effect_new] {} merge from storage xylo_library:op utilities_set_effects 

