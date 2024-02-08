# <@> item display

data remove storage xylo_items:op macro_data
execute store result storage xylo_items:op macro_data.damage double 0.001 run scoreboard players get @s xitm.item_class.throwable.damage
data modify storage xylo_items:op macro_data.uuid set from storage xylo_projectiles:op entity_hit.uuid

function xylo_items:item_class/throwable/damage/apply with storage xylo_items:op macro_data