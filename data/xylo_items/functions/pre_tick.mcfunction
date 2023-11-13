execute if score $xylo_items xvc.load_status matches 0 run return 0

# xitm.wfoas_used
execute as @a store success score @s xitm.wfoas_used run scoreboard players reset @s[scores={xitm.wfoas_used_stat=1..}] xitm.wfoas_used_stat
execute as @a store success score @s xitm.shield_using if entity @s[advancements={xylo_items:item/shield/using=true}]
advancement revoke @a only xylo_items:item/shield/using

