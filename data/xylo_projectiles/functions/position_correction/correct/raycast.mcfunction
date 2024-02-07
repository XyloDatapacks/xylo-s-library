data merge storage xylo_iris:settings {MaxRecursionDepth:50,OverrideExecutingEntity:1b,TargetEntities:1b,Blacklist:"#xylo_iris:shape_groups/air",EntityHitboxTollerance:0.3}
execute store result storage xylo_iris:settings MaxDistance int 0.001 run scoreboard players get xproj.position_correction.max_distance xproj.op
data remove storage xylo_iris:settings Whitelist
function xylo_iris:get_target
tag @e remove xylo_iris.executing

#get hit coord
execute store success score xproj.position_correction.has_result xproj.op unless data storage xylo_iris:output {TargetType:"NONE"} 
data remove storage xylo_projectiles:op corrected_pos
data modify storage xylo_projectiles:op corrected_pos set from storage xylo_iris:output TargetPosition.pos


# get hit entity uuid (except if blocked)
data remove storage xylo_projectiles:op entity_hit
execute store success score xproj.position_correction.hit_entity xproj.op if data storage xylo_iris:output {TargetType:"ENTITY"} 
execute as @a[scores={xitm.shield_using=1},tag=xylo_iris.targeted_entity,limit=1] facing entity @s eyes positioned as @s positioned ^ ^ ^1 rotated as @s positioned ^ ^ ^1 if entity @s[distance=..1.35] run scoreboard players set xproj.position_correction.hit_entity xproj.op 0
execute if score xproj.position_correction.hit_entity xproj.op matches 1 run data modify storage gu:main in set from storage xylo_iris:output TargetedEntity.UUID
execute if score xproj.position_correction.hit_entity xproj.op matches 1 run function xylo_library:utilities/uuid/generate_from_storage
execute if score xproj.position_correction.hit_entity xproj.op matches 1 run data modify storage xylo_projectiles:op entity_hit.uuid set from storage gu:main out

