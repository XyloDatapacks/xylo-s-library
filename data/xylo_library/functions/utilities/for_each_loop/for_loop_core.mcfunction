# -> {array, elements_count, index, function, data}

$data modify storage xvc_version:op macro_data set value {array:$(array),index:"$(index)"}
$data modify storage xvc_version:op macro_data merge value $(data)
$data modify storage xvc_version:op macro_data.element set from storage xvc_version:op macro_data.array[$(index)]
$function $(function) with storage xvc_version:op macro_data


#loop
$data modify storage xvc_version:op macro_data set value {array:$(array),function:"$(function)",data:$(data)}

$scoreboard players set #xvc.check.for_loop.elements_count xvc.op $(elements_count)
$scoreboard players set #xvc.check.for_loop.index xvc.op $(index)
scoreboard players add #xvc.check.for_loop.index xvc.op 1

execute store result storage xvc_version:op macro_data.elements_count int 1 run scoreboard players get #xvc.check.for_loop.elements_count xvc.op
execute store result storage xvc_version:op macro_data.index int 1 run scoreboard players get #xvc.check.for_loop.index xvc.op
execute if score #xvc.check.for_loop.elements_count xvc.op > #xvc.check.for_loop.index xvc.op run function xylo_library:utilities/for_each_loop/for_loop_core with storage xvc_version:op macro_data