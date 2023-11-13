scoreboard players operation __math__.x xylo_retina.__variable__ = __math__.x_n xylo_retina.__variable__
scoreboard players operation __math__.x_n xylo_retina.__variable__ = __math__.N xylo_retina.__variable__
scoreboard players operation __math__.x_n xylo_retina.__variable__ /= __math__.x xylo_retina.__variable__
scoreboard players operation __math__.x_n xylo_retina.__variable__ += __math__.x xylo_retina.__variable__
scoreboard players operation __math__.x_n xylo_retina.__variable__ /= 2 xylo_retina.__int__
scoreboard players operation __math__.different xylo_retina.__variable__ = __math__.x xylo_retina.__variable__
scoreboard players operation __math__.different xylo_retina.__variable__ -= __math__.x_n xylo_retina.__variable__
execute unless score __math__.different xylo_retina.__variable__ matches 0..1 run function xylo_retina:__private__/math_sqrt/newton_raphson