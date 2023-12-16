execute if score $xylo_items xvc.load_status matches 0 run return 0
scoreboard players set $xylo_items xvc.load_status 1

# op
scoreboard objectives add xitm.op dummy
scoreboard objectives add xitm.test dummy

# objectives
scoreboard objectives add xitm.wfoas_used_stat minecraft.used:minecraft.warped_fungus_on_a_stick
scoreboard objectives add xitm.wfoas_used dummy
scoreboard objectives add xitm.track_item.skip_track dummy
scoreboard objectives add xitm.track_item.is_tracking dummy
scoreboard objectives add xitm.track_item.double_swap_time dummy
scoreboard objectives add xitm.shield_using dummy

#storages
data remove storage xylo_items:op register_item_selected_slot

# functions

# revoke advancements
advancement revoke @a from xylo_items:revoke

