# add storages containing gui's json to "xylo_library:op internal_gui"
# use "#xylo_library:internal_gui_register" function tag to register the storage
# by using "data modify storage xylo_library:op internal_gui_in append <your storage containing json>"
# all messages must center the cursor back to center position, to avoid gui align errors

data modify storage xylo_library:op internal_gui set value '[""]'
function #xylo_library:internal_gui_register
