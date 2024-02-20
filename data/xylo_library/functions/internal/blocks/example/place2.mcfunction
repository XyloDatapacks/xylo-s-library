#> xylo_library:internal/blocks/example/place2
# @context: at placing position
# @within: xylo_library:internal/blocks/placed/callback

# give @s minecraft:player_head{display:{Name:'{"text":"Custom Block","italic":false}'},SkullOwner:{Name:"xylo_library:internal/blocks/example/place2",Properties:{textures:[{Signature:"xylo_library_block"}]}}}

setblock ~ ~ ~ minecraft:stone_bricks
summon minecraft:marker ~ ~0.5 ~ {data:{xylo_library:{block:{destroy_callback:"xylo_library:internal/blocks/example/destroy2"}}},CustomName:'{"text":"example block"}',Tags:["xlib.internal.blocks.custom_block","smithed.block","smithed.entity","smithed.strict"]}
