#> xylo_iris:setup/load
#
# Defines scoreboard objectives and sets up storage if it has not already been done
#
# @handles #minecraft:load

# IDE storage definitions for Spyglass
#define storage xylo_iris:data
#define storage xylo_iris:args
#define storage xylo_iris:settings
#define storage xylo_iris:output

# Setup scoreboard and storage
execute unless data storage xylo_iris:data is_setup run function xylo_iris:setup/scoreboard
execute unless data storage xylo_iris:data is_setup run function xylo_iris:setup/storage
