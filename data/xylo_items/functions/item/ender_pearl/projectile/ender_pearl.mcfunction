#> xylo_items:item/ender_pearl/projectile/ender_pearl
# @context: as all the non tagged ender_pearls next to the player
# @within: xylo_items:player_tick

# return if not owned by the player
execute on origin unless entity @s[tag=xitm.player_tick.projectile_detection] run return 0
# add tag detected
tag @s add xitm.item.generic.projectile.detected

# execute function call
function #xylo_items:item/shoot_ender_pearl
