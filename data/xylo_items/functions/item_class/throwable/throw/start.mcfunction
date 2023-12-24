# in: "xylo_items:op thrown_item"

data modify storage xylo_items:op thrown_data set from storage xylo_items:op thrown_item.tag.xylo_items.throw

# get motion 
data remove storage xylo_items:op macro_data
data modify storage xylo_items:op macro_data.power set from storage xylo_items:op thrown_data.power
function xylo_items:item_class/throwable/throw/motion/_motion with storage xylo_items:op macro_data

# get owner
data modify storage xylo_items:op macro_data.owner set from storage xylo_library:op player_data.UUID
# get owner hex
data modify storage gu:main in set from storage xylo_library:op player_data.UUID
function xylo_library:utilities/uuid/generate_from_storage
data modify storage xylo_items:op macro_data.shooter set from storage gu:main out
# passengers
data modify storage xylo_items:op macro_data.passenger set value ""
data modify storage xylo_items:op macro_data.passenger set from storage xylo_items:op thrown_data.passenger


# summon and apply data
execute store result score #xitm.item_class.throwable.throw.correction xitm.op if data storage xylo_items:op thrown_data.correct_landing
execute if score #xitm.item_class.throwable.throw.correction xitm.op matches 1 run function xylo_items:item_class/throwable/throw/summon with storage xylo_items:op macro_data
execute if score #xitm.item_class.throwable.throw.correction xitm.op matches 0 run function xylo_items:item_class/throwable/throw/summon_no_correction with storage xylo_items:op macro_data