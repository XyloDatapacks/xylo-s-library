execute if score xproj.position_correction.max_distance xproj.op matches 1.. positioned ^ ^ ^0.02 unless block ~ ~ ~ #xylo_library:no_hitbox run function xylo_projectiles:position_correction/correct/get_position
execute if score xproj.position_correction.max_distance xproj.op matches 1.. positioned ^ ^ ^0.04 unless block ~ ~ ~ #xylo_library:no_hitbox run function xylo_projectiles:position_correction/correct/get_position
execute if score xproj.position_correction.max_distance xproj.op matches 1.. positioned ^ ^ ^0.06 unless block ~ ~ ~ #xylo_library:no_hitbox run function xylo_projectiles:position_correction/correct/get_position
execute if score xproj.position_correction.max_distance xproj.op matches 1.. positioned ^ ^ ^0.08 unless block ~ ~ ~ #xylo_library:no_hitbox run function xylo_projectiles:position_correction/correct/get_position
execute unless score xproj.position_correction.max_distance xproj.op matches 1.. run return 1

execute positioned ~-0.35 ~-0.35 ~-0.35 as @e[type=!#xylo_library:non_mob,dy=0,tag=!xproj.position_correction.correct.shooter,tag=!smithed.block,tag=!xlib.non_interactive] positioned ~-0.3 ~-0.3 ~-0.3 if entity @s[dy=0] positioned ~0.65 ~0.65 ~0.65 run function xylo_projectiles:position_correction/correct/get_position_and_uuid
execute unless score xproj.position_correction.max_distance xproj.op matches 1.. run return 1

scoreboard players remove xproj.position_correction.max_distance xproj.op 100
execute unless score xproj.position_correction.max_distance xproj.op matches 1.. run scoreboard players set xproj.position_correction.max_distance xproj.op -1
execute if score xproj.position_correction.max_distance xproj.op matches 1.. positioned ^ ^ ^0.1 run function xylo_projectiles:position_correction/correct/loop