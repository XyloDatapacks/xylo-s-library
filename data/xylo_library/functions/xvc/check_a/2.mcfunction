# -> {packs_number, elaborating_index}

data modify storage xvc_version:op macro_data
function xylo_library:xvc/check/check_required with storage xvc_version:op macro_data








#init data
$scoreboard players set #xvc.check.packs_number xvc.op $(packs_number)
$scoreboard players set #xvc.check.elaborating_index xvc.op $(elaborating_index)
scoreboard players add #xvc.check.elaborating_index xvc.op 1
#loop
data remove storage xvc_version:op macro_data
execute store result storage xvc_version:op macro_data.packs_number int 1 run scoreboard players get #xvc.check.packs_number xvc.op
execute store result storage xvc_version:op macro_data.elaborating_index int 1 run scoreboard players get #xvc.check.elaborating_index xvc.op
execute if score #xvc.check.packs_number xvc.op > #xvc.check.elaborating_index xvc.op run function xylo_library:xvc/check/2