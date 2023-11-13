scoreboard players operation $shortest_distance xylo_retina.__variable__ = $distance_X xylo_retina.__variable__
scoreboard players operation $shortest_distance xylo_retina.__variable__ < $distance_Y xylo_retina.__variable__
scoreboard players operation $shortest_distance xylo_retina.__variable__ < $distance_Z xylo_retina.__variable__
execute if score $shortest_distance xylo_retina.__variable__ = $distance_Z xylo_retina.__variable__ run scoreboard players set $nearest_axis xylo_retina.__variable__ 2
execute if score $shortest_distance xylo_retina.__variable__ = $distance_Y xylo_retina.__variable__ run scoreboard players set $nearest_axis xylo_retina.__variable__ 1
execute if score $shortest_distance xylo_retina.__variable__ = $distance_X xylo_retina.__variable__ run scoreboard players set $nearest_axis xylo_retina.__variable__ 0
scoreboard players operation $prev_X xylo_retina.__variable__ = $int_X xylo_retina.__variable__
scoreboard players operation $prev_Y xylo_retina.__variable__ = $int_Y xylo_retina.__variable__
scoreboard players operation $prev_Z xylo_retina.__variable__ = $int_Z xylo_retina.__variable__
execute if score $debug_messages xylo_retina.__variable__ matches 2 run particle crit
execute if score $nearest_axis xylo_retina.__variable__ matches 0 if score $step xylo_retina.__variable__ < $max_depth xylo_retina.__variable__ if score $hit_block xylo_retina.__variable__ matches 0 if score $hit_entity xylo_retina.__variable__ matches 0 run function xylo_retina:traverse/x
execute if score $nearest_axis xylo_retina.__variable__ matches 1 if score $step xylo_retina.__variable__ < $max_depth xylo_retina.__variable__ if score $hit_block xylo_retina.__variable__ matches 0 if score $hit_entity xylo_retina.__variable__ matches 0 run function xylo_retina:traverse/y
execute if score $nearest_axis xylo_retina.__variable__ matches 2 if score $step xylo_retina.__variable__ < $max_depth xylo_retina.__variable__ if score $hit_block xylo_retina.__variable__ matches 0 if score $hit_entity xylo_retina.__variable__ matches 0 run function xylo_retina:traverse/z