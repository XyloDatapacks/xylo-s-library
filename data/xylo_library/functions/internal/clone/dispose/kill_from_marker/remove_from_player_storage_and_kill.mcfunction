# -> {marker_hex_uuid, player_hex_uuid}

# fetch clone data
data remove storage xylo_library:op clone_data
$data modify storage xylo_library:op clone_data set from storage xylo_library:data players[{uuid:$(player_hex_uuid)}].clone[{uuid:$(marker_hex_uuid)}]
# remove clone data
$data remove storage xylo_library:data players[{uuid:$(player_hex_uuid)}].clone[{uuid:$(marker_hex_uuid)}]

# kill clone
$execute as $(marker_hex_uuid) on vehicle run function xylo_library:internal/clone/dispose/_kill

# return success
return 1