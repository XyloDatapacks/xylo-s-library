# -> {element, index, {data: pack_index}}
# pack_index: index of the pack im checking

# Fetch checking pack data and required pack data
$data modify storage xvc_version:op checking_pack set from storage xvc_version:op packs[$(pack_index)]
$function xylo_library:xvc/check/operations/get_required_pack_data $(element)

#==<Supported Check>==#
# Checks if the required pack actually supports the checking pack

execute store result score #xvc.check.check_required.checking_pack.version xvc.op run data get storage xvc_version:op checking_pack.version
function xylo_library:xvc/check/operations/get_supported_version with storage xvc_version:op checking_pack

# Invalid version
execute if score #xvc.check.check_required.checking_pack.version xvc.op < #xvc.check.check_required.required_pack.min_supported_version xvc.op run tellraw @a[tag=xvc.debug] [{"storage":"xvc_version:op","nbt":"indentation","interpret":"true","color":"white"},{"text":"Checking: ","color":"yellow"},{"text":"[","color":"light_purple"},{"storage":"xvc_version:op","nbt":"required_pack_data.namespace","interpret":"true","color":"light_purple","hoverEvent":{"action":"show_text","contents":["",{"storage":"xvc_version:op","nbt":"required_pack_data.name","color":"aqua"}]}},{"text":"]","color":"light_purple"}," -> ",{"text":"Support Failed","color":"gray","hoverEvent":{"action":"show_text","contents":["Please Update ",{"storage":"xvc_version:op","nbt":"checking_pack.name","color":"aqua"},"\nOutdated module: ",{"storage":"xvc_version:op","nbt":"checking_pack.namespace","color":"aqua"},"\nVersion found: ",{"score":{"objective":"xvc.op","name":"#xvc.check.check_required.checking_pack.version"}},"\nVersion supported: ",{"score":{"objective":"xvc.op","name":"#xvc.check.check_required.required_pack.min_supported_version"}},"+"]}}]
$execute if score #xvc.check.check_required.checking_pack.version xvc.op < #xvc.check.check_required.required_pack.min_supported_version xvc.op run data modify storage xvc_version:op packs[$(pack_index)].status.error set value 1b
execute if score #xvc.check.check_required.checking_pack.version xvc.op < #xvc.check.check_required.required_pack.min_supported_version xvc.op run return 0


#==<Version Check>==#

# Check if the version found (in packs[{namespace:"$(element.namespace)"}].version) is >= then the required one (in element.version)
execute store result score #xvc.check.check_required.required_pack.version xvc.op run data get storage xvc_version:op required_pack_data.version
$execute store result score #xvc.check.check_required.checking_pack.min_required_version xvc.op run data get storage xvc_version:op checking_pack.required[$(index)].version

# Valid version
execute if score #xvc.check.check_required.required_pack.version xvc.op >= #xvc.check.check_required.checking_pack.min_required_version xvc.op unless data storage xvc_version:op required_pack_data.required run tellraw @a[tag=xvc.debug] [{"storage":"xvc_version:op","nbt":"indentation","interpret":"true","color":"white"},{"text":"Checking: ","color":"yellow"},{"text":"[","color":"light_purple"},{"storage":"xvc_version:op","nbt":"required_pack_data.namespace","interpret":"true","color":"light_purple","hoverEvent":{"action":"show_text","contents":["",{"storage":"xvc_version:op","nbt":"required_pack_data.name","color":"aqua"}]}},{"text":"]","color":"light_purple"}," -> ",{"text":"Passed","color":"green"}]
execute if score #xvc.check.check_required.required_pack.version xvc.op >= #xvc.check.check_required.checking_pack.min_required_version xvc.op unless data storage xvc_version:op required_pack_data.required run return 1
# Invalid version
execute if score #xvc.check.check_required.required_pack.version xvc.op < #xvc.check.check_required.checking_pack.min_required_version xvc.op run tellraw @a[tag=xvc.debug] [{"storage":"xvc_version:op","nbt":"indentation","interpret":"true","color":"white"},{"text":"Checking: ","color":"yellow"},{"text":"[","color":"light_purple"},{"storage":"xvc_version:op","nbt":"required_pack_data.namespace","interpret":"true","color":"light_purple","hoverEvent":{"action":"show_text","contents":["",{"storage":"xvc_version:op","nbt":"required_pack_data.name","color":"aqua"}]}},{"text":"]","color":"light_purple"}," -> ",{"text":"Failed","color":"red","hoverEvent":{"action":"show_text","contents":["Please Update ",{"storage":"xvc_version:op","nbt":"required_pack_data.name","color":"aqua"},"\nOutdated module: ",{"storage":"xvc_version:op","nbt":"required_pack_data.namespace","color":"aqua"},"\nVersion found: ",{"score":{"objective":"xvc.op","name":"#xvc.check.check_required.required_pack.version"}},"\nVersion required: ",{"score":{"objective":"xvc.op","name":"#xvc.check.check_required.checking_pack.min_required_version"}},"+"]}}]
$execute if score #xvc.check.check_required.required_pack.version xvc.op < #xvc.check.check_required.checking_pack.min_required_version xvc.op run data modify storage xvc_version:op packs[$(pack_index)].status.error set value 1b
execute if score #xvc.check.check_required.required_pack.version xvc.op < #xvc.check.check_required.checking_pack.min_required_version xvc.op run return 0


#==<Validate Required Pack>==#
# Repeat this function for each required pack of this required pack

# Check if this pack is actually working
tellraw @a[tag=xvc.debug] [{"storage":"xvc_version:op","nbt":"indentation","interpret":"true","color":"white"},{"text":"Checking: ","color":"yellow"},{"text":"[","color":"light_purple"},{"storage":"xvc_version:op","nbt":"required_pack_data.namespace","interpret":"true","color":"light_purple","hoverEvent":{"action":"show_text","contents":["",{"storage":"xvc_version:op","nbt":"required_pack_data.name","color":"aqua"}]}},{"text":"]","color":"light_purple"}]
data modify storage xvc_version:op indentation append value " | "

# For each required pack of this required pack, execute the check
data modify storage xvc_version:op macro_data set value {function:"xylo_library:xvc/check/check_required"}
data modify storage xvc_version:op macro_data.array set from storage xvc_version:op required_pack_data.required
data modify storage xvc_version:op macro_data.data.pack_index set from storage xvc_version:op required_pack_data.index
function xylo_library:utilities/for_each_loop/for_loop with storage xvc_version:op macro_data

data remove storage xvc_version:op indentation[-1]


#==<Result of Validation>==#

# Fetch checking pack data and required pack data (again since i run a for loop before)
$data modify storage xvc_version:op checking_pack set from storage xvc_version:op packs[$(pack_index)]
$function xylo_library:xvc/check/operations/get_required_pack_data $(element)

# Pass up error status
$execute if data storage xvc_version:op required_pack_data.status{error:1b} run data modify storage xvc_version:op packs[$(pack_index)].status.error set value 1b
execute if data storage xvc_version:op required_pack_data.status{error:1b} run tellraw @a[tag=xvc.debug] [{"storage":"xvc_version:op","nbt":"indentation","interpret":"true","color":"white"},{"storage":"xvc_version:op","nbt":"required_pack_data.namespace","interpret":"true","color":"aqua"}," -> ",{"text":"Failed","color":"red","hoverEvent":{"action":"show_text","contents":["",{"storage":"xvc_version:op","nbt":"required_pack_data.namespace","color":"aqua"}," failed to validate\nPlease fix the dependecies"]}}]
execute unless data storage xvc_version:op required_pack_data.status{error:1b} run tellraw @a[tag=xvc.debug] [{"storage":"xvc_version:op","nbt":"indentation","interpret":"true","color":"white"},{"storage":"xvc_version:op","nbt":"required_pack_data.namespace","interpret":"true","color":"aqua"}," -> ",{"text":"Passed","color":"green"}]

