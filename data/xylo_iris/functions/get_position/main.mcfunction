#> xylo_iris:get_position/main
#
# Gets the current coordinates and rotation.
# Coordinates are returned as a triplet of integer coordinates and a triplet of fractional coordinates.
# Rotation is returned as a steering vector of magnitude 1000000.
#
# @context a marker
# @within xylo_iris:get_target
# @within xylo_iris:get_hitbox/entity
# @writes
#    score $[x] xylo_iris
#        The integer x coordinate of the current position
#    score $[y] xylo_iris
#        The integer y coordinate of the current position
#    score $[z] xylo_iris
#        The integer z coordinate of the current position
#    score ${x} xylo_iris
#        The fractional x coordinate of the current position, represented by an integer between 0 and 1000000
#    score ${y} xylo_iris
#        The fractional y coordinate of the current position, represented by an integer between 0 and 1000000
#    score ${z} xylo_iris
#        The fractional z coordinate of the current position, represented by an integer between 0 and 1000000
#    score $dx xylo_iris
#        The x coordinate of the steering vector of the ray, represented by an integer between -1000000 and 1000000
#    score $dy xylo_iris
#        The y coordinate of the steering vector of the ray, represented by an integer between -1000000 and 1000000
#    score #dz xylo_iris
#        The z coordinate of the steering vector of the ray, represented by an integer between -1000000 and 1000000

function xylo_iris:get_position/get_coordinates
execute unless data storage xylo_iris:settings {OverrideRotation:1b} run function xylo_iris:get_position/get_rotation
execute if data storage xylo_iris:settings {OverrideRotation:1b} run function xylo_iris:get_position/override_rotation

