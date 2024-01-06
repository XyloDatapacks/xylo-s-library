# get supported pack data
data modify storage xvc_version:op supported_pack set value {version:-1}
$data modify storage xvc_version:op supported_pack set from storage xvc_version:op packs[{namespace:$(namespace)}]

# get supported pack version, and min version supported
execute store result score #xvc.check_supported.version_found xvc.op run data get storage xvc_version:op supported_pack.version
execute store result score #xvc.check_supported.min_version xvc.op run data get storage xvc_version:op check_packs[-1].supported[-1].version

# if validation fails, throw errors
$execute unless score #xvc.check_supported.version_found xvc.op matches -1 unless score #xvc.check_supported.version_found xvc.op >= #xvc.check_supported.min_version xvc.op run tellraw @a ["",{"storage":"xvc_version:op","nbt":"check_packs[-1].namespace","color":"aqua","hoverEvent":{"action":"show_text","contents":[{"storage":"xvc_version:op","nbt":"check_packs[-1].name","color":"aqua"}]}},{"text":": ","color":"white"},{"text": "$(namespace) not supported","color":"red","hoverEvent":{"action":"show_text","contents":["Please Update ",{"storage":"xvc_version:op","nbt":"supported_pack.name","color":"aqua"},"\nOutdated module: ",{"storage":"xvc_version:op","nbt":"supported_pack.namespace","color":"aqua"},"\nVersion found: ",{"score":{"objective":"xvc.op","name":"#xvc.check_supported.version_found"}},"\nVersion required: ",{"score":{"objective":"xvc.op","name":"#xvc.check_supported.min_version"}},"+"]}}]
$execute unless score #xvc.check_supported.version_found xvc.op matches -1 unless score #xvc.check_supported.version_found xvc.op >= #xvc.check_supported.min_version xvc.op run scoreboard players set $$(namespace) xvc.load_status 0

#loop
data remove storage xvc_version:op check_packs[-1].supported[-1]
scoreboard players remove #xvc.check_supported.number xvc.op 1
execute if score #xvc.check_supported.number xvc.op matches 1.. run function xylo_library:xvc/check/check_supported_loop with storage xvc_version:op check_packs[-1].supported[-1]
