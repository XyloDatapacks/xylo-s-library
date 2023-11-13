# Calculate distance using item scale trick
# created by "Triton365" 
# on the Mincecraft Command Discord

# function xylo_library:utilities/distance/distance with {x:1.0,y:1.0,z:1.0}
# out: "xylo_library:op distance_out"

$data modify entity 0000000d-0109-0097-0116-000000000104 transformation set value [$(x)f,0f,0f,0f,$(y)f,0f,0f,0f,$(z)f,0f,0f,0f,0f,0f,0f,1f]
data modify storage xylo_library:op distance_out set from entity 0000000d-0109-0097-0116-000000000104 transformation.scale[0]

