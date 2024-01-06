# executes a function for each element of the array passing as macro: "array" and "element" (element of the array)
# -> {array, function, data}

#loop
$data modify storage xvc_version:op macro_data set value {array:$(array),function:"$(function)",data:$(data)}

execute store result score #xvc.check.for_loop.elements_count xvc.op run data get storage xvc_version:op macro_data.array
scoreboard players set #xvc.check.for_loop.index xvc.op 0

execute store result storage xvc_version:op macro_data.elements_count int 1 run scoreboard players get #xvc.check.for_loop.elements_count xvc.op
execute store result storage xvc_version:op macro_data.index int 1 run scoreboard players get #xvc.check.for_loop.index xvc.op
execute if score #xvc.check.for_loop.elements_count xvc.op > #xvc.check.for_loop.index xvc.op run function xylo_library:utilities/for_each_loop/for_loop_core with storage xvc_version:op macro_data

