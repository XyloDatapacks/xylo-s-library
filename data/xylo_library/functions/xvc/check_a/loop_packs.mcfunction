#required
data modify storage xvc_version:op check_loop_packs[-1].required[].is_checking_namespace set from storage xvc_version:op check_loop_packs[-1].namespace
execute store result score #xvc.check_required.number xvc.op run data get storage xvc_version:op check_loop_packs[-1].required
execute if score #xvc.check_required.number xvc.op matches 1.. run function xylo_library:xvc/check/check_required_loop with storage xvc_version:op check_loop_packs[-1].required[-1]



#loop
data remove storage xvc_version:op check_loop_packs[-1]
scoreboard players remove #xvc.check.loop_packs xvc.op 1
execute if score #xvc.check.loop_packs xvc.op matches 1.. run function xylo_library:xvc/check/loop_packs