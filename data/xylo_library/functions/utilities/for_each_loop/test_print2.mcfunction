# -> {array, index, element}

data remove storage xvc_version:op macro_data
$data modify storage xvc_version:op macro_data.array set value $(array)
$data modify storage xvc_version:op macro_data.element set value $(element)

tellraw @a ["",{"storage":"xvc_version:op","nbt":"macro_data.element","color":"aqua"}]

