execute if block ~ ~ ~ #minecraft:pressure_plates[powered=false] run data modify storage xylo_retina:data Surfaces set value {Top:[[30,30,30,450,30,450]],Bottom:[[30,0,30,450,0,450]],West:[[30,0,30,30,30,450]],East:[[450,0,30,450,30,450]],North:[[30,0,30,450,30,30]],South:[[30,0,450,450,30,450]]}
execute if block ~ ~ ~ #minecraft:pressure_plates[powered=true] run data modify storage xylo_retina:data Surfaces set value {Top:[[30,15,30,450,15,450]],Bottom:[[30,0,30,450,0,450]],West:[[30,0,30,30,15,450]],East:[[450,0,30,450,15,450]],North:[[30,0,30,450,15,30]],South:[[30,0,450,450,15,450]]}