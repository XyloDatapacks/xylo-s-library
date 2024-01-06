#for each pack execute the check
data modify storage xvc_version:op macro_data set value {function:"xylo_library:xvc/check/check_pack",data:{}}
data modify storage xvc_version:op macro_data.array set from storage xvc_version:op packs
function xylo_library:utilities/for_each_loop/for_loop with storage xvc_version:op macro_data

