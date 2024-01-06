# -> {array, index, element, {data}}

data remove storage xvc_version:op macro_data
$data modify storage xvc_version:op macro_data.array set value $(array)
$data modify storage xvc_version:op macro_data.element set value $(element)


# check if the version found (in packs[{namespace:"$(element.namespace)"}].version) is >= then the required one (in element.version)
function xylo_library:xvc/check/operations/get_version with storage xvc_version:op macro_data.element
execute store result score #xvc.check.check_required.min_version xvc.op run data get storage xvc_version:op macro_data.element.version
$execute if score #xvc.check.operations.get_version xvc.op >= #xvc.check.check_required.min_version xvc.op run data modify storage xvc_version:op packs[$(pack_index)].status.required_passed set value 1b
execute if score #xvc.check.operations.get_version xvc.op >= #xvc.check.check_required.min_version xvc.op run say passed
execute if score #xvc.check.operations.get_version xvc.op < #xvc.check.check_required.min_version xvc.op run say failed

# check if this pack passed validation already, else run validation

