# -> {element, {data: pack_index}}
# pack_index: index of the pack im checking

#fetch data
data remove storage xvc_version:op macro_data
$data modify storage xvc_version:op macro_data.element set value $(element)

# check if the version found (in packs[{namespace:"$(element.namespace)"}].version) is >= then the required one (in element.version)
function xylo_library:xvc/check/operations/get_required_pack_data with storage xvc_version:op macro_data.element
execute store result score #xvc.check.check_required.min_version xvc.op run data get storage xvc_version:op macro_data.element.version

# valid version
execute if score #xvc.check.operations.get_version xvc.op >= #xvc.check.check_required.min_version xvc.op run tellraw @a [{"storage":"xvc_version:op","nbt":"indentation","interpret":true,"color":"white"},"Required check: ",{"storage":"xvc_version:op","nbt":"macro_data.element.namespace","interpret":true,"color":"aqua"}," -> ",{"text":"Passed","color":"green"}]
$execute if score #xvc.check.operations.get_version xvc.op >= #xvc.check.check_required.min_version xvc.op run data modify storage xvc_version:op packs[$(pack_index)].status.required_passed set value 1b
# invalid version
execute if score #xvc.check.operations.get_version xvc.op < #xvc.check.check_required.min_version xvc.op run tellraw @a [{"storage":"xvc_version:op","nbt":"indentation","interpret":true,"color":"white"},"Required check: ",{"storage":"xvc_version:op","nbt":"macro_data.element.namespace","interpret":true,"color":"aqua"}," -> ",{"text":"Failed","color":"red"}]
execute if score #xvc.check.operations.get_version xvc.op < #xvc.check.check_required.min_version xvc.op run return 0



data modify storage xvc_version:op indentation append value "  "
#exit if checked already
$execute if data storage xvc_version:op packs[$(pack_index)].status{checked:1b} run tellraw @a [{"storage":"xvc_version:op","nbt":"indentation","interpret":true,"color":"white"},{"storage":"xvc_version:op","nbt":"macro_data.element.namespace","interpret":true,"color":"aqua"},{"text":" already checked requirements"}]
$execute if data storage xvc_version:op packs[$(pack_index)].status{checked:1b} run data remove storage xvc_version:op indentation[-1]
$execute if data storage xvc_version:op packs[$(pack_index)].status{checked:1b} run return 1
#add checked tag
$data modify storage xvc_version:op packs[$(pack_index)].status.checked set value 1b

tellraw @a [{"storage":"xvc_version:op","nbt":"indentation","interpret":true,"color":"white"},{"storage":"xvc_version:op","nbt":"macro_data.element.namespace","interpret":true,"color":"aqua"},{"text":" check requirements"}]

data modify storage xvc_version:op indentation append value "  "

#for each required pack of this required pack, execute the check
$data modify storage xvc_version:op macro_data set value {function:"xylo_library:xvc/check/check_required",data:{pack_index:$(pack_index)}}
data modify storage xvc_version:op macro_data.array set from storage xvc_version:op required_pack_data.required
function xylo_library:utilities/for_each_loop/for_loop with storage xvc_version:op macro_data

data remove storage xvc_version:op indentation[-1]
data remove storage xvc_version:op indentation[-1]
