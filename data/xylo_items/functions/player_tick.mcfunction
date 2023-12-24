execute if score $xylo_items xvc.load_status matches 0 run return 0

execute if score @s xitm.wfoas_used_mh matches 1 if data storage xylo_library:op player_data.SelectedItem{tag:{xylo_items:{item_class:"throwable"}}} run function xylo_items:item_class/throwable/throw_mh
execute if entity @s[scores={xitm.wfoas_used_mh=0,xitm.wfoas_used_oh=1}] if data storage xylo_library:op player_data.Inventory[{Slot:-106b,tag:{xylo_items:{item_class:"throwable"}}}] run function xylo_items:item_class/throwable/throw_oh
