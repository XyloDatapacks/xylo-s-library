$execute if score $$(namespace) xvc.load_status matches 0 run scoreboard players set #xvc.validate_packs.error xvc.op 1

#loop
data remove storage xvc_version:op validate_packs[-1].required[-1]
scoreboard players remove #xvc.verify_packs.number xvc.op 1
execute if score #xvc.verify_packs.number xvc.op matches 1.. run function xylo_library:xvc/validate/verify_loop with storage xvc_version:op validate_packs[-1].required[-1]
