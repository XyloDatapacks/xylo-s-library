#> xylo_library:internal/blocks/placed/count_heads/north
# @context: player that just placed a custom block player head
# @within: xylo_library:internal/blocks/placed_block
#
# counts the number of players heads
# located at @s

execute store result score $player_head_add xlib.internal.blocks.block_data run clone ~-4 ~-4 ~-4 ~4 ~-4 ~1 ~-4 ~-4 ~-4 filtered #xylo_library:player_heads{SkullOwner:{Properties:{textures:[{Signature:"xylo_library_block"}]}}} force
scoreboard players operation $player_head_count xlib.internal.blocks.block_data += $player_head_add xlib.internal.blocks.block_data
execute store result score $player_head_add xlib.internal.blocks.block_data run clone ~-4 ~-3 ~-4 ~4 ~-3 ~1 ~-4 ~-3 ~-4 filtered #xylo_library:player_heads{SkullOwner:{Properties:{textures:[{Signature:"xylo_library_block"}]}}} force
scoreboard players operation $player_head_count xlib.internal.blocks.block_data += $player_head_add xlib.internal.blocks.block_data
execute store result score $player_head_add xlib.internal.blocks.block_data run clone ~-4 ~-2 ~-4 ~4 ~-2 ~1 ~-4 ~-2 ~-4 filtered #xylo_library:player_heads{SkullOwner:{Properties:{textures:[{Signature:"xylo_library_block"}]}}} force
scoreboard players operation $player_head_count xlib.internal.blocks.block_data += $player_head_add xlib.internal.blocks.block_data
execute store result score $player_head_add xlib.internal.blocks.block_data run clone ~-4 ~-1 ~-4 ~4 ~-1 ~1 ~-4 ~-1 ~-4 filtered #xylo_library:player_heads{SkullOwner:{Properties:{textures:[{Signature:"xylo_library_block"}]}}} force
scoreboard players operation $player_head_count xlib.internal.blocks.block_data += $player_head_add xlib.internal.blocks.block_data
execute store result score $player_head_add xlib.internal.blocks.block_data run clone ~-4 ~ ~-4 ~4 ~ ~1 ~-4 ~ ~-4 filtered #xylo_library:player_heads{SkullOwner:{Properties:{textures:[{Signature:"xylo_library_block"}]}}} force
scoreboard players operation $player_head_count xlib.internal.blocks.block_data += $player_head_add xlib.internal.blocks.block_data
execute store result score $player_head_add xlib.internal.blocks.block_data run clone ~-4 ~1 ~-4 ~4 ~1 ~1 ~-4 ~1 ~-4 filtered #xylo_library:player_heads{SkullOwner:{Properties:{textures:[{Signature:"xylo_library_block"}]}}} force
scoreboard players operation $player_head_count xlib.internal.blocks.block_data += $player_head_add xlib.internal.blocks.block_data
execute store result score $player_head_add xlib.internal.blocks.block_data run clone ~-4 ~2 ~-4 ~4 ~2 ~1 ~-4 ~2 ~-4 filtered #xylo_library:player_heads{SkullOwner:{Properties:{textures:[{Signature:"xylo_library_block"}]}}} force
scoreboard players operation $player_head_count xlib.internal.blocks.block_data += $player_head_add xlib.internal.blocks.block_data
execute store result score $player_head_add xlib.internal.blocks.block_data run clone ~-4 ~3 ~-4 ~4 ~3 ~1 ~-4 ~3 ~-4 filtered #xylo_library:player_heads{SkullOwner:{Properties:{textures:[{Signature:"xylo_library_block"}]}}} force
scoreboard players operation $player_head_count xlib.internal.blocks.block_data += $player_head_add xlib.internal.blocks.block_data
execute store result score $player_head_add xlib.internal.blocks.block_data run clone ~-4 ~4 ~-4 ~4 ~4 ~1 ~-4 ~4 ~-4 filtered #xylo_library:player_heads{SkullOwner:{Properties:{textures:[{Signature:"xylo_library_block"}]}}} force
scoreboard players operation $player_head_count xlib.internal.blocks.block_data += $player_head_add xlib.internal.blocks.block_data
execute store result score $player_head_add xlib.internal.blocks.block_data run clone ~-4 ~5 ~-4 ~4 ~5 ~1 ~-4 ~5 ~-4 filtered #xylo_library:player_heads{SkullOwner:{Properties:{textures:[{Signature:"xylo_library_block"}]}}} force
scoreboard players operation $player_head_count xlib.internal.blocks.block_data += $player_head_add xlib.internal.blocks.block_data
execute store result score $player_head_add xlib.internal.blocks.block_data run clone ~-4 ~6 ~-4 ~4 ~6 ~1 ~-4 ~6 ~-4 filtered #xylo_library:player_heads{SkullOwner:{Properties:{textures:[{Signature:"xylo_library_block"}]}}} force
scoreboard players operation $player_head_count xlib.internal.blocks.block_data += $player_head_add xlib.internal.blocks.block_data
