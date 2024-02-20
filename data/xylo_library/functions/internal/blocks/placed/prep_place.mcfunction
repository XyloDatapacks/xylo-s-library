#> xylo_library:internal/blocks/placed/prep_place
# @context: player that just placed a custom block player head
# @within: xylo_library:internal/blocks/placed/check_layer
#
# prepares the storage and scores for block placement
# located at the center of the block that was placed

# overwrite rotation if player is looking highly up or down
# key: direction of player
# 1: up, 2: down
execute store result score $x_rotation xlib.internal.blocks.block_data run data get entity @s Rotation[1]
execute if score $x_rotation xlib.internal.blocks.block_data matches -90..-45 run scoreboard players set $rotation xlib.internal.blocks.block_data 1
execute if score $x_rotation xlib.internal.blocks.block_data matches 45..90 run scoreboard players set $rotation xlib.internal.blocks.block_data 2

# store face placed on
# key: block face
# 1: up, 2: down, 3: north, 4: east, 5: south, 6: west
scoreboard players set $face_placement xlib.internal.blocks.block_data 1
execute if block ~ ~ ~ minecraft:player_head if score $x_rotation xlib.internal.blocks.block_data matches -90..0 run scoreboard players set $face_placement xlib.internal.blocks.block_data 2
execute if block ~ ~ ~ minecraft:player_wall_head[facing=north] run scoreboard players set $face_placement xlib.internal.blocks.block_data 3
execute if block ~ ~ ~ minecraft:player_wall_head[facing=east] run scoreboard players set $face_placement xlib.internal.blocks.block_data 4
execute if block ~ ~ ~ minecraft:player_wall_head[facing=south] run scoreboard players set $face_placement xlib.internal.blocks.block_data 5
execute if block ~ ~ ~ minecraft:player_wall_head[facing=west] run scoreboard players set $face_placement xlib.internal.blocks.block_data 6

data remove storage xylo_library:op place_callback
data modify storage xylo_library:op place_callback.path set from block ~ ~ ~ SkullOwner.Name

scoreboard players set $placed_block xlib.internal.blocks.block_data 0
scoreboard players remove $player_head_count xlib.internal.blocks.block_data 1

function xylo_library:internal/blocks/placed/callback with storage xylo_library:op place_callback

# prevent multi-machines
execute store result score $entity_count xlib.internal.blocks.block_data if entity @e[type=minecraft:marker,tag=xlib.internal.blocks.custom_block,distance=..0.1]
execute if score $entity_count xlib.internal.blocks.block_data matches 2.. run setblock ~ ~ ~ minecraft:air destroy
