data modify entity @s Rotation set from storage xylo_library:op SetRotation
execute at @s run tp @s ^ ^ ^1
data modify storage xylo_library:op Vector set from entity @s Pos
tp @s ~ ~ ~