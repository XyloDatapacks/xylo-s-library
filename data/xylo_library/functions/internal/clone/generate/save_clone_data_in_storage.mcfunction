# -> {player_hex_uuid}

data remove storage xylo_library:op clone_data.name
data remove storage xylo_library:op clone_data.player_uuid
data remove storage xylo_library:op clone_data.player_hex_uuid

data modify storage xylo_library:op clone_data.tags set from storage xylo_library:op clone_input_data.tags

#save data in player storage
$data modify storage xylo_library:data players[{uuid:$(player_hex_uuid)}].clone append from storage xylo_library:op clone_data
