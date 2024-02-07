#> xylo_iris:raycast/loop
#
# Loops forward until an obstacle is hit or until the maximum recursion depth has been reached
#
# @context a marker and the current ray position
# @within xylo_iris:get_target
# @within xylo_iris:raycast/loop

# Test for collisions
execute store success score $block_hit xylo_iris store result score $block_distance xylo_iris run function xylo_iris:raycast/test_for_block
execute store success score $entity_hit xylo_iris store result score $entity_distance xylo_iris run function xylo_iris:raycast/test_for_entity
execute if score $block_hit xylo_iris matches 1 run return run function xylo_iris:raycast/on_hit
execute if score $entity_hit xylo_iris matches 1 run return run function xylo_iris:raycast/on_hit

# Proceed to the next block
execute store result score $to_next_block xylo_iris run function xylo_iris:raycast/find_next_block
scoreboard players operation $total_distance xylo_iris += $to_next_block xylo_iris

# Fail if the maximum recursion depth is reached and nothing was found
scoreboard players add $depth xylo_iris 1
execute if score $depth xylo_iris = $max_depth xylo_iris run tag @s remove xylo_iris.executing
execute if score $depth xylo_iris = $max_depth xylo_iris run return fail
execute if score $total_distance xylo_iris > $max_distance xylo_iris run tag @s remove xylo_iris.executing
execute if score $total_distance xylo_iris > $max_distance xylo_iris run return fail

# Otherwise, loop this function at the next block
execute if data storage xylo_iris:data {NextCoordinateChange: "x"} if score $dx xylo_iris matches 0.. positioned ~1 ~ ~ run return run function xylo_iris:raycast/loop
execute if data storage xylo_iris:data {NextCoordinateChange: "x"} if score $dx xylo_iris matches ..-1 positioned ~-1 ~ ~ run return run function xylo_iris:raycast/loop
execute if data storage xylo_iris:data {NextCoordinateChange: "y"} if score $dy xylo_iris matches 0.. positioned ~ ~1 ~ run return run function xylo_iris:raycast/loop
execute if data storage xylo_iris:data {NextCoordinateChange: "y"} if score $dy xylo_iris matches ..-1 positioned ~ ~-1 ~ run return run function xylo_iris:raycast/loop
execute if data storage xylo_iris:data {NextCoordinateChange: "z"} if score $dz xylo_iris matches 0.. positioned ~ ~ ~1 run return run function xylo_iris:raycast/loop
execute if data storage xylo_iris:data {NextCoordinateChange: "z"} if score $dz xylo_iris matches ..-1 positioned ~ ~ ~-1 run return run function xylo_iris:raycast/loop
execute if score $depth xylo_iris < $max_depth xylo_iris if score $total_distance xylo_iris < $max_distance xylo_iris at @s run return run function xylo_iris:raycast/loop
