scoreboard players set __math__.x_n xylo_retina.__variable__ 1225
function xylo_retina:__private__/math_sqrt/newton_raphson
scoreboard players operation __main__.x_n_sq xylo_retina.__variable__ = __math__.x_n xylo_retina.__variable__
scoreboard players operation __main__.x_n_sq xylo_retina.__variable__ *= __math__.x_n xylo_retina.__variable__
execute if score __main__.x_n_sq xylo_retina.__variable__ > __math__.N xylo_retina.__variable__ run scoreboard players remove __math__.x_n xylo_retina.__variable__ 1