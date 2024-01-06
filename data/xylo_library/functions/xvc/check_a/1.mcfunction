#init data
execute store result score #xvc.check.packs_number xvc.op run data get storage xvc_version:op packs
scoreboard players set #xvc.check.elaborating_index xvc.op 0
#loop
data remove storage xvc_version:op macro_data
execute store result storage xvc_version:op macro_data.packs_number int 1 run scoreboard players get #xvc.check.packs_number xvc.op
execute store result storage xvc_version:op macro_data.elaborating_index int 1 run scoreboard players get #xvc.check.elaborating_index xvc.op
execute if score #xvc.check.packs_number xvc.op > #xvc.check.elaborating_index xvc.op run function xylo_library:xvc/check/2


#for p in packs:
#   check required(p):
#       for check in required:
#           version = pack[namespace:$(check.namespace)}]
#           min_version = check.version
#           unless version >= min_version return
#           
#           check required (check)
#   check supported(p)   