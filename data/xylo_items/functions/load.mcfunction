 #validation
execute if score $xylo_items xvc.load_status matches 0 run return 0
scoreboard players set $xylo_items xvc.load_status 1

# op
scoreboard objectives add xitm.op dummy
scoreboard objectives add xitm.test dummy

# objectives
scoreboard objectives add xitm.track_item.skip_track dummy
scoreboard objectives add xitm.track_item.is_tracking dummy
scoreboard objectives add xitm.track_item.double_swap_time dummy


#==<Item Use>==#

# shield
scoreboard objectives add xitm.shield.using dummy

# wfoas
scoreboard objectives add xitm.wfoas.used_stat minecraft.used:minecraft.warped_fungus_on_a_stick
scoreboard objectives add xitm.wfoas.used dummy
scoreboard objectives add xitm.wfoas.used_mh dummy
scoreboard objectives add xitm.wfoas.used_oh dummy
# bow
scoreboard objectives add xitm.bow.used_stat minecraft.used:minecraft.bow
scoreboard objectives add xitm.bow.used dummy
scoreboard objectives add xitm.bow.used_mh dummy
scoreboard objectives add xitm.bow.used_oh dummy
# crossbow
scoreboard objectives add xitm.crossbow.used_stat minecraft.used:minecraft.crossbow
scoreboard objectives add xitm.crossbow.used dummy
scoreboard objectives add xitm.crossbow.used_mh dummy
scoreboard objectives add xitm.crossbow.used_oh dummy
# trident
scoreboard objectives add xitm.trident.used_stat minecraft.used:minecraft.trident
scoreboard objectives add xitm.trident.used dummy
scoreboard objectives add xitm.trident.used_mh dummy
scoreboard objectives add xitm.trident.used_oh dummy
scoreboard objectives add xitm.trident.thrown dummy
# snowball
scoreboard objectives add xitm.snowball.used_stat minecraft.used:minecraft.snowball
scoreboard objectives add xitm.snowball.used dummy
scoreboard objectives add xitm.snowball.used_mh dummy
scoreboard objectives add xitm.snowball.used_oh dummy
# ender_pearl
scoreboard objectives add xitm.ender_pearl.used_stat minecraft.used:minecraft.ender_pearl
scoreboard objectives add xitm.ender_pearl.used dummy
scoreboard objectives add xitm.ender_pearl.used_mh dummy
scoreboard objectives add xitm.ender_pearl.used_oh dummy

#==<Item Class>==#

# item class
scoreboard objectives add xitm.item_class.throwable.damage dummy

#storages
data remove storage xylo_items:op register_item_selected_slot

# functions

# revoke advancements
advancement revoke @a from xylo_items:revoke

