execute unless block ~ ~ ~ #xylo_retina:rail[shape=ascending_east] unless block ~ ~ ~ #xylo_retina:rail[shape=ascending_west] unless block ~ ~ ~ #xylo_retina:rail[shape=ascending_north] unless block ~ ~ ~ #xylo_retina:rail[shape=ascending_south] run data modify storage xylo_retina:data Surfaces set value {Top:[[0,60,0,480,60,480]],Bottom:[[0,0,0,480,0,480]],West:[[0,0,0,0,60,480]],East:[[480,0,0,480,60,480]],North:[[0,0,0,480,60,0]],South:[[0,0,480,480,60,480]]}
execute unless block ~ ~ ~ #xylo_retina:rail[shape=east_west] unless block ~ ~ ~ #xylo_retina:rail[shape=north_south] unless block ~ ~ ~ #xylo_retina:rail[shape=north_west] unless block ~ ~ ~ #xylo_retina:rail[shape=north_east] unless block ~ ~ ~ #xylo_retina:rail[shape=south_west] unless block ~ ~ ~ #xylo_retina:rail[shape=south_east] run data modify storage xylo_retina:data Surfaces set value {Top:[[0,240,0,480,240,480]],Bottom:[[0,0,0,480,0,480]],West:[[0,0,0,0,240,480]],East:[[480,0,0,480,240,480]],North:[[0,0,0,480,240,0]],South:[[0,0,480,480,240,480]]}