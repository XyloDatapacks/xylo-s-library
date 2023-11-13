data modify storage xylo_retina:data EntityTag set from entity @s
execute if data storage xylo_retina:data EntityTag{Small: 1b} run scoreboard players set $entity_half_width xylo_retina.__variable__ 60
execute if data storage xylo_retina:data EntityTag{Small: 1b} run scoreboard players set $entity_height xylo_retina.__variable__ 474
execute unless data storage xylo_retina:data EntityTag{Small: 1b} run scoreboard players set $entity_half_width xylo_retina.__variable__ 120
execute unless data storage xylo_retina:data EntityTag{Small: 1b} run scoreboard players set $entity_height xylo_retina.__variable__ 948
execute if data storage xylo_retina:data EntityTag{Marker: 1b} store result score $entity_half_width xylo_retina.__variable__ run scoreboard players set $entity_height xylo_retina.__variable__ 0