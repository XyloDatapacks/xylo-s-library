# get required pack data
data modify storage xvc_version:op required_pack set value {version:-1}
$data modify storage xvc_version:op required_pack set from storage xvc_version:op packs[{namespace:$(namespace)}]

# get required pack version, and min version required
execute store result score #xvc.check_required.version_found xvc.op run data get storage xvc_version:op required_pack.version
execute store result score #xvc.check_required.min_version xvc.op run data get storage xvc_version:op check_packs[-1].required[-1].version

# if validation fails, throw errors
$execute unless score #xvc.check_required.version_found xvc.op >= #xvc.check_required.min_version xvc.op if data storage xvc_version:op required_pack.namespace run tellraw @a ["",{"storage":"xvc_version:op","nbt":"check_packs[-1].namespace","color":"aqua","hoverEvent":{"action":"show_text","contents":[{"storage":"xvc_version:op","nbt":"check_packs[-1].name","color":"aqua"}]}},{"text":": ","color":"white"},{"text": "required newer $(namespace) version","color":"red","hoverEvent":{"action":"show_text","contents":["Please Update ",{"storage":"xvc_version:op","nbt":"required_pack.name","color":"aqua"},"\nOutdated module: ",{"storage":"xvc_version:op","nbt":"required_pack.namespace","color":"aqua"},"\nVersion found: ",{"score":{"objective":"xvc.op","name":"#xvc.check_required.version_found"}},"\nVersion required: ",{"score":{"objective":"xvc.op","name":"#xvc.check_required.min_version"}},"+"]}}]
$execute unless score #xvc.check_required.version_found xvc.op >= #xvc.check_required.min_version xvc.op unless data storage xvc_version:op required_pack.namespace run tellraw @a ["",{"storage":"xvc_version:op","nbt":"check_packs[-1].namespace","color":"aqua","hoverEvent":{"action":"show_text","contents":[{"storage":"xvc_version:op","nbt":"check_packs[-1].name","color":"aqua"}]}},{"text":": ","color":"white"},{"text": "$(namespace) not found","color":"red","hoverEvent":{"action":"show_text","contents":["Please Install a Pack Containing ",{"text":"$(namespace)","color":"aqua"}]}}]
$execute unless score #xvc.check_required.version_found xvc.op >= #xvc.check_required.min_version xvc.op run scoreboard players set $$(is_checking_namespace) xvc.load_status 0

#loop
data remove storage xvc_version:op check_packs[-1].required[-1]
scoreboard players remove #xvc.check_required.number xvc.op 1
execute if score #xvc.check_required.number xvc.op matches 1.. run function xylo_library:xvc/check/check_required_loop with storage xvc_version:op check_packs[-1].required[-1]
