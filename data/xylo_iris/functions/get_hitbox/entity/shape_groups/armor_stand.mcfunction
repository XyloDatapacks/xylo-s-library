data modify storage xylo_iris:data EntityTag set from entity @s
execute if data storage xylo_iris:data EntityTag{Small: 1b} run scoreboard players set $entity_half_width xylo_iris 125000
execute if data storage xylo_iris:data EntityTag{Small: 1b} run scoreboard players set $entity_height xylo_iris 987500
execute unless data storage xylo_iris:data EntityTag{Small: 1b} run scoreboard players set $entity_half_width xylo_iris 250000
execute unless data storage xylo_iris:data EntityTag{Small: 1b} run scoreboard players set $entity_height xylo_iris 1975000
execute if data storage xylo_iris:data EntityTag{Marker: 1b} store result score $entity_half_width xylo_iris run scoreboard players set $entity_height xylo_iris 0
