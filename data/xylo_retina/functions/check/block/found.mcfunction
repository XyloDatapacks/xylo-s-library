data remove storage xylo_retina:data Surfaces
data modify storage xylo_retina:data Surfaces set value {Top:[],Bottom:[],West:[],East:[],North:[],South:[]}
function xylo_retina:check/block/get_hitbox
execute if data storage xylo_retina:data Surfaces run function xylo_retina:find_closest_surface/main
execute if score $contact xylo_retina.__variable__ matches 1.. run scoreboard players operation $block_distance xylo_retina.__variable__ = $min_distance_to_surface xylo_retina.__variable__
scoreboard players operation $hit_block xylo_retina.__variable__ = $contact xylo_retina.__variable__