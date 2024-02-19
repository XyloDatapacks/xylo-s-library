#> xylo_library:internal/blocks/tick
# @context: forceloaded command block at 29999999 0 12341233
# @within: #xylo_library:command_block_tick
#
# runs every tick on the command block subtick; detects when a custom block has been broken
# functions called by the #xylo_library:custom_block_destroy tag must begin with:
#   execute unless entity @s[tag=!BLOCK_INDENTIFIER] run return fail

# check if custom blocks have been broken or moved by a piston (note: this assumes that the block is never replaced with a /fill command)
execute as @e[type=minecraft:marker,tag=xlib.internal.blocks.custom_block] at @s if block ~ ~ ~ #xylo_library:empty_block run function #xylo_library:custom_block_destroy
