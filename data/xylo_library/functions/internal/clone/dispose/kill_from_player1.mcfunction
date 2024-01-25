data remove storage xylo_library:op macro_data
$data modify storage xylo_library:op macro_data.uuid set from storage xylo_library:data players[{uuid:$(out)}].clone.uuid
function xylo_library:internal/clone/dispose/kill_from_player2 with storage xylo_library:op macro_data

