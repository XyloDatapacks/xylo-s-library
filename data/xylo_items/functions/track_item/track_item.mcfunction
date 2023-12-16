execute store success score #xitm.track_item xitm.op if entity @s[advancements={xylo_items:track_item/track_item={requirement=true}}]

# advancement reward function
advancement revoke @s only xylo_items:track_item/track_item
advancement revoke @s only xylo_items:track_item/track_item_generic
execute if score $xylo_items xvc.load_status matches 0 run return 0
#---------------------------

#get data
data modify storage xylo_items:op register_item_inventory set from entity @s Inventory
execute store result score @s xlib.player.selected_slot run data get entity @s SelectedItemSlot
execute store result storage xylo_items:op register_item_selected_slot.slot byte 1 run scoreboard players get @s xlib.player.selected_slot
function xylo_items:track_item/get_selected_item with storage xylo_items:op register_item_selected_slot

# tag items
execute if score #xitm.track_item xitm.op matches 1 unless score @s xitm.track_item.skip_track matches 1 run function xylo_items:track_item/register_item
execute if score #xitm.track_item xitm.op matches 1 run scoreboard players set @s xitm.track_item.skip_track 0

# run inv changed functions that require item data (must use "scoreboard players set @s xitm.track_item.is_tracking 1" if modify items)
function #xylo_items:item_moved