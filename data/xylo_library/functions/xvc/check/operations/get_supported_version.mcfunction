# -> {namespace}

$execute store result score #xvc.check.check_required.required_pack.min_supported_version xvc.op run data get storage xvc_version:op required_pack_data.supported[{namespace:$(namespace)}].version
execute if score #xvc.check.check_required.required_pack.min_supported_version xvc.op matches 0 run scoreboard players set #xvc.check.check_required.required_pack.min_supported_version xvc.op 2147483647
