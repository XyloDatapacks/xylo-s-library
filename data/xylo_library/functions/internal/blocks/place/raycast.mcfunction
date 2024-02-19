#> xylo_library:internal/blocks/place/raycast
# @context: any
# @within: xylo_library:internal/blocks/place/start
# @input: "xylo_library:op place_block_settings"
# @returns: wether a block was hit or not

# raycast
data merge storage xylo_iris:settings {MaxRecursionDepth:50,MaxDistance:5,TargetEntities:1b,Blacklist:"#xylo_iris:shape_groups/air"}
data remove storage xylo_iris:settings Whitelist
data modify storage xylo_iris:settings MaxDistance set from storage xylo_library:op place_block_settings.MaxDistance
execute at @s anchored eyes positioned ^ ^ ^ run function xylo_iris:get_target

# return
return run execute if data storage xylo_iris:output {TargetType:"BLOCK"} 
