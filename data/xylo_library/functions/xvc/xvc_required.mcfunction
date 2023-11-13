function xylo_library:xvc/xvc_load

execute if score $xylo_library xvc.load_status matches 0 run return -1
execute unless score #xylo_library xvc.version >= #xylo_library xvc.min_version_required run tellraw @a ["",{"storage":"xvc_version:op","nbt":"datapack_name","color":"aqua"},{"text":" > ","color":"white"},{"storage":"xvc_version:op","nbt":"namespace","color":"aqua"},{"text":": ","color":"white"},{"text": "xylo_library not up to date","color":"red","hoverEvent":{"action":"show_text","contents":["Please Update ",{"storage":"xvc_version:op","nbt":"datapack_name_error","color":"aqua"}]}}]
execute unless score #xylo_library xvc.version >= #xylo_library xvc.min_version_required run return -1
return 1
