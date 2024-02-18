# load
scoreboard players set $xylo_library xvc.load_status 1
data modify storage xvc_version:op packs append value {namespace:"xylo_library",version:10000,name:"Xylo's Library"}
execute store result storage xvc_version:op packs[-1].index int 1 run scoreboard players add #pack_count xvc.load_status 1

# required packs
#data modify storage xvc_version:op packs[-1].supported append value {namespace:"example",version:10000}

# supported packs
data modify storage xvc_version:op packs[-1].supported append value {namespace:"xylo_items",version:10000}
data modify storage xvc_version:op packs[-1].supported append value {namespace:"xylo_projectiles",version:10000}
data modify storage xvc_version:op packs[-1].supported append value {namespace:"energy_manipulation",version:10000}
data modify storage xvc_version:op packs[-1].supported append value {namespace:"xylo_rpg_core",version:10000}
data modify storage xvc_version:op packs[-1].supported append value {namespace:"xylo_health_bar",version:10000}