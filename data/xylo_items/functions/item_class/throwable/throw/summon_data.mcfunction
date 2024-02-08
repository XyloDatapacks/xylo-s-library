# <@> display

#==<display data>==#
tag @s remove xitm.item_class.throwable.display_new
data modify entity @s item set from storage xylo_items:op thrown_item
data modify entity @s Tags append from storage xylo_items:op thrown_data.proj_tags[]
data modify entity @s transformation set from storage xylo_items:op thrown_data.transformation
data modify entity @s item_display set from storage xylo_items:op thrown_data.item_display
execute store result score @s xitm.item_class.throwable.damage run data get storage xylo_items:op thrown_data.damage 1000
#brightness:{block:15,sky:15}

#==<Passenger>==#
data modify storage xylo_items:op thrown_data.passenger.data.Tags append value xitm.throwable.throw.add_passenger_new
execute positioned ~ ~10000 ~ run function xylo_items:item_class/throwable/throw/add_passenger with storage xylo_items:op thrown_data.passenger

#==<projectile data>==#
execute on vehicle run data modify entity @s NoGravity set from storage xylo_items:op thrown_data.NoGravity

#==<projectile correction>==#
tp @s ~ ~ ~ ~ ~
# for proj correction (already setup input storage in start function)
function xylo_projectiles:position_correction/setup/start_no_owner
execute on passengers run data modify entity @s[type=minecraft:marker,tag=xproj.position_correction] data.xylo_projectiles.position_correction.callback set from storage xylo_items:op thrown_data.hit_callback

#==<Function Call>==#
#function
data remove storage xylo_items:op macro_data 
data modify storage xylo_items:op macro_data.function set from storage xylo_items:op thrown_data.throw_callback
function xylo_items:item_class/throwable/throw/call_function with storage xylo_items:op macro_data