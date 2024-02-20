#> xylo_library:internal/blocks/place_offhand
# @context: player with item in offhand
# @within: any
#
# item must have {xylo_library:{block:{place_callback:"<function path>",consume_on_use:<bool>}}}
# place callback function must return 1 if place was successful

# get held item
data remove storage xylo_library:op place_block
execute in overworld run item replace block 29999999 0 12341232 container.0 from entity @s weapon.offhand
execute in overworld run data modify storage xylo_library:op place_block set from block 29999999 0 12341232 Items[{Slot:0b}]
# if no item found, then fail
execute unless data storage xylo_library:op place_block.tag.xylo_library.block run return fail
# if unable to place, then fail
execute unless function xylo_library:internal/blocks/place/start run return fail

# if placed, remove one from hand
execute unless data storage xylo_library:op place_block.tag.xylo_library.block{consume_on_use:0b} run item modify entity @s weapon.offhand xylo_library:remove_count/1
return 1
