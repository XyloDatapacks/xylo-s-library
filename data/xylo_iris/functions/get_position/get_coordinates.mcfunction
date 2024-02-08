#> xylo_iris:get_position/get_coordinates
#
# Gets the coordinates of the executing entity
#
# @context A marker
# @within xylo_iris:get_position/main
# @within xylo_iris:get_hitbox/entity

# Get integer coordinates
data modify storage xylo_iris:data Pos set from entity @s Pos
execute store result score $[x] xylo_iris store result storage xylo_iris:args x int -1 run data get storage xylo_iris:data Pos[0]
execute store result score $[y] xylo_iris store result storage xylo_iris:args y int -1 run data get storage xylo_iris:data Pos[1]
execute store result score $[z] xylo_iris store result storage xylo_iris:args z int -1 run data get storage xylo_iris:data Pos[2]

# Get fractional coordinates
function xylo_iris:get_position/teleport with storage xylo_iris:args
data modify storage xylo_iris:data Pos set from entity @s Pos
execute store result score ${x} xylo_iris run data get storage xylo_iris:data Pos[0] 1000000
execute store result score ${y} xylo_iris run data get storage xylo_iris:data Pos[1] 1000000
execute store result score ${z} xylo_iris run data get storage xylo_iris:data Pos[2] 1000000

# Clean up
data remove storage xylo_iris:data Pos
kill @s
