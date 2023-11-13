scoreboard players operation $output xylo_retina.__variable__ = $input xylo_retina.__variable__
scoreboard players remove $output xylo_retina.__variable__ 1800
scoreboard players operation $output xylo_retina.__variable__ %= 1800 xylo_retina.__int__
scoreboard players remove $output xylo_retina.__variable__ 900
scoreboard players operation $output xylo_retina.__variable__ *= $output xylo_retina.__variable__
scoreboard players operation $trig_0 xylo_retina.__variable__ = $output xylo_retina.__variable__
scoreboard players add $trig_0 xylo_retina.__variable__ 3240000
scoreboard players operation $trig_0 xylo_retina.__variable__ /= 480 xylo_retina.__int__
scoreboard players operation $output xylo_retina.__variable__ *= -4 xylo_retina.__int__
scoreboard players add $output xylo_retina.__variable__ 3240000
scoreboard players operation $output xylo_retina.__variable__ /= $trig_0 xylo_retina.__variable__
scoreboard players operation $trig_0 xylo_retina.__variable__ = $input xylo_retina.__variable__
scoreboard players operation $trig_0 xylo_retina.__variable__ %= 3600 xylo_retina.__int__
execute if score $trig_0 xylo_retina.__variable__ matches 1800.. run scoreboard players operation $output xylo_retina.__variable__ *= -1 xylo_retina.__int__