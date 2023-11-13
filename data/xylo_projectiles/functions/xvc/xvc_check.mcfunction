function xylo_projectiles:xvc/xvc_load_name
# required datapacks
scoreboard players set #xylo_library xvc.min_version_required 010000
# supported datapacks
scoreboard players set #energy_manipulation xvc.min_version_supported 010000

#==<CHECK>==#

# required datapacks
execute store result score #xvc.pack_found xvc.version run function xylo_library:xvc/xvc_required
execute if score #xvc.pack_found xvc.version matches 0 run tellraw @a ["",{"storage":"xvc_version:op","nbt":"datapack_name","color":"aqua"},{"text":" > ","color":"white"},{"storage":"xvc_version:op","nbt":"namespace","color":"aqua"},{"text":": ","color":"white"},{"text":"xylo_library not found","color":"red"}]
execute if score #xvc.pack_found xvc.version matches -1..0 run scoreboard players set $xylo_projectiles xvc.load_status 0
# supported datapacks
function energy_manipulation:xvc/xvc_supported

