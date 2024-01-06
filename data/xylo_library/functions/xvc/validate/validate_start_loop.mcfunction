data modify storage xvc_version:op validate_packs set from storage xvc_version:op packs
execute store result score #xvc.validate_packs.number xvc.op run data get storage xvc_version:op validate_packs
execute if score #xvc.validate_packs.number xvc.op matches 1.. run function xylo_library:xvc/validate/validate_loop with storage xvc_version:op validate_packs[-1]

#loop
scoreboard players remove #xvc.validate_packs.repeats xvc.op 1
execute if score #xvc.validate_packs.repeats xvc.op matches 1.. run function xylo_library:xvc/validate/validate_start_loop