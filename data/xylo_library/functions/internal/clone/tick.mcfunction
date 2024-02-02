execute on vehicle on passengers run effect clear @s[tag=xlib.internal.clone.hitbox] glowing
scoreboard players set #xlib.internal.clone.tick.hitbox_death xlib.op 0
execute on vehicle on passengers if entity @s[tag=xlib.internal.clone.hitbox,nbt={Health:0.0f}] store success score #xlib.internal.clone.tick.hitbox_death xlib.op run tag @s add xlib.internal.clone.hitbox.death
execute if score #xlib.internal.clone.tick.hitbox_death xlib.op matches 1 run function xylo_library:internal/clone/export/update_storage with entity @s data.xylo_library.clone

