#==<SQRT>========================================================================
# #xlib.sqrt xlib.op è il valore in ingresso di cui vuoi la radice quadrata
# ed è anche il valore di output
#================================================================================

scoreboard players operation #xlib.sqrt_init xlib.op = #xlib.sqrt xlib.op

#inizio
scoreboard players operation #xlib.sqrt_xn xlib.op = #xlib.sqrt_init xlib.op
scoreboard players operation #xlib.sqrt_xn xlib.op /= #2 xconst

#iterazione 1
scoreboard players operation #xlib.sqrt_math xlib.op = #xlib.sqrt_init xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op /= #xlib.sqrt_xn xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op += #xlib.sqrt_xn xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op /= #2 xconst
scoreboard players operation #xlib.sqrt_xn xlib.op = #xlib.sqrt_math xlib.op

#iterazione 2
scoreboard players operation #xlib.sqrt_math xlib.op = #xlib.sqrt_init xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op /= #xlib.sqrt_xn xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op += #xlib.sqrt_xn xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op /= #2 xconst
scoreboard players operation #xlib.sqrt_xn xlib.op = #xlib.sqrt_math xlib.op

#iterazione 3
scoreboard players operation #xlib.sqrt_math xlib.op = #xlib.sqrt_init xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op /= #xlib.sqrt_xn xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op += #xlib.sqrt_xn xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op /= #2 xconst
scoreboard players operation #xlib.sqrt_xn xlib.op = #xlib.sqrt_math xlib.op

#iterazione 4
scoreboard players operation #xlib.sqrt_math xlib.op = #xlib.sqrt_init xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op /= #xlib.sqrt_xn xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op += #xlib.sqrt_xn xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op /= #2 xconst
scoreboard players operation #xlib.sqrt_xn xlib.op = #xlib.sqrt_math xlib.op

#iterazione 5
scoreboard players operation #xlib.sqrt_math xlib.op = #xlib.sqrt_init xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op /= #xlib.sqrt_xn xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op += #xlib.sqrt_xn xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op /= #2 xconst
scoreboard players operation #xlib.sqrt_xn xlib.op = #xlib.sqrt_math xlib.op

#iterazione 6
scoreboard players operation #xlib.sqrt_math xlib.op = #xlib.sqrt_init xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op /= #xlib.sqrt_xn xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op += #xlib.sqrt_xn xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op /= #2 xconst
scoreboard players operation #xlib.sqrt_xn xlib.op = #xlib.sqrt_math xlib.op

#iterazione 7
scoreboard players operation #xlib.sqrt_math xlib.op = #xlib.sqrt_init xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op /= #xlib.sqrt_xn xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op += #xlib.sqrt_xn xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op /= #2 xconst
scoreboard players operation #xlib.sqrt_xn xlib.op = #xlib.sqrt_math xlib.op

#iterazione 8
scoreboard players operation #xlib.sqrt_math xlib.op = #xlib.sqrt_init xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op /= #xlib.sqrt_xn xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op += #xlib.sqrt_xn xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op /= #2 xconst
scoreboard players operation #xlib.sqrt_xn xlib.op = #xlib.sqrt_math xlib.op

#iterazione 9
scoreboard players operation #xlib.sqrt_math xlib.op = #xlib.sqrt_init xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op /= #xlib.sqrt_xn xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op += #xlib.sqrt_xn xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op /= #2 xconst
scoreboard players operation #xlib.sqrt_xn xlib.op = #xlib.sqrt_math xlib.op

#iterazione 10
scoreboard players operation #xlib.sqrt_math xlib.op = #xlib.sqrt_init xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op /= #xlib.sqrt_xn xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op += #xlib.sqrt_xn xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op /= #2 xconst
scoreboard players operation #xlib.sqrt_xn xlib.op = #xlib.sqrt_math xlib.op

#iterazione 11
scoreboard players operation #xlib.sqrt_math xlib.op = #xlib.sqrt_init xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op /= #xlib.sqrt_xn xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op += #xlib.sqrt_xn xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op /= #2 xconst
scoreboard players operation #xlib.sqrt_xn xlib.op = #xlib.sqrt_math xlib.op

#iterazione 12
scoreboard players operation #xlib.sqrt_math xlib.op = #xlib.sqrt_init xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op /= #xlib.sqrt_xn xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op += #xlib.sqrt_xn xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op /= #2 xconst
scoreboard players operation #xlib.sqrt_xn xlib.op = #xlib.sqrt_math xlib.op

#iterazione 13
scoreboard players operation #xlib.sqrt_math xlib.op = #xlib.sqrt_init xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op /= #xlib.sqrt_xn xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op += #xlib.sqrt_xn xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op /= #2 xconst
scoreboard players operation #xlib.sqrt_xn xlib.op = #xlib.sqrt_math xlib.op

#iterazione 14
scoreboard players operation #xlib.sqrt_math xlib.op = #xlib.sqrt_init xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op /= #xlib.sqrt_xn xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op += #xlib.sqrt_xn xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op /= #2 xconst
scoreboard players operation #xlib.sqrt_xn xlib.op = #xlib.sqrt_math xlib.op

#iterazione 15
scoreboard players operation #xlib.sqrt_math xlib.op = #xlib.sqrt_init xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op /= #xlib.sqrt_xn xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op += #xlib.sqrt_xn xlib.op
scoreboard players operation #xlib.sqrt_math xlib.op /= #2 xconst
scoreboard players operation #xlib.sqrt_xn xlib.op = #xlib.sqrt_math xlib.op

#fine
scoreboard players operation #xlib.sqrt xlib.op = #xlib.sqrt_xn xlib.op