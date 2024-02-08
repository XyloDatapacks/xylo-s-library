# -> {add}

data remove storage xylo_library:op macro_data
$data modify storage xylo_library:op macro_data.add set value '$(add)'
data modify storage xylo_library:op macro_data.array set string storage xylo_library:op internal_gui 0 -1
function xylo_library:internal/gui/generate/append2 with storage xylo_library:op macro_data
