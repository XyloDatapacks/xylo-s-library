# -> {caster, shooter} (caster: int uuid, shooter: hex uuid)
$summon minecraft:snowball ~ ~ ~ {Item:{id:"minecraft:paper",Count:1b,tag:{CustomModelData:12340000}},Silent:1b,Motion:$(motion),Tags:["smithed.entity","smithed.strict","xitm.item_class.throwable.projecitle"],Owner:$(owner),Passengers:[{id:"minecraft:item_display",billboard:"fixed",transformation:{left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[0.6f,0.6f,0.6f],translation:[0.0f,0.0f,0.0f]},Tags:["smithed.entity","smithed.strict","xitm.item_class.throwable.display","xitm.item_class.throwable.display_new"],item_display:fixed,item:{id:"minecraft:paper",Count:1b,tag:{CustomModelData:12340000}},Passengers:[$(passenger)]}]}
execute as @e[type=minecraft:item_display,distance=..0.001,tag=xitm.item_class.throwable.display_new,limit=1] run function xylo_items:item_class/throwable/throw/summon_data


