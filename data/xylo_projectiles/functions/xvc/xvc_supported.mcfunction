function xylo_projectiles:xvc/xvc_load

execute unless score #xylo_projectiles xvc.version >= #xylo_projectiles xvc.min_version_supported run tellraw @a ["",{"storage":"xvc_version:op","nbt":"datapack_name","color":"aqua"},{"text":" > ","color":"white"},{"storage":"xvc_version:op","nbt":"namespace","color":"aqua"},{"text":": ","color":"white"},{"text": "xylo_projectiles not supported","color":"red","hoverEvent":{"action":"show_text","contents":["Please Update ",{"storage":"xvc_version:op","nbt":"datapack_name_error","color":"aqua"}]}}]
execute unless score #xylo_projectiles xvc.version >= #xylo_projectiles xvc.min_version_supported run scoreboard players set $xylo_projectiles xvc.load_status 0
return 1
