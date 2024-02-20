#> xylo_library:internal/blocks/example/destroy2
# @context: at placing position
# @within: xylo_library:internal/blocks/tick


execute positioned ~-0.5 ~-0.5 ~-0.5 run kill @e[type=minecraft:item,limit=1,dx=0,nbt={Item:{id:"minecraft:stone_bricks",Count:1b}}]
summon item ~ ~ ~ {Item:{id:"minecraft:player_head",Count:1b,tag:{display:{Name:'{"text":"Custom Block","italic":false}'},SkullOwner:{Name:"xylo_library:internal/blocks/example/place2",Properties:{textures:[{Signature:"xylo_library_block"}]}}}}}
kill @s
