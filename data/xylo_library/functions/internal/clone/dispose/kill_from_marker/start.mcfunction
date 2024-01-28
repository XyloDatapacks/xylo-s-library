# <@> marker

# out: "xylo_library:op clone_data"


# remove clone data from player storage
data modify storage xylo_library:op macro_data set from entity @s data.xylo_library.clone
function xylo_library:internal/clone/dispose/kill_from_marker/remove_from_player_storage_and_kill with storage xylo_library:op macro_data

