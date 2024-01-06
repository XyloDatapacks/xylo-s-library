# -> {array, index, element}

data remove storage xvc_version:op macro_data
$data modify storage xvc_version:op macro_data.array set value $(array)
$data modify storage xvc_version:op macro_data.element set value $(element)

tellraw @a ["",{"storage":"xvc_version:op","nbt":"macro_data.element","color":"aqua"}]

function xylo_library:utilities/for_each_loop/for_loop {array:["1","2","3","4"],data:{},function:"xylo_library:utilities/for_each_loop/test_print2"}
