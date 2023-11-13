function xylo_retina:traverse/setup
scoreboard players add $k xylo_retina.__variable__ 1
execute if score $k xylo_retina.__variable__ < $centered_count xylo_retina.__variable__ run function xylo_retina:__private__/for_loop/2