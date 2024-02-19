## AUTHOR : Picarrow

# Assign IDs to the entities that need them
execute as @e[type=!#xylo_library:non_mob,predicate=xylo_library:internal/hit_detection/has_no_id] run function xylo_library:internal/hit_detection/id/assign_with_filter

# Enforce detection state
execute if score $detection xlib.internal.hit_detection._ matches 0 run function xylo_library:internal/hit_detection/detection/disable
execute if score $detection xlib.internal.hit_detection._ matches 1 run function xylo_library:internal/hit_detection/detection/enable
