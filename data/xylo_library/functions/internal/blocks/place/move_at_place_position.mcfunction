#> xylo_library:internal/blocks/place/move_at_place_position
# @context: any
# @within: xylo_library:internal/blocks/place/start
# @macro: x, y, z
# @input: "xylo_library:op place_block"

$execute at @s positioned $(x) $(y) $(z) align xyz positioned ~0.5 ~ ~0.5 store result score #xlib.internal.blocks.place.move_at_place_position.result xlib.op run function xylo_library:internal/blocks/place/place with storage xylo_library:op place_block.tag.xylo_library.block
return run scoreboard players get #xlib.internal.blocks.place.move_at_place_position.result xlib.op
