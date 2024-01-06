# -> {namespace}

$data modify storage xvc_version:op required_pack_data set from storage xvc_version:op packs[{namespace:$(namespace)}]
execute store result score #xvc.check.operations.get_version xvc.op run data get storage xvc_version:op required_pack_data.version
