#> xylo_library:internal/blocks/place/place
# @context: any
# @within: xylo_library:internal/blocks/place/move_at_place_position
# @input: "xylo_library:op place_block"
# @macro: place_callback

# if non valid block, fail
execute unless block ~ ~ ~ #xylo_library:air_like run return fail

# call place function and return result
$execute store result score #xlib.internal.blocks.place.place.result xlib.op run function $(place_callback)
return run scoreboard players get #xlib.internal.blocks.place.place.result xlib.op
