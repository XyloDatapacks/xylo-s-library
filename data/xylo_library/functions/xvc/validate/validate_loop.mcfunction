scoreboard players set #xvc.validate_packs.error xvc.op 0

#loop all required packs
execute store result score #xvc.verify_packs.number xvc.op run data get storage xvc_version:op validate_packs[-1].required
execute if score #xvc.verify_packs.number xvc.op matches 1.. run function xylo_library:xvc/validate/verify_loop with storage xvc_version:op validate_packs[-1].required[-1]

$execute if score #xvc.validate_packs.error xvc.op matches 1 if score $$(namespace) xvc.load_status matches 1 run tellraw @a ["",{"storage":"xvc_version:op","nbt":"validate_packs[-1].namespace","color":"aqua","hoverEvent":{"action":"show_text","contents":[{"storage":"xvc_version:op","nbt":"validate_packs[-1].name","color":"aqua"}]}},{"text":": ","color":"white"},{"text": "disabled due to dipendency validation fail","color":"red","hoverEvent":{"action":"show_text","contents":["Please Fix Previous Validation Errors"]}}]
$execute if score #xvc.validate_packs.error xvc.op matches 1 run scoreboard players set $$(namespace) xvc.load_status 0

#loop
data remove storage xvc_version:op validate_packs[-1]
scoreboard players remove #xvc.validate_packs.number xvc.op 1
execute if score #xvc.validate_packs.number xvc.op matches 1.. run function xylo_library:xvc/validate/validate_loop with storage xvc_version:op validate_packs[-1]