scoreboard objectives remove xvc.op 
scoreboard objectives remove xvc.load_status 

scoreboard objectives add xvc.op dummy
scoreboard objectives add xvc.load_status dummy

data remove storage xvc_version:op packs
function #xylo_library:xvc_load
function xylo_library:xvc/load
function xylo_projectiles:xvc/load
function xylo_items:xvc/load

tellraw @a {"text":"\n\n=================================","color":"#427E6B"}
tellraw @a {"text":"Xylo's Datapacks Validation:\n","color":"aqua","bold":true}
# All packs must have their required packs above it

data modify storage xvc_version:op check_packs set from storage xvc_version:op packs
execute store result score #xvc.check_packs.number xvc.op run data get storage xvc_version:op check_packs
execute if score #xvc.check_packs.number xvc.op matches 1.. run function xylo_library:xvc/check/check_loop

execute store result score #xvc.validate_packs.repeats xvc.op run data get storage xvc_version:op packs
execute if score #xvc.validate_packs.repeats xvc.op matches 1.. run function xylo_library:xvc/validate/validate_start_loop

tellraw @a {"text":"\nActive Datapacks:","color":"dark_aqua","bold":true}

function #xylo_library:xvc_output

tellraw @a {"text":"\n=================================\n\n","color":"#427E6B"}
