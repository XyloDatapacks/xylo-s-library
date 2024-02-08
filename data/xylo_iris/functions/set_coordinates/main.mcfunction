#> xylo_iris:set_coordinates
#
# Teleports the executing entity at a given position from six scores.
# Meant to be executed as the ray marker after raycasting, scores are then set to the player's targeted position:
#    execute as @p at @s anchored eyes positioned ^ ^ ^ run function xylo_iris:get_target
#    execute as @e[type=minecraft:marker, tag=xylo_iris.ray] run function xylo_iris:set_coordinates
#
# @public
# @context any entity
# @input
#   score $[x] xylo_iris
#       The integer value of the new X position
#   score ${x} xylo_iris
#       The fractional value of the new X position, as a number between 0 and 1000000

execute unless entity @s run return fail

# Clamp to 0..999999
execute if score ${x} xylo_iris matches ..0 run scoreboard players set ${x} xylo_iris 0
execute if score ${y} xylo_iris matches ..0 run scoreboard players set ${y} xylo_iris 0
execute if score ${z} xylo_iris matches ..0 run scoreboard players set ${z} xylo_iris 0
execute if score ${x} xylo_iris matches 1000000.. run scoreboard players set ${x} xylo_iris 999999
execute if score ${y} xylo_iris matches 1000000.. run scoreboard players set ${y} xylo_iris 999999
execute if score ${z} xylo_iris matches 1000000.. run scoreboard players set ${z} xylo_iris 999999

# Get integer coordinates for the first teleport command (absolute coordinates)
execute store result storage xylo_iris:args x int 1 run scoreboard players get $[x] xylo_iris
execute store result storage xylo_iris:args y int 1 run scoreboard players get $[y] xylo_iris
execute store result storage xylo_iris:args z int 1 run scoreboard players get $[z] xylo_iris

# Get fractional coordinates for the second teleport command (relative coordinates)
execute store result storage xylo_iris:args value int 1 run scoreboard players get ${x} xylo_iris
function xylo_iris:set_coordinates/pad_with_zeros with storage xylo_iris:args
data modify storage xylo_iris:args dx set string storage xylo_iris:data String -6

execute store result storage xylo_iris:args value int 1 run scoreboard players get ${y} xylo_iris
function xylo_iris:set_coordinates/pad_with_zeros with storage xylo_iris:args
data modify storage xylo_iris:args dy set string storage xylo_iris:data String -6

execute store result storage xylo_iris:args value int 1 run scoreboard players get ${z} xylo_iris
function xylo_iris:set_coordinates/pad_with_zeros with storage xylo_iris:args
data modify storage xylo_iris:args dz set string storage xylo_iris:data String -6

# Generate the two teleport commands
function xylo_iris:set_coordinates/teleport with storage xylo_iris:args
