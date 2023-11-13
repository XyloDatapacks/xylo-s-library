execute if score @s xlib.player.selected_slot matches 0 store result score #xitm.track_item.swap_time xitm.op run data get storage xylo_items:op register_item_inventory[{Slot:0b}].tag.xylo_items.swap_time
execute if score @s xlib.player.selected_slot matches 1 store result score #xitm.track_item.swap_time xitm.op run data get storage xylo_items:op register_item_inventory[{Slot:1b}].tag.xylo_items.swap_time
execute if score @s xlib.player.selected_slot matches 2 store result score #xitm.track_item.swap_time xitm.op run data get storage xylo_items:op register_item_inventory[{Slot:2b}].tag.xylo_items.swap_time
execute if score @s xlib.player.selected_slot matches 3 store result score #xitm.track_item.swap_time xitm.op run data get storage xylo_items:op register_item_inventory[{Slot:3b}].tag.xylo_items.swap_time
execute if score @s xlib.player.selected_slot matches 4 store result score #xitm.track_item.swap_time xitm.op run data get storage xylo_items:op register_item_inventory[{Slot:4b}].tag.xylo_items.swap_time
execute if score @s xlib.player.selected_slot matches 5 store result score #xitm.track_item.swap_time xitm.op run data get storage xylo_items:op register_item_inventory[{Slot:5b}].tag.xylo_items.swap_time
execute if score @s xlib.player.selected_slot matches 6 store result score #xitm.track_item.swap_time xitm.op run data get storage xylo_items:op register_item_inventory[{Slot:6b}].tag.xylo_items.swap_time
execute if score @s xlib.player.selected_slot matches 7 store result score #xitm.track_item.swap_time xitm.op run data get storage xylo_items:op register_item_inventory[{Slot:7b}].tag.xylo_items.swap_time
execute if score @s xlib.player.selected_slot matches 8 store result score #xitm.track_item.swap_time xitm.op run data get storage xylo_items:op register_item_inventory[{Slot:8b}].tag.xylo_items.swap_time

# run ds
scoreboard players set @s xitm.track_item.double_swap_time 0
execute if score #xitm.track_item.swap_time xitm.op >= #xlib.time xlib.op run function #xylo_items:double_swap
