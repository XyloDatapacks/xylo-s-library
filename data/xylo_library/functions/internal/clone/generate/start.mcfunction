# in: "xylo_library:op clone_input_data"
#   duration: sets a scoreboard to the time time the clone should be killed at
#   aoe.tags: tags to add to aoe
#   marker.tags: tags to add to marker
#   marker.data: data to merge with marker data
#   hitbox.tags: tags to add to hitbox entity

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

# save position in player storage
function xylo_library:internal/clone/generate/save_clone_data_in_storage with storage xylo_library:op clone_data