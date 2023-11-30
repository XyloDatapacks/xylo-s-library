#https://discord.com/channels/154777837382008833/1163074331966971925/1163126677912694894

#sqrt
execute store result score stemp0 xlib.op store result score stemp1 xlib.op store result score stemp2 xlib.op store result score stemp3 xlib.op run scoreboard players operation #xlib.utilities.math.sqrt.out xlib.op = #xlib.utilities.math.sqrt.input xlib.op
execute if score #xlib.utilities.math.sqrt.input xlib.op matches ..13924 run function xylo_library:utilities/math/sqrt/sqrt1
execute if score #xlib.utilities.math.sqrt.input xlib.op matches 13925..16777216 run function xylo_library:utilities/math/sqrt/sqrt2
execute if score #xlib.utilities.math.sqrt.input xlib.op matches 16777217.. run function xylo_library:utilities/math/sqrt/sqrt3
scoreboard players operation stemp0 xlib.op /= #xlib.utilities.math.sqrt.out xlib.op
scoreboard players operation #xlib.utilities.math.sqrt.out xlib.op += stemp0 xlib.op
scoreboard players operation #xlib.utilities.math.sqrt.out xlib.op /= #2 xconst
scoreboard players operation stemp1 xlib.op /= #xlib.utilities.math.sqrt.out xlib.op
scoreboard players operation #xlib.utilities.math.sqrt.out xlib.op += stemp1 xlib.op
scoreboard players operation #xlib.utilities.math.sqrt.out xlib.op /= #2 xconst
scoreboard players operation stemp2 xlib.op /= #xlib.utilities.math.sqrt.out xlib.op
scoreboard players operation #xlib.utilities.math.sqrt.out xlib.op += stemp2 xlib.op
scoreboard players operation #xlib.utilities.math.sqrt.out xlib.op /= #2 xconst
scoreboard players operation stemp3 xlib.op /= #xlib.utilities.math.sqrt.out xlib.op
scoreboard players operation #xlib.utilities.math.sqrt.out xlib.op += stemp3 xlib.op
scoreboard players operation #xlib.utilities.math.sqrt.out xlib.op /= #2 xconst

