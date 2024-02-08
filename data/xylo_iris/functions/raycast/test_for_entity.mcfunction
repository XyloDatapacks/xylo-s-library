#> xylo_iris:raycast/test_for_entity
#
# @output
#   Result: 0
#   Success: 1 if an entity was hit, 0 otherwise

execute unless data storage xylo_iris:settings {TargetEntities: true} run return fail
execute if score $entity_hitbox_tollerance xylo_iris matches 0 align xyz unless entity @e[type=!#xylo_iris:ignore, tag=!xylo_iris.ignore, dx=0, dy=0, dz=0, tag=!xylo_iris.executing] run return fail
execute if score $entity_hitbox_tollerance xylo_iris matches 0 align xyz as @e[type=!#xylo_iris:ignore, tag=!xylo_iris.ignore, dx=0, dy=0, dz=0, tag=!xylo_iris.executing] run function xylo_iris:get_hitbox/entity
execute unless score $entity_hitbox_tollerance xylo_iris matches 0 align xyz positioned ~-1 ~-1 ~-1 unless entity @e[type=!#xylo_iris:ignore, tag=!xylo_iris.ignore, dx=2, dy=2, dz=2, tag=!xylo_iris.executing] run return fail
execute unless score $entity_hitbox_tollerance xylo_iris matches 0 align xyz positioned ~-1 ~-1 ~-1 as @e[type=!#xylo_iris:ignore, tag=!xylo_iris.ignore, dx=2, dy=2, dz=2, tag=!xylo_iris.executing] positioned ~1 ~1 ~1 run function xylo_iris:get_hitbox/entity
return run function xylo_iris:raycast/check_intersection/loop
