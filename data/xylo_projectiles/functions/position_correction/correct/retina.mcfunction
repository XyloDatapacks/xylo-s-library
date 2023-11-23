data merge storage xylo_retina:input {HorizontalCount:1b,VerticalCount:1b,CenteredCount:0b,SpreadFactor:[100,100],EndpointEntity:0b,MaxRecursionDepth:50,TargetEntities:true,OverrideExecutingEntity:true,ExpandEntityHitboxes:0.3}
execute store result storage xylo_retina:input MaxRecursionDepth int 0.001 run scoreboard players get xproj.position_correction.max_distance xproj.op
function xylo_retina:traverse/setup_no_entity
tag @e remove retina.executing

#get hit coord
execute store success score xproj.position_correction.has_result xproj.op unless data storage xylo_retina:output {Target:"NONE"} 
data remove storage xylo_projectiles:op corrected_pos
data modify storage xylo_projectiles:op corrected_pos set from storage xylo_retina:output ContactCoordinates


# get hit entity uuid (except if blocked)
execute store success score xproj.position_correction.hit_entity xproj.op if data storage xylo_retina:output {Target:"ENTITY"} 
execute as @a[scores={xitm.shield_using=1},tag=retina.target,limit=1] facing entity @s eyes positioned as @s positioned ^ ^ ^1 rotated as @s positioned ^ ^ ^1 if entity @s[distance=..1.35] run scoreboard players set xproj.position_correction.hit_entity xproj.op 0
execute if score xproj.position_correction.hit_entity xproj.op matches 1 run data modify storage gu:main in set from storage xylo_retina:output TargetedEntity.UUID
execute if score xproj.position_correction.hit_entity xproj.op matches 1 run function xylo_library:utilities/uuid/generate_from_storage
execute if score xproj.position_correction.hit_entity xproj.op matches 1 run data modify storage xylo_projectiles:op entity_hit.uuid set from storage gu:main out
