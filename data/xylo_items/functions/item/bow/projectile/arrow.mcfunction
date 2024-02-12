#> xylo_items:item/bow/projectile/arrow
# @context: as all the non tagged arrows next to the player
# @within: xylo_items:player_tick

# return if not owned by the player
execute on origin unless entity @s[tag=xitm.player_tick.projectile_detection] run return 0
# add tag detected
tag @s add xitm.item.generic.projectile.detected

# execute function call
function #xylo_items:item/shoot_bow_arrow
