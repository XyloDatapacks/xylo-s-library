#> xylo_iris:get_hitbox/block/offset
#
# Computes seeded block offset for e.g. flowers, assuming the shape comprises a single box
#
# @writes
#	storage xylo_iris:data Shape: compound[]
#       A list of cuboids given by two corners in the format {min: [x, y, z], max: [x, y z]}

# Compute seed(x, y, z)
scoreboard players operation $a xylo_iris = $[x] xylo_iris
scoreboard players operation $a xylo_iris *= $3129871 xylo_iris
scoreboard players operation $b xylo_iris = $[z] xylo_iris
scoreboard players operation $b xylo_iris *= $116129781 xylo_iris
execute store result score $a^b xylo_iris run function xylo_iris:get_hitbox/block/xor

scoreboard players operation $(a^b)² xylo_iris = $a^b xylo_iris
scoreboard players operation $(a^b)² xylo_iris *= $a^b xylo_iris
scoreboard players operation $11*(a^b) xylo_iris = $a^b xylo_iris
scoreboard players operation $11*(a^b) xylo_iris *= $11 xylo_iris

scoreboard players operation $seed xylo_iris = $(a^b)² xylo_iris
scoreboard players operation $seed xylo_iris *= $42317861 xylo_iris
scoreboard players operation $seed xylo_iris += $11*(a^b) xylo_iris
scoreboard players operation $seed xylo_iris /= $65536 xylo_iris

# Compute offsets
scoreboard players operation $x_offset xylo_iris = $seed xylo_iris
scoreboard players operation $x_offset xylo_iris %= $16 xylo_iris
scoreboard players operation $x_offset xylo_iris *= $33333 xylo_iris

scoreboard players operation $z_offset xylo_iris = $seed xylo_iris
scoreboard players operation $z_offset xylo_iris /= $256 xylo_iris
scoreboard players operation $z_offset xylo_iris %= $16 xylo_iris
scoreboard players operation $z_offset xylo_iris *= $33333 xylo_iris

# Adjust/clamp for pointed dripstone blocks
execute if block ~ ~ ~ minecraft:pointed_dripstone run scoreboard players remove $x_offset xylo_iris 125000
execute if block ~ ~ ~ minecraft:pointed_dripstone run scoreboard players remove $z_offset xylo_iris 125000
execute if block ~ ~ ~ minecraft:pointed_dripstone if score $x_offset xylo_iris matches ..0 run scoreboard players set $x_offset xylo_iris 0
execute if block ~ ~ ~ minecraft:pointed_dripstone if score $x_offset xylo_iris matches 250000.. run scoreboard players set $x_offset xylo_iris 250000
execute if block ~ ~ ~ minecraft:pointed_dripstone if score $z_offset xylo_iris matches ..0 run scoreboard players set $z_offset xylo_iris 0
execute if block ~ ~ ~ minecraft:pointed_dripstone if score $z_offset xylo_iris matches 250000.. run scoreboard players set $z_offset xylo_iris 250000

# Apply offsets to the generated shape
execute store result score $min_x xylo_iris run data get storage xylo_iris:data Shape[0].min[0] 1000000
execute store result storage xylo_iris:data Shape[0].min[0] double 0.000001 run scoreboard players operation $min_x xylo_iris += $x_offset xylo_iris
execute store result score $min_z xylo_iris run data get storage xylo_iris:data Shape[0].min[2] 1000000
execute store result storage xylo_iris:data Shape[0].min[2] double 0.000001 run scoreboard players operation $min_z xylo_iris += $z_offset xylo_iris
execute store result score $max_x xylo_iris run data get storage xylo_iris:data Shape[0].max[0] 1000000
execute store result storage xylo_iris:data Shape[0].max[0] double 0.000001 run scoreboard players operation $max_x xylo_iris += $x_offset xylo_iris
execute store result score $max_z xylo_iris run data get storage xylo_iris:data Shape[0].max[2] 1000000
execute store result storage xylo_iris:data Shape[0].max[2] double 0.000001 run scoreboard players operation $max_z xylo_iris += $z_offset xylo_iris
