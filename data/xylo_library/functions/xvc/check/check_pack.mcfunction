# -> {array, index, element, data}

#show pack name
$data modify storage xvc_version:op macro_data set from storage xvc_version:op packs[$(index)]
tellraw @a ["Checking: ",{"storage":"xvc_version:op","nbt":"macro_data.namespace","interpret":true,"color":"aqua"}]
data modify storage xvc_version:op indentation append value "  "

#for each required pack of this pack, execute the check
$data modify storage xvc_version:op macro_data set value {function:"xylo_library:xvc/check/check_required",data:{pack_index:$(index)}}
$data modify storage xvc_version:op macro_data.array set from storage xvc_version:op packs[$(index)].required
function xylo_library:utilities/for_each_loop/for_loop with storage xvc_version:op macro_data

#for each supported pack of this pack, execute the check
#$data modify storage xvc_version:op macro_data set value {function:"xylo_library:xvc/check/check_supported",data:{pack_index:$(index)}}
#$data modify storage xvc_version:op macro_data.array set from storage xvc_version:op packs[$(index)].supported
#function xylo_library:utilities/for_each_loop/for_loop with storage xvc_version:op macro_data

data remove storage xvc_version:op indentation[-1]

#update status
$data modify storage xvc_version:op macro_data set from storage xvc_version:op packs[$(index)]
$execute if data storage xvc_version:op macro_data.status{required_passed:1b} run data modify storage xvc_version:op packs[$(index)].status.validated set value 1b
