data remove storage xylo_library:op clone_marker_uuid
$data modify storage xylo_library:op clone_marker_uuid.uuid set from storage xylo_library:data players[{uuid:$(out)}].clone[-1].uuid

# remove clone data
$data remove storage xylo_library:data players[{uuid:$(out)}].clone[-1]

