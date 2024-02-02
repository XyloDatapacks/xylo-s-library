# <@> marker
# -> {player_hex_uuid, marker_hex_uuid}

data remove storage xylo_library:op clone_output_data
execute on vehicle on passengers if entity @s[tag=xlib.internal.clone.hitbox] run function xylo_library:internal/clone/export/start
$data modify storage xylo_library:data players[{uuid:$(player_hex_uuid)}].clones_list[{clone:{marker_hex_uuid:$(marker_hex_uuid)}}] merge from storage xylo_library:op clone_output_data

