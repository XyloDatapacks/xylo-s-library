# advancement reward function
execute if score $xylo_library xvc.load_status matches 0 run return 0
#---------------------------

# message
execute unless score @s xlib.player_version = @s xlib.player_version run tellraw @s {"text":"Wellcome to Xylo's Library. By Xylo_Datapacks","color":"dark_aqua"}
# update version
scoreboard players operation @s xlib.player_version = #xlib.pack_version xlib.op
