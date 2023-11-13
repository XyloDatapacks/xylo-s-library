# forceload
forceload remove 0 0
forceload add 0 0

# schedule check again
schedule function xylo_library:load_check 1t append

# check for load
execute if loaded 0 0 0 run function xylo_library:load
