tag @s add xlib.utilities.un_agro.player
execute as @e[type=!#xylo_library:non_mob,predicate=xylo_library:utilities/un_agro/select] run function xylo_library:utilities/un_agro/apply
tag @s remove xlib.utilities.un_agro.player