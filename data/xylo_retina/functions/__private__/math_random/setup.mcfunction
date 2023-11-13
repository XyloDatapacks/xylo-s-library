summon area_effect_cloud ~ ~ ~ {Tags:["__private__.math_random"]}
execute store result score __math__.seed xylo_retina.__variable__ run data get entity @e[limit=1,type=area_effect_cloud,tag=__private__.math_random] UUID[0] 1
kill @e[type=area_effect_cloud,tag=__private__.math_random]
scoreboard players set __math__.rng.a xylo_retina.__variable__ 656891
scoreboard players set __math__.rng.c xylo_retina.__variable__ 875773