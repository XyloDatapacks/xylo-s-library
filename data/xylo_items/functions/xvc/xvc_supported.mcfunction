function xylo_items:xvc/xvc_load

execute unless score #xylo_items xvc.version >= #xylo_items xvc.min_version_supported run tellraw @a ["",{"storage":"xvc_version:op","nbt":"datapack_name","color":"aqua"},{"text":" > ","color":"white"},{"storage":"xvc_version:op","nbt":"namespace","color":"aqua"},{"text":": ","color":"white"},{"text": "xylo_items not supported","color":"red","hoverEvent":{"action":"show_text","contents":["Please Update ",{"storage":"xvc_version:op","nbt":"datapack_name_error","color":"aqua"}]}}]
execute unless score #xylo_items xvc.version >= #xylo_items xvc.min_version_supported run scoreboard players set $xylo_items xvc.load_status 0
return 1
