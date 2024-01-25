data remove storage xylo_library:op macro_data
# get clone marker hex uuid
function xylo_library:utilities/uuid/generate
data modify storage xylo_library:op macro_data.marker_hex_uuid set from storage gu:main out
# get player hex uuid
data modify storage xylo_library:op macro_data.player_hex_uuid set from entity @s data.xylo_library.clone.owner_uuid

# remove clone data from player storage
function xylo_library:internal/clone/dispose/kill_from_marker/remove_from_player_storage_and_kill with storage xylo_library:op macro_data

