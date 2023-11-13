scoreboard players set __math__.rng.bound xylo_retina.__variable__ 5
function xylo_retina:__private__/math_random/main
scoreboard players operation $input_vec3.Y xylo_retina.__variable__ = __math__.rng.result xylo_retina.__variable__
scoreboard players add $input_vec3.Y xylo_retina.__variable__ 2
scoreboard players operation $input_vec3.Y xylo_retina.__variable__ %= 3 xylo_retina.__int__
scoreboard players remove $input_vec3.Y xylo_retina.__variable__ 1
scoreboard players operation $input_vec3.Y xylo_retina.__variable__ *= 20 xylo_retina.__int__