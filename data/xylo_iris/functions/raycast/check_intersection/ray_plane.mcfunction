#> xylo_iris:raycast/check_intersection/ray_plane
#
# Tests for ray-plane intersections with a face
#
# @reads
#   storage xylo_iris:data Face: compound
#       Direction: string
#           The axis that is perpendicular to this face
#           One of WEST_EAST, UP_DOWN, NORTH_SOUTH
#       min: float[]
#       max: float[]
# @output
#   Success: 1 if the face is hit, 0 otherwise
#   Result: the distance, in mm, before the face is hit
# @private
# @within xylo_iris:raycast/check_intersection/ray_box

# Save face coordinates
execute store result score $x0 xylo_iris run data get storage xylo_iris:data Face.min[0] 1000000
execute store result score $y0 xylo_iris run data get storage xylo_iris:data Face.min[1] 1000000
execute store result score $z0 xylo_iris run data get storage xylo_iris:data Face.min[2] 1000000
execute store result score $x1 xylo_iris run data get storage xylo_iris:data Face.max[0] 1000000
execute store result score $y1 xylo_iris run data get storage xylo_iris:data Face.max[1] 1000000
execute store result score $z1 xylo_iris run data get storage xylo_iris:data Face.max[2] 1000000

# Get distance (in mm) to the plane, i.e. how long the ray should extend before it hits the plane
# This value should be at most sqrt(3)*1000; if it's more than 2000, we fail (otherwise we risk overflow errors)
execute if data storage xylo_iris:data {Face: {Direction: "WEST_EAST"}} run scoreboard players operation $distance xylo_iris = $x0 xylo_iris
execute if data storage xylo_iris:data {Face: {Direction: "WEST_EAST"}} run scoreboard players operation $distance xylo_iris -= ${x} xylo_iris
execute if data storage xylo_iris:data {Face: {Direction: "UP_DOWN"}} run scoreboard players operation $distance xylo_iris = $y0 xylo_iris
execute if data storage xylo_iris:data {Face: {Direction: "UP_DOWN"}} run scoreboard players operation $distance xylo_iris -= ${y} xylo_iris
execute if data storage xylo_iris:data {Face: {Direction: "NORTH_SOUTH"}} run scoreboard players operation $distance xylo_iris = $z0 xylo_iris
execute if data storage xylo_iris:data {Face: {Direction: "NORTH_SOUTH"}} run scoreboard players operation $distance xylo_iris -= ${z} xylo_iris
scoreboard players operation $distance xylo_iris *= $1000 xylo_iris
execute if data storage xylo_iris:data {Face: {Direction: "WEST_EAST"}} run scoreboard players operation $distance xylo_iris /= $dx xylo_iris
execute if data storage xylo_iris:data {Face: {Direction: "UP_DOWN"}} run scoreboard players operation $distance xylo_iris /= $dy xylo_iris
execute if data storage xylo_iris:data {Face: {Direction: "NORTH_SOUTH"}} run scoreboard players operation $distance xylo_iris /= $dz xylo_iris
execute if score $distance xylo_iris matches ..-1 run return fail
execute if score $distance xylo_iris matches 2000.. run return fail

# Get x position of the ray/plane intersection
scoreboard players operation $x_intersection xylo_iris = $distance xylo_iris
scoreboard players operation $x_intersection xylo_iris *= $dx xylo_iris
scoreboard players operation $x_intersection xylo_iris /= $1000 xylo_iris
scoreboard players operation $x_intersection xylo_iris += ${x} xylo_iris
execute if data storage xylo_iris:data {Face: {Direction: "WEST_EAST"}} run scoreboard players operation $x_intersection xylo_iris = $x0 xylo_iris

# Get y position of the ray/plane intersection
scoreboard players operation $y_intersection xylo_iris = $distance xylo_iris
scoreboard players operation $y_intersection xylo_iris *= $dy xylo_iris
scoreboard players operation $y_intersection xylo_iris /= $1000 xylo_iris
scoreboard players operation $y_intersection xylo_iris += ${y} xylo_iris
execute if data storage xylo_iris:data {Face: {Direction: "UP_DOWN"}} run scoreboard players operation $y_intersection xylo_iris = $y0 xylo_iris

# Get z position of the ray/plane intersection
scoreboard players operation $z_intersection xylo_iris = $distance xylo_iris
scoreboard players operation $z_intersection xylo_iris *= $dz xylo_iris
scoreboard players operation $z_intersection xylo_iris /= $1000 xylo_iris
scoreboard players operation $z_intersection xylo_iris += ${z} xylo_iris
execute if data storage xylo_iris:data {Face: {Direction: "NORTH_SOUTH"}} run scoreboard players operation $z_intersection xylo_iris = $z0 xylo_iris

# Save the position of the intersection
data modify storage xylo_iris:data Face.Collision set value [0.0d, 0.0d, 0.0d]
execute store result storage xylo_iris:data Face.Collision[0] double 0.000001 run scoreboard players get $x_intersection xylo_iris
execute store result storage xylo_iris:data Face.Collision[1] double 0.000001 run scoreboard players get $y_intersection xylo_iris
execute store result storage xylo_iris:data Face.Collision[2] double 0.000001 run scoreboard players get $z_intersection xylo_iris

# See if that intersection falls within the face
execute if score $x_intersection xylo_iris >= $x0 xylo_iris if score $x_intersection xylo_iris <= $x1 xylo_iris \
        if score $y_intersection xylo_iris >= $y0 xylo_iris if score $y_intersection xylo_iris <= $y1 xylo_iris \
        if score $z_intersection xylo_iris >= $z0 xylo_iris if score $z_intersection xylo_iris <= $z1 xylo_iris \
        run return run scoreboard players get $distance xylo_iris

return fail
