#> xylo_library:internal/blocks/placed_block
# @context: as & at player that just placed a custom block player head 
# @within: advancement reward xylo_library:internal/blocks/placed_block
#
# finds the player head that was placed by the player
# player head must have: {SkullOwner:{Name:"BLOCK_IDENTIFIER",Properties:{textures:[{Signature:"xylo_library_block"}]}}}
#
# centered on placed player head, the #xylo_library:custom_block_place tag is called.
# functions from this tag must begin as following:
#   execute unless score $placed_block xlib.internal.blocks.block_data matches 0 run return fail
#   execute unless data storage xylo_library:op {custom_block_id:"BLOCK_INDENTIFIER"} run return fail
#   scoreboard players set $placed_block xlib.internal.blocks.block_data 1
#   summon minecraft:marker ~ ~ ~ {Tags:["xlib.internal.blocks.custom_block","smithed.block","smithed.entity","smithed.strict","BLOCK_INDENTIFIER"],CustomName:'{"text":"<block name>"}'}

advancement revoke @s only xylo_library:internal/blocks/placed_block

# get rotation of player
# key: direction of player
# 3: north, 4: east, 5: south, 6: west
execute store result score $y_rotation xlib.internal.blocks.block_data run data get entity @s Rotation[0]
scoreboard players set $rotation xlib.internal.blocks.block_data 0

execute if score $y_rotation xlib.internal.blocks.block_data matches 45..135 run scoreboard players set $rotation xlib.internal.blocks.block_data 6
execute if score $rotation xlib.internal.blocks.block_data matches 0 if score $y_rotation xlib.internal.blocks.block_data matches -45..45 run scoreboard players set $rotation xlib.internal.blocks.block_data 5
execute if score $rotation xlib.internal.blocks.block_data matches 0 if score $y_rotation xlib.internal.blocks.block_data matches -135..-45 run scoreboard players set $rotation xlib.internal.blocks.block_data 4
execute if score $rotation xlib.internal.blocks.block_data matches 0 run scoreboard players set $rotation xlib.internal.blocks.block_data 3

# store cardinal y_rotation
scoreboard players operation $single_rotation xlib.internal.blocks.block_data = $rotation xlib.internal.blocks.block_data
scoreboard players remove $single_rotation xlib.internal.blocks.block_data 2

# find player heads in the specific region
scoreboard players set $player_head_count xlib.internal.blocks.block_data 0
execute if score $rotation xlib.internal.blocks.block_data matches 3 run function xylo_library:internal/blocks/placed/count_heads/north
execute if score $rotation xlib.internal.blocks.block_data matches 4 run function xylo_library:internal/blocks/placed/count_heads/east
execute if score $rotation xlib.internal.blocks.block_data matches 5 run function xylo_library:internal/blocks/placed/count_heads/south
execute if score $rotation xlib.internal.blocks.block_data matches 6 run function xylo_library:internal/blocks/placed/count_heads/west

# replace player heads with the corresponding block
scoreboard players set $layer_count xlib.internal.blocks.block_data 0
execute if score $player_head_count xlib.internal.blocks.block_data matches 1.. if score $rotation xlib.internal.blocks.block_data matches 3 align xyz positioned ~0.5 ~0.5 ~0.5 rotated 180 0 positioned ^-4 ^-4 ^-1 run function xylo_library:internal/blocks/placed/check_layer
execute if score $player_head_count xlib.internal.blocks.block_data matches 1.. if score $rotation xlib.internal.blocks.block_data matches 4 align xyz positioned ~0.5 ~0.5 ~0.5 rotated -90 0 positioned ^-4 ^-4 ^-1 run function xylo_library:internal/blocks/placed/check_layer
execute if score $player_head_count xlib.internal.blocks.block_data matches 1.. if score $rotation xlib.internal.blocks.block_data matches 5 align xyz positioned ~0.5 ~0.5 ~0.5 rotated 0 0 positioned ^-4 ^-4 ^-1 run function xylo_library:internal/blocks/placed/check_layer
execute if score $player_head_count xlib.internal.blocks.block_data matches 1.. if score $rotation xlib.internal.blocks.block_data matches 6 align xyz positioned ~0.5 ~0.5 ~0.5 rotated 90 0 positioned ^-4 ^-4 ^-1 run function xylo_library:internal/blocks/placed/check_layer
