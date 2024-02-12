#> xylo_projectiles:position_correction/convert/start
# @context: projectile
# @within: any
# @input: "#xproj.position_correction.convert.damage xproj.op" (damage *1000)

# if there is already a correction module, then just use higher damage
execute on passengers if entity @s[tag=xproj.position_correction.with_aoe] run return run scoreboard players operation @s xproj.position_correction.damage > #xproj.position_correction.convert.damage xproj.op

# add module
summon minecraft:item_display ~ ~ ~ {Tags:["xproj.position_correction.auto_kill","xproj.position_correction.auto_correction","xproj.position_correction.convert.new"],Passengers:[{id:"minecraft:area_effect_cloud",Tags:["xproj.position_correction.auto_kill","xproj.position_correction"],Duration:1000000}]}
ride @e[type=minecraft:item_display,distance=..0.01,tag=xproj.position_correction.convert.new,limit=1] mount @s

execute on passengers run scoreboard players operation @s[tag=xproj.position_correction.convert.new] xproj.position_correction.damage = #xproj.position_correction.convert.damage xproj.op

data remove storage xylo_projectiles:op projectile_correction_setup
data modify storage xylo_projectiles:op projectile_correction_setup.shooter set from entity @s Owner
data modify storage xylo_projectiles:op projectile_correction_setup.motion set from entity @s Motion
execute on passengers if entity @s[tag=xproj.position_correction.convert.new] run function xylo_projectiles:position_correction/setup/start

execute on passengers run tag @s remove xproj.position_correction.convert.new

