# forceload
forceload add 0 0
forceload add 29999999 12341232

# schedule check again
schedule function xylo_library:load_check 1t append

# check for load
execute if loaded 0 0 0 if loaded 29999999 0 12341232 run function xylo_library:load
