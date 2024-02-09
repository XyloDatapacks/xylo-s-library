# -> {array, index, element, data}

# If no required pack, show success
$data modify storage xvc_version:op check_pack set from storage xvc_version:op packs[$(index)]
execute unless data storage xvc_version:op check_pack.required run tellraw @a[tag=xvc.debug] ["",{"text":"Checking: ","color":"gold"},{"text":"[","color":"light_purple"},{"storage":"xvc_version:op","nbt":"check_pack.namespace","interpret":true,"color":"light_purple","hoverEvent":{"action":"show_text","contents":["",{"storage":"xvc_version:op","nbt":"check_pack.name","color":"aqua"}]}},{"text":"]","color":"light_purple"}," -> ",{"text":"Passed","color":"green"}]
execute unless data storage xvc_version:op check_pack.required run tellraw @a[tag=xvc.debug] ""
execute unless data storage xvc_version:op check_pack.required run return 1 

# If required packs, show checking pack name
tellraw @a[tag=xvc.debug] ["",{"text":"Checking: ","color":"gold"},{"text":"[","color":"light_purple"},{"storage":"xvc_version:op","nbt":"check_pack.namespace","interpret":true,"color":"light_purple","hoverEvent":{"action":"show_text","contents":["",{"storage":"xvc_version:op","nbt":"check_pack.name","color":"aqua"}]}},{"text":"]","color":"light_purple"}]

# For each required pack of this pack, execute the check
data modify storage xvc_version:op indentation append value " | "

$data modify storage xvc_version:op macro_data set value {function:"xylo_library:xvc/check/check_required",data:{pack_index:$(index)}}
data modify storage xvc_version:op macro_data.array set from storage xvc_version:op check_pack.required
function xylo_library:utilities/for_each_loop/for_loop with storage xvc_version:op macro_data

data remove storage xvc_version:op indentation[-1]

# Show result of the check
$data modify storage xvc_version:op check_pack set from storage xvc_version:op packs[$(index)]
execute if data storage xvc_version:op check_pack.status{error:1b} run function xylo_library:xvc/check/operations/disable_pack with storage xvc_version:op check_pack
execute if data storage xvc_version:op check_pack.status{error:1b} run tellraw @a[tag=xvc.debug] ["",{"storage":"xvc_version:op","nbt":"indentation","interpret":true,"color":"white"},{"storage":"xvc_version:op","nbt":"check_pack.namespace","interpret":true,"color":"aqua"}," -> ",{"text":"Failed","color":"red","hoverEvent":{"action":"show_text","contents":["",{"storage":"xvc_version:op","nbt":"check_pack.namespace","color":"aqua"}," failed to validate\nPlease fix the dependecies"]}}]
execute unless data storage xvc_version:op check_pack.status{error:1b} run tellraw @a[tag=xvc.debug] ["",{"storage":"xvc_version:op","nbt":"indentation","interpret":true,"color":"white"},{"storage":"xvc_version:op","nbt":"check_pack.namespace","interpret":true,"color":"aqua"}," -> ",{"text":"Passed","color":"green"}]

tellraw @a[tag=xvc.debug] ""