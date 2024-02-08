# sends built gui sto smithed.actionbar
# in: "xylo_library:op internal_gui"

# in: "@s xlib.internal.gui.priority"
#   always use as operation @s xlib.internal.gui.priority > x


# if priority is unset, then gui is not needed in this tick
execute unless score @s xlib.internal.gui.priority = @s xlib.internal.gui.priority run return 0

# prepare input for smithed.actionbar
data modify storage smithed.actionbar:input message set value {json:'["",{"translate":"offset.0","font":"space:default","with":[{"storage":"xylo_library:op","nbt":"internal_gui","interpret":true,"color":"#4404f9"}]}]', priority:'persistent', freeze:0}
execute if score @s xlib.internal.gui.priority matches 0 run data modify storage smithed.actionbar:input message.priority set value 'persistent'
execute if score @s xlib.internal.gui.priority matches 1 run data modify storage smithed.actionbar:input message.priority set value 'conditional'
execute if score @s xlib.internal.gui.priority matches 2 run data modify storage smithed.actionbar:input message.priority set value 'notification'
execute if score @s xlib.internal.gui.priority matches 3 run data modify storage smithed.actionbar:input message.priority set value 'override'
scoreboard players reset @s xlib.internal.gui.priority

function #smithed.actionbar:message
