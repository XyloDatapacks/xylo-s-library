## AUTHOR : Picarrow

# Remove existing ID-related command tags
function xylo_library:internal/hit_detection/id/clear_command_tags

# Assign an ID
execute if score #next_id xlib.internal.hit_detection._ matches 19683.. run function xylo_library:internal/hit_detection/id/reset_all
scoreboard players operation @s xlib.internal.hit_detection.id = #next_id xlib.internal.hit_detection._
scoreboard players add #next_id xlib.internal.hit_detection._ 1

# Associate the base-3 ID
scoreboard players operation #_temp_id xlib.internal.hit_detection._ = @s xlib.internal.hit_detection.id

function xylo_library:internal/hit_detection/id/assign_1
scoreboard players operation @s xlib.internal.hit_detection.id.0 = #_bit xlib.internal.hit_detection._

function xylo_library:internal/hit_detection/id/assign_1
scoreboard players operation @s xlib.internal.hit_detection.id.1 = #_bit xlib.internal.hit_detection._

function xylo_library:internal/hit_detection/id/assign_1
scoreboard players operation @s xlib.internal.hit_detection.id.2 = #_bit xlib.internal.hit_detection._

function xylo_library:internal/hit_detection/id/assign_1
scoreboard players operation @s xlib.internal.hit_detection.id.3 = #_bit xlib.internal.hit_detection._

function xylo_library:internal/hit_detection/id/assign_1
scoreboard players operation @s xlib.internal.hit_detection.id.4 = #_bit xlib.internal.hit_detection._

function xylo_library:internal/hit_detection/id/assign_1
scoreboard players operation @s xlib.internal.hit_detection.id.5 = #_bit xlib.internal.hit_detection._

function xylo_library:internal/hit_detection/id/assign_1
scoreboard players operation @s xlib.internal.hit_detection.id.6 = #_bit xlib.internal.hit_detection._

function xylo_library:internal/hit_detection/id/assign_1
scoreboard players operation @s xlib.internal.hit_detection.id.7 = #_bit xlib.internal.hit_detection._

function xylo_library:internal/hit_detection/id/assign_1
scoreboard players operation @s xlib.internal.hit_detection.id.8 = #_bit xlib.internal.hit_detection._

# Append command tags that reflect the base-3 ID
tag @s[scores={xlib.internal.hit_detection.id.0=0}] add xlib.internal.hit_detection.0_0
tag @s[scores={xlib.internal.hit_detection.id.0=1}] add xlib.internal.hit_detection.0_1
tag @s[scores={xlib.internal.hit_detection.id.0=2}] add xlib.internal.hit_detection.0_2
tag @s[scores={xlib.internal.hit_detection.id.1=0}] add xlib.internal.hit_detection.1_0
tag @s[scores={xlib.internal.hit_detection.id.1=1}] add xlib.internal.hit_detection.1_1
tag @s[scores={xlib.internal.hit_detection.id.1=2}] add xlib.internal.hit_detection.1_2
tag @s[scores={xlib.internal.hit_detection.id.2=0}] add xlib.internal.hit_detection.2_0
tag @s[scores={xlib.internal.hit_detection.id.2=1}] add xlib.internal.hit_detection.2_1
tag @s[scores={xlib.internal.hit_detection.id.2=2}] add xlib.internal.hit_detection.2_2
tag @s[scores={xlib.internal.hit_detection.id.3=0}] add xlib.internal.hit_detection.3_0
tag @s[scores={xlib.internal.hit_detection.id.3=1}] add xlib.internal.hit_detection.3_1
tag @s[scores={xlib.internal.hit_detection.id.3=2}] add xlib.internal.hit_detection.3_2
tag @s[scores={xlib.internal.hit_detection.id.4=0}] add xlib.internal.hit_detection.4_0
tag @s[scores={xlib.internal.hit_detection.id.4=1}] add xlib.internal.hit_detection.4_1
tag @s[scores={xlib.internal.hit_detection.id.4=2}] add xlib.internal.hit_detection.4_2
tag @s[scores={xlib.internal.hit_detection.id.5=0}] add xlib.internal.hit_detection.5_0
tag @s[scores={xlib.internal.hit_detection.id.5=1}] add xlib.internal.hit_detection.5_1
tag @s[scores={xlib.internal.hit_detection.id.5=2}] add xlib.internal.hit_detection.5_2
tag @s[scores={xlib.internal.hit_detection.id.6=0}] add xlib.internal.hit_detection.6_0
tag @s[scores={xlib.internal.hit_detection.id.6=1}] add xlib.internal.hit_detection.6_1
tag @s[scores={xlib.internal.hit_detection.id.6=2}] add xlib.internal.hit_detection.6_2
tag @s[scores={xlib.internal.hit_detection.id.7=0}] add xlib.internal.hit_detection.7_0
tag @s[scores={xlib.internal.hit_detection.id.7=1}] add xlib.internal.hit_detection.7_1
tag @s[scores={xlib.internal.hit_detection.id.7=2}] add xlib.internal.hit_detection.7_2
tag @s[scores={xlib.internal.hit_detection.id.8=0}] add xlib.internal.hit_detection.8_0
tag @s[scores={xlib.internal.hit_detection.id.8=1}] add xlib.internal.hit_detection.8_1
tag @s[scores={xlib.internal.hit_detection.id.8=2}] add xlib.internal.hit_detection.8_2
