function xylo_items:xvc/xvc_load

execute if score $xylo_items xvc.load_status matches 0 run return -1
execute unless score #xylo_items xvc.version >= #xylo_items xvc.min_version_required run tellraw @a ["",{"storage":"xvc_version:op","nbt":"datapack_name","color":"aqua"},{"text":" > ","color":"white"},{"storage":"xvc_version:op","nbt":"namespace","color":"aqua"},{"text":": ","color":"white"},{"text": "xylo_items not up to date","color":"red","hoverEvent":{"action":"show_text","contents":["Please Update ",{"storage":"xvc_version:op","nbt":"datapack_name_error","color":"aqua"}]}}]
execute unless score #xylo_items xvc.version >= #xylo_items xvc.min_version_required run return -1
return 1
