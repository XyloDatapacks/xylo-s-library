scoreboard players set $j xylo_retina.__variable__ 0
execute if score $j xylo_retina.__variable__ < $vertical_count xylo_retina.__variable__ run function xylo_retina:__private__/for_loop/1
scoreboard players add $i xylo_retina.__variable__ 10
execute if score $i xylo_retina.__variable__ < $horizontal_count xylo_retina.__variable__ run function xylo_retina:__private__/for_loop/0