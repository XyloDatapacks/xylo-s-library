# <@> player
# in: "xylo_library:op clone_input_data"
#   duration: sets a scoreboard to the time time the clone should be killed at
#   aoe.tags: tags to add to aoe
#   marker.tags: tags to add to marker
#   marker.data: data to merge with marker data
#   hitbox.tags: tags to add to hitbox entity

#   active_effects: effects to give to hitbox
#   armor: armor to give to hitbox
#   attributes: attributes to give to hitbox
#   health: health of hitbox

# out: "xylo_library:op clone_owner_hex_uuid"
# out: "xylo_library:op clone_data" (data saved in player's clone storage)
# out: "xylo_library:op clone_output_data"

ride @s dismount
data remove storage xylo_library:op clone_data

#==<Player UUID & Name>==#

# player uuid
data modify storage xylo_library:op clone_data.player_uuid set from entity @s UUID
# player hex uuid
data modify storage gu:main in set from storage xylo_library:op clone_data.player_uuid
function xylo_library:utilities/uuid/generate_from_storage
data modify storage xylo_library:op clone_data.player_hex_uuid set from storage gu:main out
# get name
function xylo_library:utilities/player_name/get_name
data modify storage xylo_library:op clone_data.name set from storage xylo_library:op player_name

#==<Clone>==#

# get position
execute summon minecraft:marker run function xylo_library:internal/clone/generate/get_position
# generate body
function xylo_library:internal/clone/generate/clone_summon with storage xylo_library:op clone_data


#==<Save Data In Player Storage>==#

# player hex uuid
data remove storage xylo_library:op clone_owner_hex_uuid
data modify storage xylo_library:op clone_owner_hex_uuid.player_hex_uuid set from storage xylo_library:op clone_data.player_hex_uuid

# clear useless data
data remove storage xylo_library:op clone_data.name
data remove storage xylo_library:op clone_data.player_uuid
data remove storage xylo_library:op clone_data.player_hex_uuid
data modify storage xylo_library:op clone_data.tags set from storage xylo_library:op clone_input_data.tags

# prepare output data storage
data remove storage xylo_library:op clone_output_data
execute store result storage xylo_library:op clone_output_data.start_time int 1 run scoreboard players get #xlib.time xlib.op
data modify storage xylo_library:op clone_output_data.clone set from storage xylo_library:op clone_data
data modify storage xylo_library:op clone_output_data.active_effects set from storage xylo_library:op clone_input_data.active_effects
data modify storage xylo_library:op clone_output_data.armor set from storage xylo_library:op clone_input_data.armor
data modify storage xylo_library:op clone_output_data.health set from storage xylo_library:op clone_input_data.health

# save position in player storage
function xylo_library:internal/clone/generate/save_clone_data_in_storage with storage xylo_library:op clone_owner_hex_uuid