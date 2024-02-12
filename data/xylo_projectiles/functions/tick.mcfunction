execute if score $xylo_projectiles xvc.load_status matches 0 run return 0
#------------------------

# auto correction
execute as @e[type=minecraft:item_display,tag=xproj.position_correction.auto_correction] at @s run function xylo_projectiles:auto_correction/tick

