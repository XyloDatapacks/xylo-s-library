# -> {array, index, element, data}

#show pack name
$data modify storage xvc_version:op macro_data set from storage xvc_version:op packs[$(index)]
execute unless data storage xvc_version:op macro_data.required run tellraw @a ["",{"text":"Checking: ","color":"gold"},{"text":"[","color":"light_purple"},{"storage":"xvc_version:op","nbt":"macro_data.namespace","interpret":true,"color":"light_purple","hoverEvent":{"action":"show_text","contents":["",{"storage":"xvc_version:op","nbt":"macro_data.name","color":"aqua"}]}},{"text":"]","color":"light_purple"}," -> ",{"text":"Passed","color":"green"}]
execute unless data storage xvc_version:op macro_data.required run tellraw @a ""
execute unless data storage xvc_version:op macro_data.required run return 1 

tellraw @a ["",{"text":"Checking: ","color":"gold"},{"text":"[","color":"light_purple"},{"storage":"xvc_version:op","nbt":"macro_data.namespace","interpret":true,"color":"light_purple","hoverEvent":{"action":"show_text","contents":["",{"storage":"xvc_version:op","nbt":"macro_data.name","color":"aqua"}]}},{"text":"]","color":"light_purple"}]
data modify storage xvc_version:op indentation append value " | "

#for each required pack of this pack, execute the check
$data modify storage xvc_version:op macro_data set value {function:"xylo_library:xvc/check/check_required",data:{pack_index:$(index)}}
$data modify storage xvc_version:op macro_data.array set from storage xvc_version:op packs[$(index)].required
function xylo_library:utilities/for_each_loop/for_loop with storage xvc_version:op macro_data

#for each supported pack of this pack, execute the check
#$data modify storage xvc_version:op macro_data set value {function:"xylo_library:xvc/check/check_supported",data:{pack_index:$(index)}}
#$data modify storage xvc_version:op macro_data.array set from storage xvc_version:op packs[$(index)].supported
#function xylo_library:utilities/for_each_loop/for_loop with storage xvc_version:op macro_data

data remove storage xvc_version:op indentation[-1]

$data modify storage xvc_version:op macro_data set from storage xvc_version:op packs[$(index)]
execute if data storage xvc_version:op macro_data.status{error:1b} run tellraw @a [{"storage":"xvc_version:op","nbt":"indentation","interpret":true,"color":"white"},{"storage":"xvc_version:op","nbt":"macro_data.namespace","interpret":true,"color":"aqua"}," -> ",{"text":"Failed","color":"red","hoverEvent":{"action":"show_text","contents":["",{"storage":"xvc_version:op","nbt":"macro_data.namespace","color":"aqua"}," failed to validate\nPlease fix the dependecies"]}}]
execute unless data storage xvc_version:op macro_data.status{error:1b} run tellraw @a [{"storage":"xvc_version:op","nbt":"indentation","interpret":true,"color":"white"},{"storage":"xvc_version:op","nbt":"macro_data.namespace","interpret":true,"color":"aqua"}," -> ",{"text":"Passed","color":"green"}]

tellraw @a ""