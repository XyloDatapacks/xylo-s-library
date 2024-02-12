#> xylo_items:item_class/throwable/throw/start
# @context: player in player tick 
# @within: xylo_items:item_class/throwable/throw_mh, xylo_items:item_class/throwable/throw_oh

# "xylo_items:op thrown_item" -> tag.xylo_items.throw
#   power: the absolute value of the motion
#   NoGravity: true/false to disable gravity or not
#
#   proj_tags: list of tags to add to display entity
#   transformation: transformation to apply to display entity
#   item_display: how the item is displayed (fixed, head, ...)
#
#   correct_landing: true/false to apply projectile correction or not
#   hit_callback: function run on projectile correction
#   damage: set damage score. for automated damage: {damage:<dmg>,correct_landing:1b,hit_callback:"xylo_items:item_class/throwable/damage/callback"}
#
#   passenger: {id: .. , data:{...} }
#       id: id of the passenger entity
#       data: compound with entity data
#   throw_callback: function to run as the display entity at the projectile position


# in: "xylo_items:op thrown_item": Read Only

data modify storage xylo_items:op thrown_data set from storage xylo_items:op thrown_item.tag.xylo_items.throw

#==<Xylo Rpg Core>==#

# xylo_rpg_core: dexterity.range_damage
scoreboard players set #xitm.item_class.throwable.throw.xrpgc_damage_mult xitm.op 0
execute if score @s xrpgc.skills.dexterity.range_damage = @s xrpgc.skills.dexterity.range_damage run scoreboard players operation #xitm.item_class.throwable.throw.xrpgc_damage_mult xitm.op = @s xrpgc.skills.dexterity.range_damage
scoreboard players add #xitm.item_class.throwable.throw.xrpgc_damage_mult xitm.op 100

execute store result score #xitm.item_class.throwable.throw.damage xitm.op run data get storage xylo_items:op thrown_data.damage 1000
execute store result storage xylo_items:op thrown_data.damage double 0.00001 run scoreboard players operation #xitm.item_class.throwable.throw.damage xitm.op *= #xitm.item_class.throwable.throw.xrpgc_damage_mult xitm.op

# xylo_rpg_core: weight 
scoreboard players set #xitm.item_class.throwable.throw.xrpgc_weight xitm.op 0
execute if score @s xrpgc.equipment.weight = @s xrpgc.equipment.weight run scoreboard players operation #xitm.item_class.throwable.throw.xrpgc_weight xitm.op = @s xrpgc.equipment.weight
scoreboard players add #xitm.item_class.throwable.throw.xrpgc_weight xitm.op 10

execute store result score #xitm.item_class.throwable.throw.power xitm.op run data get storage xylo_items:op thrown_data.power 10000
execute store result storage xylo_items:op thrown_data.power double 0.001 run scoreboard players operation #xitm.item_class.throwable.throw.power xitm.op /= #xitm.item_class.throwable.throw.xrpgc_weight xitm.op

#-------------------#

# init macro storage
data modify storage xylo_items:op macro_data set value {x:0,y:0,z:0}

# get motion 
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

# offset
data modify storage xylo_items:op macro_data merge from storage xylo_items:op thrown_data.offset

# summon and apply data
execute store success score #xitm.item_class.throwable.throw.correction xitm.op if data storage xylo_items:op thrown_data{correct_landing:1b}
execute if score #xitm.item_class.throwable.throw.correction xitm.op matches 1 run function xylo_items:item_class/throwable/throw/summon with storage xylo_items:op macro_data
execute if score #xitm.item_class.throwable.throw.correction xitm.op matches 0 run function xylo_items:item_class/throwable/throw/summon_no_correction with storage xylo_items:op macro_data