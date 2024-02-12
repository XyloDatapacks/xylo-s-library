#> xylo_projectiles:position_correction/damage/start
# @context: projectile corr aoe, at impact position
# @within: xylo_projectiles:position_correction/correct/start
# @macro: uuid (target hex uuid), damage (double)

$execute on vehicle on vehicle if entity @s[type=minecraft:trident] run return run damage $(uuid) $(damage) minecraft:player_attack by @s
$execute on origin if entity @s[type=minecraft:player] run return run damage $(uuid) $(damage) minecraft:player_attack by @s
$execute on origin if entity @s[type=!minecraft:player] run return run damage $(uuid) $(damage) minecraft:mob_attack by @s
