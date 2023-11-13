scoreboard players operation __math__.seed xylo_retina.__variable__ *= __math__.rng.a xylo_retina.__variable__
scoreboard players operation __math__.seed xylo_retina.__variable__ += __math__.rng.c xylo_retina.__variable__
scoreboard players operation __math__.rng.result xylo_retina.__variable__ = __math__.seed xylo_retina.__variable__
scoreboard players operation __math__.tmp xylo_retina.__variable__ = __math__.rng.result xylo_retina.__variable__
scoreboard players operation __math__.rng.result xylo_retina.__variable__ %= __math__.rng.bound xylo_retina.__variable__
scoreboard players operation __math__.tmp xylo_retina.__variable__ -= __math__.rng.result xylo_retina.__variable__
scoreboard players operation __math__.tmp xylo_retina.__variable__ += __math__.rng.bound xylo_retina.__variable__
execute if score __math__.tmp xylo_retina.__variable__ matches ..0 run function xylo_retina:__private__/math_random/main