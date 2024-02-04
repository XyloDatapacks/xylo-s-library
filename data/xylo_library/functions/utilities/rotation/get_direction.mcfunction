# <@> 545ec994-ae69-485d-9604-981ce1612a99

data modify entity @s Rotation set from storage xylo_library:op SetRotation
execute rotated as @s run tp @s ^ ^ ^1
data modify storage xylo_library:op Vector set from entity @s Pos
tp @s 29999999.0 0 12341232.0
