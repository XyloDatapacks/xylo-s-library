## AUTHOR : Picarrow

execute if entity @s[type=!#xylo_library:non_mob] run function xylo_library:internal/hit_detection/id/assign
tag @s[tag=!xlib.internal.hit_detection.no_id,predicate=xylo_library:internal/hit_detection/has_no_id] add xlib.internal.hit_detection.no_id
