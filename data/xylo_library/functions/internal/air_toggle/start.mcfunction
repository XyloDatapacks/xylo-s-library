tag @s remove xlib.internal.air_toggle
scoreboard players reset @s xlib.internal.air_toggle

execute store result entity @s Air short -1 run data get entity @s Air
