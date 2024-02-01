# <@> hitbox entity
# in: "xylo_library:op clone_input_data"

# automatically called in generate/start
# gets data from clone_input_data and sets it to the hitbox entity
# clone_input_data should contain a struct with various player info like active_effects and such

#==<Set Effects>==#
# fix invis time
execute store result score @s xlib.internal.clone.import.invis_time run data get storage xylo_library:op clone_input_data.active_effects[{id:"minecraft:invisibility"}].duration
execute if data storage xylo_library:op clone_input_data.active_effects[{id:"minecraft:invisibility"}] run data modify storage xylo_library:op clone_input_data.active_effects[{id:"minecraft:invisibility"}].duration set value -1
# apply
data modify entity @s active_effects set from storage xylo_library:op clone_input_data.active_effects

#==<Set Armor>==#
# TODO: to be replaced with actual solution which uses data from storage
item replace entity @s armor.head from entity @a[tag=xlib.internal.clone.player,limit=1] armor.head
item replace entity @s armor.chest from entity @a[tag=xlib.internal.clone.player,limit=1] armor.chest
item replace entity @s armor.legs from entity @a[tag=xlib.internal.clone.player,limit=1] armor.legs
item replace entity @s armor.feet from entity @a[tag=xlib.internal.clone.player,limit=1] armor.feet

#==<Set Attributes>==#
# TODO: pass attributes
# ...

#==<Set Health>==#
# TODO: pass health
