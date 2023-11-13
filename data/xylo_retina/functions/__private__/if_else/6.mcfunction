function xylo_retina:find_closest_surface/ray_intersects_with_surface
data modify storage xylo_retina:output HitFace set value "Top"
execute if score $check_for_head xylo_retina.__variable__ matches 1.. if score $Y_intersection xylo_retina.__variable__ >= $head_Y xylo_retina.__variable__ run data modify storage xylo_retina:output HitEntityHead set value true