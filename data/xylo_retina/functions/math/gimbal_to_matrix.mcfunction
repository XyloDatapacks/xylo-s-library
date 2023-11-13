scoreboard players operation $input xylo_retina.__variable__ = $input_pitch xylo_retina.__variable__
function xylo_retina:math/sine
scoreboard players operation $sin_X xylo_retina.__variable__ = $output xylo_retina.__variable__
function xylo_retina:math/cosine
scoreboard players operation $cos_X xylo_retina.__variable__ = $output xylo_retina.__variable__
scoreboard players operation $input xylo_retina.__variable__ = $input_yaw xylo_retina.__variable__
function xylo_retina:math/sine
scoreboard players operation $sin_Y xylo_retina.__variable__ = $output xylo_retina.__variable__
function xylo_retina:math/cosine
scoreboard players operation $cos_Y xylo_retina.__variable__ = $output xylo_retina.__variable__
scoreboard players operation $output_mat3.XX xylo_retina.__variable__ = $cos_Y xylo_retina.__variable__
scoreboard players set $output_mat3.XY xylo_retina.__variable__ 0
scoreboard players operation $output_mat3.XZ xylo_retina.__variable__ = $sin_Y xylo_retina.__variable__
scoreboard players operation $output_mat3.YX xylo_retina.__variable__ = $sin_Y xylo_retina.__variable__
scoreboard players operation $output_mat3.YX xylo_retina.__variable__ *= $sin_X xylo_retina.__variable__
scoreboard players operation $output_mat3.YX xylo_retina.__variable__ *= -1 xylo_retina.__int__
scoreboard players operation $output_mat3.YX xylo_retina.__variable__ /= 480 xylo_retina.__int__
scoreboard players operation $output_mat3.YY xylo_retina.__variable__ = $cos_X xylo_retina.__variable__
scoreboard players operation $output_mat3.YZ xylo_retina.__variable__ = $cos_Y xylo_retina.__variable__
scoreboard players operation $output_mat3.YZ xylo_retina.__variable__ *= $sin_X xylo_retina.__variable__
scoreboard players operation $output_mat3.YZ xylo_retina.__variable__ /= 480 xylo_retina.__int__
scoreboard players operation $output_mat3.ZX xylo_retina.__variable__ = $sin_Y xylo_retina.__variable__
scoreboard players operation $output_mat3.ZX xylo_retina.__variable__ *= $cos_X xylo_retina.__variable__
scoreboard players operation $output_mat3.ZX xylo_retina.__variable__ *= -1 xylo_retina.__int__
scoreboard players operation $output_mat3.ZX xylo_retina.__variable__ /= 480 xylo_retina.__int__
scoreboard players operation $output_mat3.ZY xylo_retina.__variable__ = $sin_X xylo_retina.__variable__
scoreboard players operation $output_mat3.ZY xylo_retina.__variable__ *= -1 xylo_retina.__int__
scoreboard players operation $output_mat3.ZZ xylo_retina.__variable__ = $cos_Y xylo_retina.__variable__
scoreboard players operation $output_mat3.ZZ xylo_retina.__variable__ *= $cos_X xylo_retina.__variable__
scoreboard players operation $output_mat3.ZZ xylo_retina.__variable__ /= 480 xylo_retina.__int__