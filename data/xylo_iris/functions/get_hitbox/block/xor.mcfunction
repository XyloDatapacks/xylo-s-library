#> xylo_iris:get_hitbox/block/xor
#
# Compute bitwise XOR (^) on two scores
#
# @private
# @within xylo_iris:get_hitbox/block/offset
# @reads
#   score $a xylo_iris
#       The first operand
#   score $b xylo_iris
#       The second operand
# @output
#   Return: The result of the XOR operation on both operands
#   Success: 1

scoreboard players operation $a^b xylo_iris = $a xylo_iris
scoreboard players operation $a^b xylo_iris += $b xylo_iris

# Compute a&b
scoreboard players set $a&b xylo_iris 0
execute if score $a xylo_iris matches ..-1 if score $b xylo_iris matches ..-1 run scoreboard players set $a&b xylo_iris -2147483648
scoreboard players operation $a xylo_iris += $a xylo_iris
scoreboard players operation $b xylo_iris += $b xylo_iris
execute if score $a xylo_iris matches ..-1 if score $b xylo_iris matches ..-1 run scoreboard players add $a&b xylo_iris 1073741824
scoreboard players operation $a xylo_iris += $a xylo_iris
scoreboard players operation $b xylo_iris += $b xylo_iris
execute if score $a xylo_iris matches ..-1 if score $b xylo_iris matches ..-1 run scoreboard players add $a&b xylo_iris 536870912
scoreboard players operation $a xylo_iris += $a xylo_iris
scoreboard players operation $b xylo_iris += $b xylo_iris
execute if score $a xylo_iris matches ..-1 if score $b xylo_iris matches ..-1 run scoreboard players add $a&b xylo_iris 268435456
scoreboard players operation $a xylo_iris += $a xylo_iris
scoreboard players operation $b xylo_iris += $b xylo_iris
execute if score $a xylo_iris matches ..-1 if score $b xylo_iris matches ..-1 run scoreboard players add $a&b xylo_iris 134217728
scoreboard players operation $a xylo_iris += $a xylo_iris
scoreboard players operation $b xylo_iris += $b xylo_iris
execute if score $a xylo_iris matches ..-1 if score $b xylo_iris matches ..-1 run scoreboard players add $a&b xylo_iris 67108864
scoreboard players operation $a xylo_iris += $a xylo_iris
scoreboard players operation $b xylo_iris += $b xylo_iris
execute if score $a xylo_iris matches ..-1 if score $b xylo_iris matches ..-1 run scoreboard players add $a&b xylo_iris 33554432
scoreboard players operation $a xylo_iris += $a xylo_iris
scoreboard players operation $b xylo_iris += $b xylo_iris
execute if score $a xylo_iris matches ..-1 if score $b xylo_iris matches ..-1 run scoreboard players add $a&b xylo_iris 16777216
scoreboard players operation $a xylo_iris += $a xylo_iris
scoreboard players operation $b xylo_iris += $b xylo_iris
execute if score $a xylo_iris matches ..-1 if score $b xylo_iris matches ..-1 run scoreboard players add $a&b xylo_iris 8388608
scoreboard players operation $a xylo_iris += $a xylo_iris
scoreboard players operation $b xylo_iris += $b xylo_iris
execute if score $a xylo_iris matches ..-1 if score $b xylo_iris matches ..-1 run scoreboard players add $a&b xylo_iris 4194304
scoreboard players operation $a xylo_iris += $a xylo_iris
scoreboard players operation $b xylo_iris += $b xylo_iris
execute if score $a xylo_iris matches ..-1 if score $b xylo_iris matches ..-1 run scoreboard players add $a&b xylo_iris 2097152
scoreboard players operation $a xylo_iris += $a xylo_iris
scoreboard players operation $b xylo_iris += $b xylo_iris
execute if score $a xylo_iris matches ..-1 if score $b xylo_iris matches ..-1 run scoreboard players add $a&b xylo_iris 1048576
scoreboard players operation $a xylo_iris += $a xylo_iris
scoreboard players operation $b xylo_iris += $b xylo_iris
execute if score $a xylo_iris matches ..-1 if score $b xylo_iris matches ..-1 run scoreboard players add $a&b xylo_iris 524288
scoreboard players operation $a xylo_iris += $a xylo_iris
scoreboard players operation $b xylo_iris += $b xylo_iris
execute if score $a xylo_iris matches ..-1 if score $b xylo_iris matches ..-1 run scoreboard players add $a&b xylo_iris 262144
scoreboard players operation $a xylo_iris += $a xylo_iris
scoreboard players operation $b xylo_iris += $b xylo_iris
execute if score $a xylo_iris matches ..-1 if score $b xylo_iris matches ..-1 run scoreboard players add $a&b xylo_iris 131072
scoreboard players operation $a xylo_iris += $a xylo_iris
scoreboard players operation $b xylo_iris += $b xylo_iris
execute if score $a xylo_iris matches ..-1 if score $b xylo_iris matches ..-1 run scoreboard players add $a&b xylo_iris 65536
scoreboard players operation $a xylo_iris += $a xylo_iris
scoreboard players operation $b xylo_iris += $b xylo_iris
execute if score $a xylo_iris matches ..-1 if score $b xylo_iris matches ..-1 run scoreboard players add $a&b xylo_iris 32768
scoreboard players operation $a xylo_iris += $a xylo_iris
scoreboard players operation $b xylo_iris += $b xylo_iris
execute if score $a xylo_iris matches ..-1 if score $b xylo_iris matches ..-1 run scoreboard players add $a&b xylo_iris 16384
scoreboard players operation $a xylo_iris += $a xylo_iris
scoreboard players operation $b xylo_iris += $b xylo_iris
execute if score $a xylo_iris matches ..-1 if score $b xylo_iris matches ..-1 run scoreboard players add $a&b xylo_iris 8192
scoreboard players operation $a xylo_iris += $a xylo_iris
scoreboard players operation $b xylo_iris += $b xylo_iris
execute if score $a xylo_iris matches ..-1 if score $b xylo_iris matches ..-1 run scoreboard players add $a&b xylo_iris 4096
scoreboard players operation $a xylo_iris += $a xylo_iris
scoreboard players operation $b xylo_iris += $b xylo_iris
execute if score $a xylo_iris matches ..-1 if score $b xylo_iris matches ..-1 run scoreboard players add $a&b xylo_iris 2048
scoreboard players operation $a xylo_iris += $a xylo_iris
scoreboard players operation $b xylo_iris += $b xylo_iris
execute if score $a xylo_iris matches ..-1 if score $b xylo_iris matches ..-1 run scoreboard players add $a&b xylo_iris 1024
scoreboard players operation $a xylo_iris += $a xylo_iris
scoreboard players operation $b xylo_iris += $b xylo_iris
execute if score $a xylo_iris matches ..-1 if score $b xylo_iris matches ..-1 run scoreboard players add $a&b xylo_iris 512
scoreboard players operation $a xylo_iris += $a xylo_iris
scoreboard players operation $b xylo_iris += $b xylo_iris
execute if score $a xylo_iris matches ..-1 if score $b xylo_iris matches ..-1 run scoreboard players add $a&b xylo_iris 256
scoreboard players operation $a xylo_iris += $a xylo_iris
scoreboard players operation $b xylo_iris += $b xylo_iris
execute if score $a xylo_iris matches ..-1 if score $b xylo_iris matches ..-1 run scoreboard players add $a&b xylo_iris 128
scoreboard players operation $a xylo_iris += $a xylo_iris
scoreboard players operation $b xylo_iris += $b xylo_iris
execute if score $a xylo_iris matches ..-1 if score $b xylo_iris matches ..-1 run scoreboard players add $a&b xylo_iris 64
scoreboard players operation $a xylo_iris += $a xylo_iris
scoreboard players operation $b xylo_iris += $b xylo_iris
execute if score $a xylo_iris matches ..-1 if score $b xylo_iris matches ..-1 run scoreboard players add $a&b xylo_iris 32
scoreboard players operation $a xylo_iris += $a xylo_iris
scoreboard players operation $b xylo_iris += $b xylo_iris
execute if score $a xylo_iris matches ..-1 if score $b xylo_iris matches ..-1 run scoreboard players add $a&b xylo_iris 16
scoreboard players operation $a xylo_iris += $a xylo_iris
scoreboard players operation $b xylo_iris += $b xylo_iris
execute if score $a xylo_iris matches ..-1 if score $b xylo_iris matches ..-1 run scoreboard players add $a&b xylo_iris 8
scoreboard players operation $a xylo_iris += $a xylo_iris
scoreboard players operation $b xylo_iris += $b xylo_iris
execute if score $a xylo_iris matches ..-1 if score $b xylo_iris matches ..-1 run scoreboard players add $a&b xylo_iris 4
scoreboard players operation $a xylo_iris += $a xylo_iris
scoreboard players operation $b xylo_iris += $b xylo_iris
execute if score $a xylo_iris matches ..-1 if score $b xylo_iris matches ..-1 run scoreboard players add $a&b xylo_iris 2
scoreboard players operation $a xylo_iris += $a xylo_iris
scoreboard players operation $b xylo_iris += $b xylo_iris
execute if score $a xylo_iris matches ..-1 if score $b xylo_iris matches ..-1 run scoreboard players add $a&b xylo_iris 1

# Compute a^b = a+b-2(a&b)
scoreboard players operation $a^b xylo_iris -= $a&b xylo_iris
scoreboard players operation $a^b xylo_iris -= $a&b xylo_iris

# Return the result
return run scoreboard players get $a^b xylo_iris
