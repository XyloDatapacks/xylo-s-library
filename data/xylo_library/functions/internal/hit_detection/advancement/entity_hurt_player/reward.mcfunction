#> xylo_library:internal/hit_detection/advancement/entity_hurt_player/reward
# @context: as & at player hurt
# @within: advancement reward: xylo_library:internal/hit_detection/entity_hurt_player

# Escape if detection is off
execute if score $detection xlib.internal.hit_detection._ matches 0 run return 0

# Determine the id of the entity inflicting damage
scoreboard players set $direct xlib.internal.hit_detection._ -1
execute if entity @s[advancements={xylo_library:internal/hit_detection/entity_hurt_player={direct_has_no_id=false}}] run function xylo_library:internal/hit_detection/advancement/entity_hurt_player/reward_1

# Determine the id of the entity receiving damage
scoreboard players set $victim xlib.internal.hit_detection._ -1
execute if score @s xlib.internal.hit_detection.id = @s xlib.internal.hit_detection.id run scoreboard players operation $victim xlib.internal.hit_detection._ = @s xlib.internal.hit_detection.id

# Revoke the advancement, so it can be triggered again
advancement revoke @s only xylo_library:internal/hit_detection/entity_hurt_player

# Run the provided functions that work off of this reward function
function #xylo_library:player_is_hurt_by_entity
