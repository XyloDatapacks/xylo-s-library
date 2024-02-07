scoreboard players set $entity_half_width xylo_iris 255000
scoreboard players set $entity_height xylo_iris 510000
execute store result score $slime_size xylo_iris run data get entity @s Size
scoreboard players add $slime_size xylo_iris 1
scoreboard players operation $entity_half_width xylo_iris *= $slime_size xylo_iris
scoreboard players operation $entity_height xylo_iris *= $slime_size xylo_iris
