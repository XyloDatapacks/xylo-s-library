#> xylo_iris:get_hitbox/entity/scale
#
# Scales a living entity according to its generic.scale attribute
#
# @within xylo_iris:get_hitbox/entity

execute store result score $attribute_scale xylo_iris run attribute @s generic.scale get 1000
execute if score $attribute_scale xylo_iris matches 0 run return fail
execute if score $attribute_scale xylo_iris matches 1000 run return 0

scoreboard players operation $entity_half_width xylo_iris /= $10 xylo_iris
scoreboard players operation $entity_half_width xylo_iris *= $attribute_scale xylo_iris
scoreboard players operation $entity_half_width xylo_iris /= $100 xylo_iris

scoreboard players operation $entity_height xylo_iris /= $10 xylo_iris
scoreboard players operation $entity_height xylo_iris *= $attribute_scale xylo_iris
scoreboard players operation $entity_height xylo_iris /= $100 xylo_iris
