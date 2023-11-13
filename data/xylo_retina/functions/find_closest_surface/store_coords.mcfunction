execute store result score $X0 xylo_retina.__variable__ run data get storage xylo_retina:data List[-1][0]
execute store result score $X1 xylo_retina.__variable__ run data get storage xylo_retina:data List[-1][3]
scoreboard players set $t_X xylo_retina.__variable__ 480
scoreboard players operation $t_X xylo_retina.__variable__ *= $step_X xylo_retina.__variable__
scoreboard players operation $t_X xylo_retina.__variable__ -= $frac_origin_X xylo_retina.__variable__
scoreboard players operation $X0 xylo_retina.__variable__ += $t_X xylo_retina.__variable__
scoreboard players operation $X1 xylo_retina.__variable__ += $t_X xylo_retina.__variable__
execute store result score $Y0 xylo_retina.__variable__ run data get storage xylo_retina:data List[-1][1]
execute store result score $Y1 xylo_retina.__variable__ run data get storage xylo_retina:data List[-1][4]
scoreboard players set $t_Y xylo_retina.__variable__ 480
scoreboard players operation $t_Y xylo_retina.__variable__ *= $step_Y xylo_retina.__variable__
scoreboard players operation $t_Y xylo_retina.__variable__ -= $frac_origin_Y xylo_retina.__variable__
scoreboard players operation $Y0 xylo_retina.__variable__ += $t_Y xylo_retina.__variable__
scoreboard players operation $Y1 xylo_retina.__variable__ += $t_Y xylo_retina.__variable__
execute store result score $Z0 xylo_retina.__variable__ run data get storage xylo_retina:data List[-1][2]
execute store result score $Z1 xylo_retina.__variable__ run data get storage xylo_retina:data List[-1][5]
scoreboard players set $t_Z xylo_retina.__variable__ 480
scoreboard players operation $t_Z xylo_retina.__variable__ *= $step_Z xylo_retina.__variable__
scoreboard players operation $t_Z xylo_retina.__variable__ -= $frac_origin_Z xylo_retina.__variable__
scoreboard players operation $Z0 xylo_retina.__variable__ += $t_Z xylo_retina.__variable__
scoreboard players operation $Z1 xylo_retina.__variable__ += $t_Z xylo_retina.__variable__
scoreboard players operation $test xylo_retina.__variable__ = $Y1 xylo_retina.__variable__
scoreboard players operation $test xylo_retina.__variable__ -= $Y0 xylo_retina.__variable__
execute if score $test xylo_retina.__variable__ matches ..479 run scoreboard players operation $head_Y xylo_retina.__variable__ += $t_Y xylo_retina.__variable__
execute if score $test xylo_retina.__variable__ matches ..479 run scoreboard players remove $head_Y xylo_retina.__variable__ 480