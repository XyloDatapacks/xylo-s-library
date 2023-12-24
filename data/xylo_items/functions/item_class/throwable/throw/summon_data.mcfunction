# <@> display

#==<display data>==#
tag @s remove xitm.item_class.throwable.display_new
data modify entity @s item set from storage xylo_items:op thrown_item
data modify entity @s Tags append from storage xylo_items:op thrown_data.proj_tags[]
data modify entity @s transformation set from storage xylo_items:op thrown_data.transformatio
data modify entity @s item_display set from storage xylo_items:op thrown_data.item_display
#brightness:{block:15,sky:15}

#==<projectile data>==#
execute on vehicle run data modify entity @s NoGravity set from storage xylo_items:op thrown_data.NoGravity

#==<projectile correction>==#

tp @s ~ ~ ~ ~ ~
# for proj correction
data remove storage xylo_projectiles:op projectile_correction_setup
data modify storage xylo_projectiles:op projectile_correction_setup.motion set from storage xylo_items:op macro_data.motion
function xylo_projectiles:position_correction/setup/start_no_owner
