tag @s remove xlib.internal.clone_new

# set aoe origin
execute on vehicle run tp @s ~ ~ ~ ~ ~
execute on vehicle run data modify entity @s Owner set from storage xylo_library:op clone_data.player_uuid
# set player hex uuid on marker
execute on vehicle on passengers if entity @s[type=minecraft:marker] run data modify entity @s data.xylo_library.clone.owner_uuid set from storage xylo_library:op clone_data.player_hex_uuid
# get marker hex uuid
execute on vehicle on passengers if entity @s[type=minecraft:marker] run function xylo_library:utilities/uuid/generate
data modify storage xylo_library:op clone_data.uuid set from storage gu:main out

# armor
item replace entity @s armor.head from entity @a[tag=xlib.internal.clone.player,limit=1] armor.head
item replace entity @s armor.chest from entity @a[tag=xlib.internal.clone.player,limit=1] armor.chest
item replace entity @s armor.legs from entity @a[tag=xlib.internal.clone.player,limit=1] armor.legs
item replace entity @s armor.feet from entity @a[tag=xlib.internal.clone.player,limit=1] armor.feet
item replace entity @s weapon.mainhand from entity @a[tag=xlib.internal.clone.player,limit=1] weapon.mainhand
item replace entity @s weapon.offhand from entity @a[tag=xlib.internal.clone.player,limit=1] weapon.offhand

# body life time
scoreboard players operation #xlib.internal.clone.generate.end_time xlib.op = #xlib.time xlib.op
scoreboard players operation #xlib.internal.clone.generate.end_time xlib.op += #xlib.internal.clone.generate.duration xlib.op 
execute on vehicle on passengers if entity @s[type=minecraft:marker] run scoreboard players operation @s xlib.internal.clone.generate.end_time = #xlib.internal.clone.generate.end_time xlib.op

