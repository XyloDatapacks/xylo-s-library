scoreboard players set $contact xylo_retina.__variable__ 1
scoreboard players operation $closest_cuboid_id xylo_retina.__variable__ = $cuboid_id xylo_retina.__variable__
scoreboard players operation $min_distance_to_surface xylo_retina.__variable__ = $distance xylo_retina.__variable__
scoreboard players operation $targeted_X xylo_retina.__variable__ = $X_intersection xylo_retina.__variable__
scoreboard players operation $targeted_Y xylo_retina.__variable__ = $Y_intersection xylo_retina.__variable__
scoreboard players operation $targeted_Z xylo_retina.__variable__ = $Z_intersection xylo_retina.__variable__
data modify storage xylo_retina:data ContactSurface set from storage xylo_retina:data List[-1]