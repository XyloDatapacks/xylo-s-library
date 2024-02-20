#> xylo_library:internal/blocks/tick
# @context: forceloaded command block at 29999999 0 12341233
# @within: #xylo_library:command_block_tick
#
# runs every tick on the command block subtick; detects when a custom block has been broken

# check if custom blocks have been broken or moved by a piston (note: this assumes that the block is never replaced with a /fill command)
execute as @e[type=minecraft:marker,tag=xlib.internal.blocks.custom_block] at @s if block ~ ~ ~ #xylo_library:empty_block run function xylo_library:internal/blocks/destroy/callback with entity @s data.xylo_library.block
