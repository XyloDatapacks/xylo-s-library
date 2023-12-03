scoreboard objectives add xvc.version dummy
scoreboard objectives add xvc.min_version_required dummy
scoreboard objectives add xvc.min_version_supported dummy
scoreboard objectives add xvc.load_status dummy

scoreboard players reset * xvc.version
scoreboard players reset * xvc.min_version_required
scoreboard players reset * xvc.min_version_supported
scoreboard players reset * xvc.load_status

tellraw @a {"text":"\n\n=================================","color":"#427E6B"}
tellraw @a {"text":"Xylo's Datapacks Validation:\n","color":"aqua","bold":true}
# All packs must have their required packs above it
function xylo_library:xvc/xvc_check
function xylo_projectiles:xvc/xvc_check
function xylo_items:xvc/xvc_check
function energy_manipulation:xvc/xvc_check
tellraw @a {"text":"\nActive Datapacks:","color":"dark_aqua","bold":true}
function #xylo_library:xvc_status
tellraw @a {"text":"\n=================================\n\n","color":"#427E6B"}
