# "xylo_items:op thrown_item" -> tag.xylo_items.throw
#   power: the absolute value of the motion
#   correct_landing: true/false to apply projectile correction or not
#   NoGravity: true/false to disable gravity or not
#
#   proj_tags: list of tags to add to display entity
#   transformation: transformation to apply to display entity
#   item_display: how the item is displayed (fixed, head, ...)
#
#   passenger: {id: .. , data:{...} }
#       id: id of the passenger entity
#       data: compound with entity data
#   function: function to run as the display entity at the projectile position


# in: "xylo_items:op thrown_item"

data modify storage xylo_items:op thrown_data set from storage xylo_items:op thrown_item.tag.xylo_items.throw

# get motion 
data remove storage xylo_items:op macro_data
data modify storage xylo_items:op macro_data.power set from storage xylo_items:op thrown_data.power
function xylo_items:item_class/throwable/throw/motion/_motion with storage xylo_items:op macro_data
# for proj correction
data remove storage xylo_projectiles:op projectile_correction_setup
data modify storage xylo_projectiles:op projectile_correction_setup.motion set from storage xylo_items:op macro_data.motion

# get owner
data modify storage xylo_items:op macro_data.owner set from storage xylo_library:op player_data.UUID
# get owner hex
data modify storage gu:main in set from storage xylo_library:op player_data.UUID
function xylo_library:utilities/uuid/generate_from_storage
data modify storage xylo_items:op macro_data.shooter set from storage gu:main out


# summon and apply data
execute store result score #xitm.item_class.throwable.throw.correction xitm.op if data storage xylo_items:op thrown_data.correct_landing
execute if score #xitm.item_class.throwable.throw.correction xitm.op matches 1 run function xylo_items:item_class/throwable/throw/summon with storage xylo_items:op macro_data
execute if score #xitm.item_class.throwable.throw.correction xitm.op matches 0 run function xylo_items:item_class/throwable/throw/summon_no_correction with storage xylo_items:op macro_data