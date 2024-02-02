# -> {player_hex_uuid}

#save data in player storage
$data modify storage xylo_library:data players[{uuid:$(player_hex_uuid)}].clones_list append from storage xylo_library:op clone_output_data
