tag @s remove xlib.internal.clone_new

execute on vehicle positioned ~ ~10000 ~ run ride @e[type=minecraft:wandering_trader,distance=..0.001,tag=xlib.internal.clone_new,limit=1] mount @s
execute on vehicle on passengers run tag @s[type=minecraft:wandering_trader] remove xlib.internal.clone_new

#==<Pass Owner UUID>==#

# set aoe origin
execute on vehicle run tp @s ~ ~ ~ ~ ~
execute on vehicle run data modify entity @s Owner set from storage xylo_library:op clone_data.player_uuid
# set player hex uuid on marker
execute on vehicle on passengers if entity @s[type=minecraft:marker] run data modify entity @s data.xylo_library.clone.player_hex_uuid set from storage xylo_library:op clone_data.player_hex_uuid 

#==<Get Pointers>==#

# get marker hex uuid
execute on vehicle on passengers if entity @s[type=minecraft:marker] run function xylo_library:utilities/uuid/generate
data modify storage xylo_library:op clone_data.marker_hex_uuid set from storage gu:main out
execute on vehicle on passengers if entity @s[type=minecraft:marker] run data modify entity @s data.xylo_library.clone.marker_hex_uuid set from storage xylo_library:op clone_data.marker_hex_uuid

# get hitbox hex uuid
execute on vehicle on passengers if entity @s[tag=xlib.internal.clone.hitbox] run function xylo_library:utilities/uuid/generate
data modify storage xylo_library:op clone_data.hitbox_hex_uuid set from storage gu:main out

#==<Set Entities Data>==#

# aoe tags
execute on vehicle run data modify entity @s Tags append from storage xylo_library:op clone_input_data.aoe.tags[]
# marker tags & data
execute on vehicle on passengers if entity @s[type=minecraft:marker] run data modify entity @s Tags append from storage xylo_library:op clone_input_data.marker.tags[]
execute on vehicle on passengers if entity @s[type=minecraft:marker] run data modify entity @s data merge from storage xylo_library:op clone_input_data.marker.data
# hitbox tags
execute on vehicle on passengers if entity @s[tag=xlib.internal.clone.hitbox] run data modify entity @s Tags append from storage xylo_library:op clone_input_data.hitbox.tags[]


# armor
item replace entity @s armor.head from entity @a[tag=xlib.internal.clone.player,limit=1] armor.head
item replace entity @s armor.chest from entity @a[tag=xlib.internal.clone.player,limit=1] armor.chest
item replace entity @s armor.legs from entity @a[tag=xlib.internal.clone.player,limit=1] armor.legs
item replace entity @s armor.feet from entity @a[tag=xlib.internal.clone.player,limit=1] armor.feet
item replace entity @s weapon.mainhand from entity @a[tag=xlib.internal.clone.player,limit=1] weapon.mainhand
item replace entity @s weapon.offhand from entity @a[tag=xlib.internal.clone.player,limit=1] weapon.offhand

# clone life time
execute store result score #xlib.internal.clone.generate.duration xlib.op run data get storage xylo_library:op clone_input_data.duration
scoreboard players operation #xlib.internal.clone.generate.end_time xlib.op = #xlib.time xlib.op
scoreboard players operation #xlib.internal.clone.generate.end_time xlib.op += #xlib.internal.clone.generate.duration xlib.op 
execute on vehicle on passengers if entity @s[type=minecraft:marker] run scoreboard players operation @s xlib.internal.clone.generate.end_time = #xlib.internal.clone.generate.end_time xlib.op
execute on vehicle on passengers if entity @s[type=minecraft:marker] run scoreboard players operation @s xlib.internal.clone.generate.start_time = #xlib.time xlib.op

# import player data to entity
execute on vehicle on passengers if entity @s[tag=xlib.internal.clone.hitbox] run function xylo_library:internal/clone/import/start