scoreboard players operation $input xylo_retina.__variable__ = $input_yaw xylo_retina.__variable__
function xylo_retina:math/sine
scoreboard players operation $output_vec3.X xylo_retina.__variable__ = $output xylo_retina.__variable__
scoreboard players operation $output_vec3.X xylo_retina.__variable__ *= -1 xylo_retina.__int__
function xylo_retina:math/cosine
scoreboard players operation $output_vec3.Z xylo_retina.__variable__ = $output xylo_retina.__variable__
scoreboard players operation $input xylo_retina.__variable__ = $input_pitch xylo_retina.__variable__
function xylo_retina:math/cosine
scoreboard players operation $output_vec_horizontal xylo_retina.__variable__ = $output xylo_retina.__variable__
scoreboard players operation $output_vec3.X xylo_retina.__variable__ *= $output xylo_retina.__variable__
scoreboard players operation $output_vec3.Z xylo_retina.__variable__ *= $output xylo_retina.__variable__
scoreboard players operation $output_vec3.X xylo_retina.__variable__ /= 480 xylo_retina.__int__
scoreboard players operation $output_vec3.Z xylo_retina.__variable__ /= 480 xylo_retina.__int__
function xylo_retina:math/sine
scoreboard players operation $output_vec3.Y xylo_retina.__variable__ = $output xylo_retina.__variable__
scoreboard players operation $output_vec3.Y xylo_retina.__variable__ *= -1 xylo_retina.__int__