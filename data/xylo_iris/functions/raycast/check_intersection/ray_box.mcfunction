#> xylo_iris:raycast/check_intersection/ray_box
#
# Converts an axis-aligned bounding box into three faces (the other tree faces are occluded) and tests for ray-plane intersections with any of them
#
# @reads
#   storage xylo_iris:data Box
#       min: float[]
#           The min corner of the box, as three coordinates between 0 and 1
#       max: float[]
#           The max corner of the box, as three coordinates between 0 and 1
# @output
#   Success: 1 if any face of the box is hit, 0 otherwise
#   Result: the distance, in mm, before the first face that is hit
# @private
# @within xylo_iris:raycast/check_intersection/loop

# Decompose the box as three faces
data modify storage xylo_iris:data Faces set value [{Direction: "WEST_EAST"}, {Direction: "UP_DOWN"}, {Direction: "NORTH_SOUTH"}]
data modify storage xylo_iris:data Faces[0] merge from storage xylo_iris:data Box
execute if score $dx xylo_iris matches 0.. run data modify storage xylo_iris:data Faces[0].max[0] set from storage xylo_iris:data Box.min[0]
execute if score $dx xylo_iris matches ..-1 run data modify storage xylo_iris:data Faces[0].min[0] set from storage xylo_iris:data Box.max[0]
data modify storage xylo_iris:data Faces[1] merge from storage xylo_iris:data Box
execute if score $dy xylo_iris matches 0.. run data modify storage xylo_iris:data Faces[1].max[1] set from storage xylo_iris:data Box.min[1]
execute if score $dy xylo_iris matches ..-1 run data modify storage xylo_iris:data Faces[1].min[1] set from storage xylo_iris:data Box.max[1]
data modify storage xylo_iris:data Faces[2] merge from storage xylo_iris:data Box
execute if score $dz xylo_iris matches 0.. run data modify storage xylo_iris:data Faces[2].max[2] set from storage xylo_iris:data Box.min[2]
execute if score $dz xylo_iris matches ..-1 run data modify storage xylo_iris:data Faces[2].min[2] set from storage xylo_iris:data Box.max[2]

# Check for ray-plane intersections
data modify storage xylo_iris:data Face set from storage xylo_iris:data Faces[0]
execute store success score $hits_x_face xylo_iris store result score $to_x_face xylo_iris run function xylo_iris:raycast/check_intersection/ray_plane
execute if score $hits_x_face xylo_iris matches 0 run scoreboard players set $to_x_face xylo_iris 2147483647
execute if score $hits_x_face xylo_iris matches 1 run data modify storage xylo_iris:data TargetPoint set from storage xylo_iris:data Face.Collision

data modify storage xylo_iris:data Face set from storage xylo_iris:data Faces[1]
execute store success score $hits_y_face xylo_iris store result score $to_y_face xylo_iris run function xylo_iris:raycast/check_intersection/ray_plane
execute if score $hits_y_face xylo_iris matches 0 run scoreboard players set $to_y_face xylo_iris 2147483647
execute if score $hits_y_face xylo_iris matches 1 if score $to_y_face xylo_iris < $to_x_face xylo_iris run data modify storage xylo_iris:data TargetPoint set from storage xylo_iris:data Face.Collision

data modify storage xylo_iris:data Face set from storage xylo_iris:data Faces[2]
execute store success score $hits_z_face xylo_iris store result score $to_z_face xylo_iris run function xylo_iris:raycast/check_intersection/ray_plane
execute if score $hits_z_face xylo_iris matches 0 run scoreboard players set $to_z_face xylo_iris 2147483647
execute if score $hits_z_face xylo_iris matches 1 if score $to_z_face xylo_iris < $to_x_face xylo_iris if score $to_z_face xylo_iris < $to_y_face xylo_iris run data modify storage xylo_iris:data TargetPoint set from storage xylo_iris:data Face.Collision

# If no face was hit, fail; otherwise, return the shortest distance to any face that is hit
execute if score $hits_x_face xylo_iris matches 0 if score $hits_y_face xylo_iris matches 0 if score $hits_z_face xylo_iris matches 0 run return fail
scoreboard players operation $to_aabb xylo_iris = $to_x_face xylo_iris
scoreboard players operation $to_aabb xylo_iris < $to_y_face xylo_iris
scoreboard players operation $to_aabb xylo_iris < $to_z_face xylo_iris
return run scoreboard players get $to_aabb xylo_iris
