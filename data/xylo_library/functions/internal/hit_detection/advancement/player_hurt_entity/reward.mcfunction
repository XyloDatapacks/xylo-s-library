#> xylo_library:internal/hit_detection/advancement/player_hurt_entity/reward
# @context: as & at player attacker
# @within: advancement reward: xylo_library:internal/hit_detection/player_hurt_entity

# Escape if detection is off
execute if score $detection xlib.internal.hit_detection._ matches 0 run return 0

# Determine the id of the entity inflicting damage
scoreboard players set $direct xlib.internal.hit_detection._ -1
execute if entity @s[advancements={xylo_library:internal/hit_detection/player_hurt_entity={direct_has_no_id=false}}] run function xylo_library:internal/hit_detection/advancement/player_hurt_entity/reward_1

# Determine the id of the entity receiving damage
scoreboard players set $victim xlib.internal.hit_detection._ -1
execute if entity @s[advancements={xylo_library:internal/hit_detection/player_hurt_entity={victim_has_no_id=false}}] run function xylo_library:internal/hit_detection/advancement/player_hurt_entity/reward_2

# Revoke the advancement, so it can be triggered again
advancement revoke @s only xylo_library:internal/hit_detection/player_hurt_entity

# Run the provided functions that work off of this reward function
function #xylo_library:player_hurts_entity
