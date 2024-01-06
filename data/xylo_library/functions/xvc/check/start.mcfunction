scoreboard objectives remove xvc.op 
scoreboard objectives remove xvc.load_status 

scoreboard objectives add xvc.op dummy
scoreboard objectives add xvc.load_status dummy

#get data
scoreboard players set #pack_count xvc.load_status -1
data remove storage xvc_version:op packs
function #xylo_library:xvc_load
function xylo_library:xvc/load
function xylo_projectiles:xvc/load
function xylo_items:xvc/load

#indentation for debug
data remove storage xvc_version:op indentation

#for each pack execute the check
data modify storage xvc_version:op macro_data set value {function:"xylo_library:xvc/check/check_pack",data:{}}
data modify storage xvc_version:op macro_data.array set from storage xvc_version:op packs
function xylo_library:utilities/for_each_loop/for_loop with storage xvc_version:op macro_data

