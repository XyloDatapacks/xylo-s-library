#> xylo_library:internal/blocks/destroy/callback
# @context: player that just placed a custom block player head
# @within: xylo_library:internal/blocks/tick
# @macro: destroy_callback

tag @s remove xlib.internal.blocks.custom_block
$function $(destroy_callback)
