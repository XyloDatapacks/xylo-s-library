execute unless score xproj.position_correction.max_distance xproj.op matches 1.. run return 0
scoreboard players set xproj.position_correction.max_distance xproj.op 0

# get corrected pos
execute summon minecraft:marker run function xylo_projectiles:position_correction/correct/xlm.get_position

# get hit entity uuid (except if blocked)
scoreboard players set xproj.position_correction.hit_entity xproj.op 1
execute if entity @s[type=minecraft:player] facing entity @s[scores={xitm.shield_using=1}] eyes positioned as @s positioned ^ ^ ^1 rotated as @s positioned ^ ^ ^1 if entity @s[distance=..1.35] run scoreboard players set xproj.position_correction.hit_entity xproj.op 0
execute if score xproj.position_correction.hit_entity xproj.op matches 1 run function xylo_library:utilities/uuid/generate
execute if score xproj.position_correction.hit_entity xproj.op matches 1 run data modify storage xylo_projectiles:op entity_hit.uuid set from storage gu:main out
