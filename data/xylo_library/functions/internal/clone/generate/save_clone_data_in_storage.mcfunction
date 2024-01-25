# -> {player_hex_uuid}

data remove storage xylo_library:op clone_data.name
data remove storage xylo_library:op clone_data.player_uuid
data remove storage xylo_library:op clone_data.player_hex_uuid

#save data in player storage
$data modify storage xylo_library:data players[{uuid:$(player_hex_uuid)}].clone set from storage xylo_library:op clone_data
