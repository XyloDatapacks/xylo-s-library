#> xylo_iris:get_position/get_rotation
#
# Returns the context rotation as a vector
#
# @within xylo_iris:get_position/main
# @context A marker and a rotation

execute positioned 0.0 0.0 0.0 run teleport @s ^ ^ ^1000000
data modify storage xylo_iris:data Pos set from entity @s Pos
execute store result score $dx xylo_iris run data get storage xylo_iris:data Pos[0]
execute store result score $dy xylo_iris run data get storage xylo_iris:data Pos[1]
execute store result score $dz xylo_iris run data get storage xylo_iris:data Pos[2]
