execute if score $single_call retina.__variable__ matches 1.. run function xylo_retina:__private__/if_else/0

execute store result score $X retina.__variable__ run data get entity @s Pos[0] 480
execute store result score $Y retina.__variable__ run data get entity @s Pos[1] 480
execute store result score $Z retina.__variable__ run data get entity @s Pos[2] 480
kill @s