# data modify storage xylo_items:op register_item_inventory set from entity @s Inventory
# execute store result score @s xlib.player.selected_slot run data get entity @s SelectedItemSlot


# prevent updates during this function
scoreboard players set @s xitm.track_item.is_tracking 1

# double swap check
execute if score @s xitm.track_item.double_swap_time >= #xlib.time xlib.op if predicate xylo_items:track_item/double_swap_check run function xylo_items:track_item/double_swap_check
execute if data storage xylo_items:op register_item_inventory[{Slot:-106b}].tag.xylo_items{Slot:"mainhand"} run function xylo_items:track_item/double_swap_init

# tag items
data remove storage xylo_items:op register_item_inventory[{tag:{xylo_items:{stackable:1b}}}]
execute if data storage xylo_items:op register_item_inventory[{Slot:0b}].tag.xylo_items run item modify entity @s hotbar.0 xylo_items:track_item/register_item/tag_mainhand
execute if data storage xylo_items:op register_item_inventory[{Slot:1b}].tag.xylo_items run item modify entity @s hotbar.1 xylo_items:track_item/register_item/tag_mainhand
execute if data storage xylo_items:op register_item_inventory[{Slot:2b}].tag.xylo_items run item modify entity @s hotbar.2 xylo_items:track_item/register_item/tag_mainhand
execute if data storage xylo_items:op register_item_inventory[{Slot:3b}].tag.xylo_items run item modify entity @s hotbar.3 xylo_items:track_item/register_item/tag_mainhand
execute if data storage xylo_items:op register_item_inventory[{Slot:4b}].tag.xylo_items run item modify entity @s hotbar.4 xylo_items:track_item/register_item/tag_mainhand
execute if data storage xylo_items:op register_item_inventory[{Slot:5b}].tag.xylo_items run item modify entity @s hotbar.5 xylo_items:track_item/register_item/tag_mainhand
execute if data storage xylo_items:op register_item_inventory[{Slot:6b}].tag.xylo_items run item modify entity @s hotbar.6 xylo_items:track_item/register_item/tag_mainhand
execute if data storage xylo_items:op register_item_inventory[{Slot:7b}].tag.xylo_items run item modify entity @s hotbar.7 xylo_items:track_item/register_item/tag_mainhand
execute if data storage xylo_items:op register_item_inventory[{Slot:8b}].tag.xylo_items run item modify entity @s hotbar.8 xylo_items:track_item/register_item/tag_mainhand
execute if data storage xylo_items:op register_item_inventory[{Slot:-106b}].tag.xylo_items run item modify entity @s weapon.offhand xylo_items:track_item/register_item/tag_offhand
execute if data storage xylo_items:op register_item_inventory[{Slot:103b}].tag.xylo_items run item modify entity @s armor.head xylo_items:track_item/register_item/tag_head
execute if data storage xylo_items:op register_item_inventory[{Slot:102b}].tag.xylo_items run item modify entity @s armor.chest xylo_items:track_item/register_item/tag_chest
execute if data storage xylo_items:op register_item_inventory[{Slot:101b}].tag.xylo_items run item modify entity @s armor.legs xylo_items:track_item/register_item/tag_legs
execute if data storage xylo_items:op register_item_inventory[{Slot:100b}].tag.xylo_items run item modify entity @s armor.feet xylo_items:track_item/register_item/tag_feet

# call other functions
function #xylo_items:track_item

# reset
scoreboard players set @s xitm.track_item.is_tracking 0