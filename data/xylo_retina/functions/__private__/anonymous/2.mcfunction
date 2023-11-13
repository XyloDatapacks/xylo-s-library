data modify storage xylo_retina:data Pos set from entity @s Pos
execute store result score $entity_frac_X xylo_retina.__variable__ run data get storage xylo_retina:data Pos[0] 480
scoreboard players set $temp xylo_retina.__variable__ 480
scoreboard players operation $temp xylo_retina.__variable__ *= $int_X xylo_retina.__variable__
scoreboard players operation $entity_frac_X xylo_retina.__variable__ -= $temp xylo_retina.__variable__
execute store result score $entity_frac_Y xylo_retina.__variable__ run data get storage xylo_retina:data Pos[1] 480
scoreboard players set $temp xylo_retina.__variable__ 480
scoreboard players operation $temp xylo_retina.__variable__ *= $int_Y xylo_retina.__variable__
scoreboard players operation $entity_frac_Y xylo_retina.__variable__ -= $temp xylo_retina.__variable__
execute store result score $entity_frac_Z xylo_retina.__variable__ run data get storage xylo_retina:data Pos[2] 480
scoreboard players set $temp xylo_retina.__variable__ 480
scoreboard players operation $temp xylo_retina.__variable__ *= $int_Z xylo_retina.__variable__
scoreboard players operation $entity_frac_Z xylo_retina.__variable__ -= $temp xylo_retina.__variable__
data remove storage xylo_retina:data Pos
kill @s