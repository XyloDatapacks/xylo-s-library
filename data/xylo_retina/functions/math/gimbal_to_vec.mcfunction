scoreboard players operation $input retina.__variable__ = $input_yaw retina.__variable__
function xylo_retina:math/sine
scoreboard players operation $output_vec3.X retina.__variable__ = $output retina.__variable__
scoreboard players operation $output_vec3.X retina.__variable__ *= -1 retina.__int__
function xylo_retina:math/cosine
scoreboard players operation $output_vec3.Z retina.__variable__ = $output retina.__variable__
scoreboard players operation $input retina.__variable__ = $input_pitch retina.__variable__
function xylo_retina:math/cosine
scoreboard players operation $output_vec_horizontal retina.__variable__ = $output retina.__variable__
scoreboard players operation $output_vec3.X retina.__variable__ *= $output retina.__variable__
scoreboard players operation $output_vec3.Z retina.__variable__ *= $output retina.__variable__
scoreboard players operation $output_vec3.X retina.__variable__ /= 480 retina.__int__
scoreboard players operation $output_vec3.Z retina.__variable__ /= 480 retina.__int__
function xylo_retina:math/sine
scoreboard players operation $output_vec3.Y retina.__variable__ = $output retina.__variable__
scoreboard players operation $output_vec3.Y retina.__variable__ *= -1 retina.__int__