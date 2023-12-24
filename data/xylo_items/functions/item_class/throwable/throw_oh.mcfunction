#get item
data modify storage xylo_items:op thrown_item set from storage xylo_library:op player_data.Inventory[{Slot:-106b}]
#clear selected item slot
data remove storage xylo_library:op player_data.Inventory[{Slot:-106b}]
#clear item from inventory
item replace entity @s weapon.offhand with minecraft:air

execute at @s anchored eyes positioned ^ ^ ^ run function xylo_items:item_class/throwable/throw/start
