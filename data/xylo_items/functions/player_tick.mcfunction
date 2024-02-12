execute if score $xylo_items xvc.load_status matches 0 run return 0

#==<Item Use>==#

# xitm.shield.using
execute store success score @s xitm.shield.using if entity @s[advancements={xylo_items:item/shield/using=true}]
advancement revoke @s only xylo_items:item/shield/using

# xitm.wfoas.used
execute store success score @s xitm.wfoas.used run scoreboard players reset @s[scores={xitm.wfoas.used_stat=1..}] xitm.wfoas.used_stat
execute store success score @s xitm.wfoas.used_mh if predicate xylo_items:item/wfoas/used_mh
execute store success score @s xitm.wfoas.used_oh if predicate xylo_items:item/wfoas/used_oh

# xitm.bow.used
execute store success score @s xitm.bow.used run scoreboard players reset @s[scores={xitm.bow.used_stat=1..}] xitm.bow.used_stat
execute store success score @s xitm.bow.used_mh if predicate xylo_items:item/bow/used_mh
execute store success score @s xitm.bow.used_oh if predicate xylo_items:item/bow/used_oh

# xitm.crossbow.used
execute store success score @s xitm.crossbow.used run scoreboard players reset @s[scores={xitm.crossbow.used_stat=1..}] xitm.crossbow.used_stat
execute store success score @s xitm.crossbow.used_mh if predicate xylo_items:item/crossbow/used_mh
execute store success score @s xitm.crossbow.used_oh if predicate xylo_items:item/crossbow/used_oh

# xitm.trident.used
execute store success score @s xitm.trident.used run scoreboard players reset @s[scores={xitm.trident.used_stat=1..}] xitm.trident.used_stat
execute store success score @s xitm.trident.used_mh if predicate xylo_items:item/trident/used_mh
execute store success score @s xitm.trident.used_oh if predicate xylo_items:item/trident/used_oh
execute store success score @s xitm.trident.thrown if entity @s[scores={xitm.trident.used=1,xlib.player.dealt_damage_direct=0}]

# xitm.snowball.used
execute store success score @s xitm.snowball.used run scoreboard players reset @s[scores={xitm.snowball.used_stat=1..}] xitm.snowball.used_stat
execute store success score @s xitm.snowball.used_mh if predicate xylo_items:item/snowball/used_mh
execute store success score @s xitm.snowball.used_oh if predicate xylo_items:item/snowball/used_oh

# xitm.ender_pearl.used
execute store success score @s xitm.ender_pearl.used run scoreboard players reset @s[scores={xitm.ender_pearl.used_stat=1..}] xitm.ender_pearl.used_stat
execute store success score @s xitm.ender_pearl.used_mh if predicate xylo_items:item/ender_pearl/used_mh
execute store success score @s xitm.ender_pearl.used_oh if predicate xylo_items:item/ender_pearl/used_oh


#==<Projectile Detection>==#

tag @s add xitm.player_tick.projectile_detection

# bow proj
execute at @s[scores={xitm.bow.used=1}] anchored eyes positioned ^ ^ ^ as @e[type=minecraft:arrow,distance=..1,tag=!xitm.item.generic.projectile.detected] run function xylo_items:item/bow/projectile/arrow
execute at @s[scores={xitm.bow.used=1}] anchored eyes positioned ^ ^ ^ as @e[type=minecraft:spectral_arrow,distance=..1,tag=!xitm.item.generic.projectile.detected] run function xylo_items:item/bow/projectile/spectral_arrow

# crossbow proj
execute at @s[scores={xitm.crossbow.used=1}] anchored eyes positioned ^ ^ ^ as @e[type=minecraft:arrow,distance=..1,tag=!xitm.item.generic.projectile.detected] run function xylo_items:item/crossbow/projectile/arrow
execute at @s[scores={xitm.crossbow.used=1}] anchored eyes positioned ^ ^ ^ as @e[type=minecraft:spectral_arrow,distance=..1,tag=!xitm.item.generic.projectile.detected] run function xylo_items:item/crossbow/projectile/spectral_arrow

# trident proj
execute at @s[scores={xitm.trident.thrown=1}] anchored eyes positioned ^ ^ ^ as @e[type=minecraft:trident,distance=..1,tag=!xitm.item.generic.projectile.detected] run function xylo_items:item/trident/projectile/trident

# snowball proj
execute at @s[scores={xitm.snowball.used=1}] anchored eyes positioned ^ ^ ^ as @e[type=minecraft:snowball,distance=..1,tag=!xitm.item.generic.projectile.detected] run function xylo_items:item/snowball/projectile/snowball

# ender_pearl proj
execute at @s[scores={xitm.ender_pearl.used=1}] anchored eyes positioned ^ ^ ^ as @e[type=minecraft:ender_pearl,distance=..1,tag=!xitm.item.generic.projectile.detected] run function xylo_items:item/ender_pearl/projectile/ender_pearl

tag @s remove xitm.player_tick.projectile_detection


#==<Items Class>==#

# throwable
execute if score @s xitm.wfoas.used_mh matches 1 if data storage xylo_library:op player_data.SelectedItem{tag:{xylo_items:{item_class:"throwable"}}} run function xylo_items:item_class/throwable/throw_mh
execute if entity @s[scores={xitm.wfoas.used_mh=0,xitm.wfoas.used_oh=1}] if data storage xylo_library:op player_data.Inventory[{Slot:-106b,tag:{xylo_items:{item_class:"throwable"}}}] run function xylo_items:item_class/throwable/throw_oh
