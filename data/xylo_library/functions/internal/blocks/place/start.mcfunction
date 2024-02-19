#> xylo_library:internal/blocks/place/start
# @context: as player
# @within: xylo_library:internal/blocks/place_mainhand || xylo_library:internal/blocks/place_offhand
# @input: "xylo_library:op place_block"


# get place settings
data remove storage xylo_library:op place_block_settings 
execute store result storage xylo_library:op place_block_settings.MaxDistance double 1 run attribute @s minecraft:player.block_interaction_range get
# get coordinates. if unable to find block, then fail
execute unless function xylo_library:internal/blocks/place/raycast run return fail

# save place coordinates to use as macro input
data remove storage xylo_library:op macro_data 
data modify storage xylo_library:op macro_data.x set from storage xylo_iris:output PlacePosition.tile[0]
data modify storage xylo_library:op macro_data.y set from storage xylo_iris:output PlacePosition.tile[1]
data modify storage xylo_library:op macro_data.z set from storage xylo_iris:output PlacePosition.tile[2]
# change position to the coordinates found. returns place result (can fail if position is invalid)
execute store result score #xlib.internal.blocks.place.start.result xlib.op run function xylo_library:internal/blocks/place/move_at_place_position with storage xylo_library:op macro_data
return run scoreboard players get #xlib.internal.blocks.place.start.result xlib.op
