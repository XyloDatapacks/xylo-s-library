# <@> hitbox entity
# out: "xylo_library:op clone_output_data" (adds on the storage)

# called by dispose/remove_from_player_storage_and_kill
# gets data from the hitbox entity and updates storage

#==<Get Effects>==#
data modify storage xylo_library:op clone_output_data.active_effects set from entity @s active_effects
# fix invis time
execute on vehicle on passengers if entity @s[type=minecraft:marker,tag=xlib.internal.clone] run scoreboard players operation #xlib.internal.clone.export.invis_time xlib.op = @s xlib.internal.clone.generate.start_time
scoreboard players operation #xlib.internal.clone.export.invis_time xlib.op -= #xlib.time xlib.op
scoreboard players operation #xlib.internal.clone.export.invis_time xlib.op += @s xlib.internal.clone.import.invis_time
scoreboard players operation #xlib.internal.clone.export.invis_time xlib.op > #0 xconst
execute if score #xlib.internal.clone.export.invis_time xlib.op matches 1.. store result storage xylo_library:op clone_output_data.active_effects[{id:"minecraft:invisibility"}].duration int 1 run scoreboard players get #xlib.internal.clone.export.invis_time xlib.op
execute unless score #xlib.internal.clone.export.invis_time xlib.op matches 1.. run data remove storage xylo_library:op clone_output_data.active_effects[{id:"minecraft:invisibility"}]

#==<Get Armor>==#
# TODO: update equipment in storage

#==<Get Health>==#
# TODO: update health
