#> xylo_iris:raycast/find_next_block_aux
#
# Auxiliary command for running macros from find_next_block
# Note: because there are only three possible input value combinations, they should all be cached and so the overhead from runtime compilation of macro lines should be minimal
#
# @input
#   a: The axis along which we are moving (for example, if the ray moves one tile up, this is 'y'). One of 'x', 'y', or 'z'.
#   b: Another axis. One of 'x', 'y', or 'z'.
#   c: The third axis. One of 'x', 'y', or 'z'.

$scoreboard players operation $to_next_block xylo_iris = $to_next_$(a) xylo_iris

# Find the exact position of the ray when it leaves the current tile
$execute if score $d$(a) xylo_iris matches 0.. run scoreboard players add $[$(a)] xylo_iris 1
$execute if score $d$(a) xylo_iris matches 0.. run scoreboard players set ${$(a)} xylo_iris 0
$execute if score $d$(a) xylo_iris matches ..-1 run scoreboard players remove $[$(a)] xylo_iris 1
$execute if score $d$(a) xylo_iris matches ..-1 run scoreboard players set ${$(a)} xylo_iris 1000000

# Calculate new position on the second axis
scoreboard players operation $delta xylo_iris = $to_next_block xylo_iris
$scoreboard players operation $delta xylo_iris *= $d$(b) xylo_iris
scoreboard players operation $delta xylo_iris /= $1000 xylo_iris
$scoreboard players operation ${$(b)} xylo_iris += $delta xylo_iris

# Calculate new position on the third axis
scoreboard players operation $delta xylo_iris = $to_next_block xylo_iris
$scoreboard players operation $delta xylo_iris *= $d$(c) xylo_iris
scoreboard players operation $delta xylo_iris /= $1000 xylo_iris
$scoreboard players operation ${$(c)} xylo_iris += $delta xylo_iris
