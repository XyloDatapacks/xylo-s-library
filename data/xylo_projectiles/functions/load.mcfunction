#validation
execute if score $xylo_projectiles xvc.load_status matches 0 run return 0

# op
scoreboard objectives add xproj.op dummy
scoreboard objectives add xproj.test dummy

# objectives
scoreboard objectives add xproj.position_correction.creation_time dummy
scoreboard objectives add xproj.position_correction.motion_x dummy
scoreboard objectives add xproj.position_correction.motion_y dummy
scoreboard objectives add xproj.position_correction.motion_z dummy
scoreboard objectives add xproj.position_correction.damage dummy

# functions

# revoke advancements
advancement revoke @a from xylo_projectiles:revoke

