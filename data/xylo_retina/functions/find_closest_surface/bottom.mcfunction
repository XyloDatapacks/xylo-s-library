data modify storage xylo_retina:data List set from storage xylo_retina:data Surfaces.Bottom
execute store result score $surfaces xylo_retina.__variable__ run data get storage xylo_retina:data List
scoreboard players operation $cuboid_id xylo_retina.__variable__ = $surfaces xylo_retina.__variable__
scoreboard players remove $cuboid_id xylo_retina.__variable__ 1
execute if score $surfaces xylo_retina.__variable__ matches 1.. run function xylo_retina:__private__/while_loop/2