#> xylo_library:internal/blocks/example/place2
# @context: at placing position
# @within: xylo_library:internal/blocks/placed/check_layer

#  give @s minecraft:player_head{SkullOwner:{Name:"xylo_library_test_block",Properties:{textures:[{Signature:"xylo_library_block"}]}}}

execute unless score $placed_block xlib.internal.blocks.block_data matches 0 run return fail
execute unless data storage xylo_library:op {custom_block_id:"xylo_library_test_block"} run return fail
scoreboard players set $placed_block xlib.internal.blocks.block_data 1
summon minecraft:marker ~ ~ ~ {Tags:["xlib.internal.blocks.custom_block","smithed.block","smithed.entity","smithed.strict","xylo_library_test_block"],CustomName:'{"text":"xylo_library_test_block"}'}
setblock ~ ~ ~ minecraft:stone_bricks