#> xylo_iris:raycast/check_intersection/loop
#
# Tests for ray-box intersections with all axis-aligned bounding boxes of a hitbox
#
# @reads
#   storage xylo_iris:data Shape
#       A list of axis-aligned bounding boxes of the form {min: [x, y, z], max: [x, y, z]}
# @output
#   Success: 1 if a box is hit, 0 otherwise
#   Result: the distance to the first box that is hit
# @private
# @within xylo_iris:raycast/test_for_block
# @within xylo_iris:raycast/test_for_entity
# @within xylo_iris:raycast/check_intersection/loop

# Test for intersection with a single bounding box
data modify storage xylo_iris:data Box set from storage xylo_iris:data Shape[-1]
data remove storage xylo_iris:data Shape[-1]
execute store success score $is_hit xylo_iris store result score $distance xylo_iris run function xylo_iris:raycast/check_intersection/ray_box

# If this box is indeed hit before any other this far, remember the targeted box and the targeted face
execute if score $is_hit xylo_iris matches 1 if score $distance xylo_iris >= $min_distance xylo_iris run scoreboard players set $is_hit xylo_iris 0
execute if score $is_hit xylo_iris matches 1 run data modify storage xylo_iris:data TargetedBox set from storage xylo_iris:data Box
execute if score $is_hit xylo_iris matches 1 if score $hits_x_face xylo_iris matches 1 if score $to_aabb xylo_iris = $to_x_face xylo_iris run data modify storage xylo_iris:data TargetedFace set from storage xylo_iris:data Faces[0]
execute if score $is_hit xylo_iris matches 1 if score $hits_y_face xylo_iris matches 1 if score $to_aabb xylo_iris = $to_y_face xylo_iris run data modify storage xylo_iris:data TargetedFace set from storage xylo_iris:data Faces[1]
execute if score $is_hit xylo_iris matches 1 if score $hits_z_face xylo_iris matches 1 if score $to_aabb xylo_iris = $to_z_face xylo_iris run data modify storage xylo_iris:data TargetedFace set from storage xylo_iris:data Faces[2]
execute if score $is_hit xylo_iris matches 1 run scoreboard players operation $min_distance xylo_iris = $distance xylo_iris

# Loop this function until all boxes have been analyzed
execute if data storage xylo_iris:data Shape[-1] run return run function xylo_iris:raycast/check_intersection/loop
execute if score $min_distance xylo_iris matches 2147483647 run return fail
scoreboard players operation $min_distance xylo_iris *= $1000 xylo_iris
return run scoreboard players get $min_distance xylo_iris
