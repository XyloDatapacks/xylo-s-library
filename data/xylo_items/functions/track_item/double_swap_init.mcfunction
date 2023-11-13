scoreboard players operation @s xitm.track_item.double_swap_time = #xlib.time xlib.op
execute store result storage xylo_items:op register_item_inventory[{Slot:-106b}].tag.xylo_items.swap_time int 1 run scoreboard players add @s xitm.track_item.double_swap_time 5
