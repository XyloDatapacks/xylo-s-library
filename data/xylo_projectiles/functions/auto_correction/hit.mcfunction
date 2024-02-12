# correct position
execute if entity @s[tag=xproj.position_correction.with_aoe] run function xylo_projectiles:position_correction/correct/start
execute if entity @s[tag=xproj.position_correction.with_marker] run function xylo_projectiles:position_correction/correct/start_no_origin

# remove tag
tag @s remove xproj.position_correction.auto_correction
