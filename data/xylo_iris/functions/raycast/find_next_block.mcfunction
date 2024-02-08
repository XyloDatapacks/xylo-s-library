#> xylo_iris:raycast/find_next_block
#
# Find the coordinates of the next tile that should be traversed by the ray
#
# @private
# @within xylo_iris:raycast/loop
# @writes
#   scores $[x] $[y] $[z] xylo_iris
#       The new position
#   scores $last_[x] $last_[y] $last_[z] xylo_iris
#       The previous position
# @output
#   Result: The distance to the next block
#   Success: 1

# Save previous coordinates
scoreboard players operation $last_[x] xylo_iris = $[x] xylo_iris
scoreboard players operation $last_[y] xylo_iris = $[y] xylo_iris
scoreboard players operation $last_[z] xylo_iris = $[z] xylo_iris

# See what distance the ray needs to travel to hit another tile with a different x coordinate
execute if score $dx xylo_iris matches 0.. run scoreboard players set $to_next_x xylo_iris 1000000000
execute if score $dx xylo_iris matches ..-1 run scoreboard players set $to_next_x xylo_iris 0
scoreboard players operation ${x}*1000 xylo_iris = ${x} xylo_iris
scoreboard players operation ${x}*1000 xylo_iris *= $1000 xylo_iris
scoreboard players operation $to_next_x xylo_iris -= ${x}*1000 xylo_iris
scoreboard players operation $to_next_x xylo_iris /= $dx xylo_iris

# See what distance the ray needs to travel to hit another tile with a different y coordinate
execute if score $dy xylo_iris matches 0.. run scoreboard players set $to_next_y xylo_iris 1000000000
execute if score $dy xylo_iris matches ..-1 run scoreboard players set $to_next_y xylo_iris 0
scoreboard players operation ${y}*1000 xylo_iris = ${y} xylo_iris
scoreboard players operation ${y}*1000 xylo_iris *= $1000 xylo_iris
scoreboard players operation $to_next_y xylo_iris -= ${y}*1000 xylo_iris
scoreboard players operation $to_next_y xylo_iris /= $dy xylo_iris

# See what distance the ray needs to travel to hit another tile with a different z coordinate
execute if score $dz xylo_iris matches 0.. run scoreboard players set $to_next_z xylo_iris 1000000000
execute if score $dz xylo_iris matches ..-1 run scoreboard players set $to_next_z xylo_iris 0
scoreboard players operation ${z}*1000 xylo_iris = ${z} xylo_iris
scoreboard players operation ${z}*1000 xylo_iris *= $1000 xylo_iris
scoreboard players operation $to_next_z xylo_iris -= ${z}*1000 xylo_iris
scoreboard players operation $to_next_z xylo_iris /= $dz xylo_iris

# Determine which distance is the shortest
execute if score $to_next_x xylo_iris <= $to_next_y xylo_iris if score $to_next_x xylo_iris <= $to_next_z xylo_iris run data merge storage xylo_iris:data {NextCoordinateChange: "x"}
execute if score $to_next_y xylo_iris <= $to_next_x xylo_iris if score $to_next_y xylo_iris <= $to_next_z xylo_iris run data merge storage xylo_iris:data {NextCoordinateChange: "y"}
execute if score $to_next_z xylo_iris <= $to_next_x xylo_iris if score $to_next_z xylo_iris <= $to_next_y xylo_iris run data merge storage xylo_iris:data {NextCoordinateChange: "z"}

# Calculate the new coordinates when the ray reaches the next tile
execute if data storage xylo_iris:data {NextCoordinateChange: "x"} run data modify storage xylo_iris:args {} merge value {a: "x", b: "y", c: "z"}
execute if data storage xylo_iris:data {NextCoordinateChange: "y"} run data modify storage xylo_iris:args {} merge value {a: "y", b: "z", c: "x"}
execute if data storage xylo_iris:data {NextCoordinateChange: "z"} run data modify storage xylo_iris:args {} merge value {a: "z", b: "x", c: "y"}
function xylo_iris:raycast/macro_functions/find_next_block_aux with storage xylo_iris:args

# Return the added distance
return run scoreboard players operation $to_next_block xylo_iris *= $1000 xylo_iris
