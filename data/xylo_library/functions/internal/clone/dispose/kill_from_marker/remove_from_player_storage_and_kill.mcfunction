# -> {marker_hex_uuid, player_hex_uuid}

# out: "xylo_library:op clone_output_data"
#   clone: data from player's clone storage

#   active_effects: effects to give to hitbox
#   armor: armor to give to hitbox
#   health: health of hitbox

# fetch clone data
data remove storage xylo_library:op clone_output_data
$data modify storage xylo_library:op clone_output_data.clone set from storage xylo_library:data players[{uuid:$(player_hex_uuid)}].clone[{uuid:$(marker_hex_uuid)}]
# remove clone data
$data remove storage xylo_library:data players[{uuid:$(player_hex_uuid)}].clone[{uuid:$(marker_hex_uuid)}]

# get data from hitbox
$execute as $(marker_hex_uuid) on vehicle on passengers if entity @s[tag=xlib.internal.clone.hitbox] run function xylo_library:internal/clone/export/start
# kill clone
$execute as $(marker_hex_uuid) on vehicle run function xylo_library:internal/clone/dispose/_kill

# return success
return 1