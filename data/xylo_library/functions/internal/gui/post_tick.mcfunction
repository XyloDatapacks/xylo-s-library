# sends built gui sto smithed.actionbar
# in: "xylo_library:op internal_gui"
# in: TODO something for priority

data modify storage smithed.actionbar:input message set value {json:'["",{"translate":"offset.0","font":"space:default",with:[{"storage":"xylo_library:op","nbt":"internal_gui","interpret":true,"color":"#4404f9"}]}]', priority:'persistent', freeze:0}