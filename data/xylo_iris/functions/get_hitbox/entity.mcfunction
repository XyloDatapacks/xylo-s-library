#> xylo_iris:get_hitbox/entity
#
# Returns the shape of the executing entity
#
# @within xylo_iris:raycast/test_for_entity
# @writes
#	storage xylo_iris:data Shape: compound[]
#       A list of cuboids given by two corners in the format {min: [x, y, z], max: [x, y z]}

scoreboard players set $entity_found xylo_iris 0
execute if score $entity_found xylo_iris matches 0 if entity @s[type=#xylo_iris:tree/0] run function xylo_iris:get_hitbox/entity/tree/0
execute if score $entity_found xylo_iris matches 0 if entity @s[type=#xylo_iris:tree/1] run function xylo_iris:get_hitbox/entity/tree/1
execute if score $entity_found xylo_iris matches 0 if entity @s[type=#xylo_iris:tree/2] run function xylo_iris:get_hitbox/entity/tree/2
execute if score $entity_found xylo_iris matches 0 if entity @s[type=#xylo_iris:tree/3] run function xylo_iris:get_hitbox/entity/tree/3
execute if score $entity_found xylo_iris matches 0 if entity @s[type=#xylo_iris:tree/4] run function xylo_iris:get_hitbox/entity/tree/4
execute if score $entity_found xylo_iris matches 0 if entity @s[type=#xylo_iris:tree/5] run function xylo_iris:get_hitbox/entity/tree/5

# Get the entity's coordinates
scoreboard players operation $entity_[x] xylo_iris = $[x] xylo_iris
scoreboard players operation $entity_[y] xylo_iris = $[y] xylo_iris
scoreboard players operation $entity_[z] xylo_iris = $[z] xylo_iris
scoreboard players operation $entity_{x} xylo_iris = ${x} xylo_iris
scoreboard players operation $entity_{y} xylo_iris = ${y} xylo_iris
scoreboard players operation $entity_{z} xylo_iris = ${z} xylo_iris
execute at @s summon minecraft:marker run function xylo_iris:get_position/get_coordinates
scoreboard players operation $entity_[x] xylo_iris >< $[x] xylo_iris
scoreboard players operation $entity_[y] xylo_iris >< $[y] xylo_iris
scoreboard players operation $entity_[z] xylo_iris >< $[z] xylo_iris
scoreboard players operation $entity_{x} xylo_iris >< ${x} xylo_iris
scoreboard players operation $entity_{y} xylo_iris >< ${y} xylo_iris
scoreboard players operation $entity_{z} xylo_iris >< ${z} xylo_iris

# Save how many blocks away the entity is from the block origin
scoreboard players operation $entity_dx xylo_iris = $entity_[x] xylo_iris
scoreboard players operation $entity_dx xylo_iris -= $[x] xylo_iris
scoreboard players operation $entity_dx xylo_iris *= $1000000 xylo_iris
scoreboard players operation $entity_dx xylo_iris += $entity_{x} xylo_iris
scoreboard players operation $entity_dy xylo_iris = $entity_[y] xylo_iris
scoreboard players operation $entity_dy xylo_iris -= $[y] xylo_iris
scoreboard players operation $entity_dy xylo_iris *= $1000000 xylo_iris
scoreboard players operation $entity_dy xylo_iris += $entity_{y} xylo_iris
scoreboard players operation $entity_dz xylo_iris = $entity_[z] xylo_iris
scoreboard players operation $entity_dz xylo_iris -= $[z] xylo_iris
scoreboard players operation $entity_dz xylo_iris *= $1000000 xylo_iris
scoreboard players operation $entity_dz xylo_iris += $entity_{z} xylo_iris

# apply tollerance to bounding box
scoreboard players operation $entity_half_width xylo_iris += $entity_hitbox_tollerance xylo_iris
scoreboard players operation $entity_height xylo_iris += $entity_hitbox_tollerance xylo_iris

# Get the coordinates of the bounding box
scoreboard players operation $entity_x0 xylo_iris = $entity_dx xylo_iris
scoreboard players operation $entity_x0 xylo_iris -= $entity_half_width xylo_iris
execute if score $entity_x0 xylo_iris matches ..0 run scoreboard players set $entity_x0 xylo_iris 0
scoreboard players operation $entity_y0 xylo_iris = $entity_dy xylo_iris
execute if score $entity_y0 xylo_iris matches ..0 run scoreboard players set $entity_y0 xylo_iris 0
scoreboard players operation $entity_z0 xylo_iris = $entity_dz xylo_iris
scoreboard players operation $entity_z0 xylo_iris -= $entity_half_width xylo_iris
execute if score $entity_z0 xylo_iris matches ..0 run scoreboard players set $entity_z0 xylo_iris 0
scoreboard players operation $entity_x1 xylo_iris = $entity_dx xylo_iris
scoreboard players operation $entity_x1 xylo_iris += $entity_half_width xylo_iris
execute if score $entity_x1 xylo_iris matches 1000000.. run scoreboard players set $entity_x1 xylo_iris 1000000
scoreboard players operation $entity_y1 xylo_iris = $entity_dy xylo_iris
scoreboard players operation $entity_y1 xylo_iris += $entity_height xylo_iris
execute if score $entity_y1 xylo_iris matches 1000000.. run scoreboard players set $entity_y1 xylo_iris 1000000
scoreboard players operation $entity_z1 xylo_iris = $entity_dz xylo_iris
scoreboard players operation $entity_z1 xylo_iris += $entity_half_width xylo_iris
execute if score $entity_z1 xylo_iris matches 1000000.. run scoreboard players set $entity_z1 xylo_iris 1000000

# Store these coordinates to storage
data modify storage xylo_iris:data Shape append value {type: "ENTITY", min: [0.0, 0.0, 0.0], max: [0.0, 0.0, 0.0]}
execute store result storage xylo_iris:data Shape[-1].min[0] double 0.000001 run scoreboard players get $entity_x0 xylo_iris
execute store result storage xylo_iris:data Shape[-1].min[1] double 0.000001 run scoreboard players get $entity_y0 xylo_iris
execute store result storage xylo_iris:data Shape[-1].min[2] double 0.000001 run scoreboard players get $entity_z0 xylo_iris
execute store result storage xylo_iris:data Shape[-1].max[0] double 0.000001 run scoreboard players get $entity_x1 xylo_iris
execute store result storage xylo_iris:data Shape[-1].max[1] double 0.000001 run scoreboard players get $entity_y1 xylo_iris
execute store result storage xylo_iris:data Shape[-1].max[2] double 0.000001 run scoreboard players get $entity_z1 xylo_iris

# Special case for item frames and paintings which are annoying
execute if score $entity_found xylo_iris matches 0 store success score $entity_found xylo_iris store success score $entity.is_item_frame xylo_iris if entity @s[type=#xylo_iris:item_frames]
execute if score $entity.is_item_frame xylo_iris matches 1 run function xylo_iris:get_hitbox/entity/item_frame

# Give this entity a tag and an ID, and store the ID in the hitbox
tag @s add xylo_iris.possible_target
scoreboard players operation @s xylo_iris.id = $max_entity_id xylo_iris.id
execute store result storage xylo_iris:data Shape[-1].entity_id int 1 run scoreboard players get @s xylo_iris.id
scoreboard players add $max_entity_id xylo_iris.id 1
