tp @s ~ ~ ~ ~ ~

data modify storage xylo_library:op temp_data set from entity @s {}
data modify storage xylo_library:op clone_data.yawn set from storage xylo_library:op temp_data.Rotation[0]
data modify storage xylo_library:op clone_data.pitch set from storage xylo_library:op temp_data.Rotation[1]
data modify storage xylo_library:op clone_data.pos_x set from storage xylo_library:op temp_data.Pos[0]
data modify storage xylo_library:op clone_data.pos_y set from storage xylo_library:op temp_data.Pos[1]
data modify storage xylo_library:op clone_data.pos_z set from storage xylo_library:op temp_data.Pos[2]
function xylo_library:utilities/get_dimension_id/get
data modify storage xylo_library:op clone_data.dimension set from storage xylo_library:op get_dimension_id.dimension

kill @s