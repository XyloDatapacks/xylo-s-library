#get item
data modify storage xylo_items:op thrown_item set from storage xylo_library:op player_data.SelectedItem
#clear selected item slot
data remove storage xylo_library:op player_data.SelectedItem
execute if score @s xlib.player.selected_slot matches 0 run data remove storage xylo_library:op player_data.Inventory[{Slot:0b}]
execute if score @s xlib.player.selected_slot matches 1 run data remove storage xylo_library:op player_data.Inventory[{Slot:1b}]
execute if score @s xlib.player.selected_slot matches 2 run data remove storage xylo_library:op player_data.Inventory[{Slot:2b}]
execute if score @s xlib.player.selected_slot matches 3 run data remove storage xylo_library:op player_data.Inventory[{Slot:3b}]
execute if score @s xlib.player.selected_slot matches 4 run data remove storage xylo_library:op player_data.Inventory[{Slot:4b}]
execute if score @s xlib.player.selected_slot matches 5 run data remove storage xylo_library:op player_data.Inventory[{Slot:5b}]
execute if score @s xlib.player.selected_slot matches 6 run data remove storage xylo_library:op player_data.Inventory[{Slot:6b}]
execute if score @s xlib.player.selected_slot matches 7 run data remove storage xylo_library:op player_data.Inventory[{Slot:7b}]
execute if score @s xlib.player.selected_slot matches 8 run data remove storage xylo_library:op player_data.Inventory[{Slot:8b}]
#clear item from inventory
item replace entity @s weapon.mainhand with minecraft:air

execute at @s anchored eyes positioned ^ ^ ^ run function xylo_items:item_class/throwable/throw/start
