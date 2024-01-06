# -> {element, index, {data: pack_index}}
# pack_index: index of the pack im checking

#fetch data
data remove storage xvc_version:op macro_data
$data modify storage xvc_version:op macro_data.element set value $(element)

# check if the version found (in packs[{namespace:"$(element.namespace)"}].version) is >= then the required one (in element.version)
function xylo_library:xvc/check/operations/get_required_pack_data with storage xvc_version:op macro_data.element
execute store result score #xvc.check.check_required.min_version xvc.op run data get storage xvc_version:op macro_data.element.version

# valid version
$execute if score #xvc.check.operations.get_version xvc.op >= #xvc.check.check_required.min_version xvc.op run data modify storage xvc_version:op packs[$(pack_index)].status.required_passed set value 1b
execute if score #xvc.check.operations.get_version xvc.op >= #xvc.check.check_required.min_version xvc.op unless data storage xvc_version:op required_pack_data.required run tellraw @a [{"storage":"xvc_version:op","nbt":"indentation","interpret":true,"color":"white"},{"text":"Checking: ","color":"yellow"},{"text":"[","color":"light_purple"},{"storage":"xvc_version:op","nbt":"macro_data.element.namespace","interpret":true,"color":"light_purple","hoverEvent":{"action":"show_text","contents":["",{"storage":"xvc_version:op","nbt":"required_pack_data.name","color":"aqua"}]}},{"text":"]","color":"light_purple"}," -> ",{"text":"Passed","color":"green"}]
execute if score #xvc.check.operations.get_version xvc.op >= #xvc.check.check_required.min_version xvc.op unless data storage xvc_version:op required_pack_data.required run return 1
# invalid version
execute if score #xvc.check.operations.get_version xvc.op < #xvc.check.check_required.min_version xvc.op run tellraw @a [{"storage":"xvc_version:op","nbt":"indentation","interpret":true,"color":"white"},{"text":"Checking: ","color":"yellow"},{"text":"[","color":"light_purple"},{"storage":"xvc_version:op","nbt":"macro_data.element.namespace","interpret":true,"color":"light_purple","hoverEvent":{"action":"show_text","contents":["",{"storage":"xvc_version:op","nbt":"required_pack_data.name","color":"aqua"}]}},{"text":"]","color":"light_purple"}," -> ",{"text":"Failed","color":"red","hoverEvent":{"action":"show_text","contents":["Please Update ",{"storage":"xvc_version:op","nbt":"required_pack_data.name","color":"aqua"},"\nOutdated module: ",{"storage":"xvc_version:op","nbt":"required_pack_data.namespace","color":"aqua"},"\nVersion found: ",{"score":{"objective":"xvc.op","name":"#xvc.check.operations.get_version"}},"\nVersion required: ",{"score":{"objective":"xvc.op","name":"#xvc.check.check_required.min_version"}},"+"]}}]
$execute if score #xvc.check.operations.get_version xvc.op < #xvc.check.check_required.min_version xvc.op run data modify storage xvc_version:op packs[$(pack_index)].status.error set value 1b
execute if score #xvc.check.operations.get_version xvc.op < #xvc.check.check_required.min_version xvc.op run return 0

# check if this pack is actually working
tellraw @a [{"storage":"xvc_version:op","nbt":"indentation","interpret":true,"color":"white"},{"text":"Checking: ","color":"yellow"},{"text":"[","color":"light_purple"},{"storage":"xvc_version:op","nbt":"macro_data.element.namespace","interpret":true,"color":"light_purple","hoverEvent":{"action":"show_text","contents":["",{"storage":"xvc_version:op","nbt":"required_pack_data.name","color":"aqua"}]}},{"text":"]","color":"light_purple"}]
data modify storage xvc_version:op indentation append value " | "

#for each required pack of this required pack, execute the check
data modify storage xvc_version:op macro_data set value {function:"xylo_library:xvc/check/check_required"}
data modify storage xvc_version:op macro_data.array set from storage xvc_version:op required_pack_data.required
data modify storage xvc_version:op macro_data.data.pack_index set from storage xvc_version:op required_pack_data.index
function xylo_library:utilities/for_each_loop/for_loop with storage xvc_version:op macro_data

data remove storage xvc_version:op indentation[-1]

# pass up error status
data remove storage xvc_version:op macro_data
$data modify storage xvc_version:op macro_data.element set value $(element)
function xylo_library:xvc/check/operations/get_required_pack_data with storage xvc_version:op macro_data.element

$execute if data storage xvc_version:op required_pack_data.status{error:1b} run data modify storage xvc_version:op packs[$(pack_index)].status.error set value 1b
execute if data storage xvc_version:op required_pack_data.status{error:1b} run tellraw @a [{"storage":"xvc_version:op","nbt":"indentation","interpret":true,"color":"white"},{"storage":"xvc_version:op","nbt":"macro_data.element.namespace","interpret":true,"color":"aqua"}," -> ",{"text":"Failed","color":"red","hoverEvent":{"action":"show_text","contents":["",{"storage":"xvc_version:op","nbt":"required_pack_data.namespace","color":"aqua"}," failed to validate\nPlease fix the dependecies"]}}]
execute unless data storage xvc_version:op required_pack_data.status{error:1b} run tellraw @a [{"storage":"xvc_version:op","nbt":"indentation","interpret":true,"color":"white"},{"storage":"xvc_version:op","nbt":"macro_data.element.namespace","interpret":true,"color":"aqua"}," -> ",{"text":"Passed","color":"green"}]

