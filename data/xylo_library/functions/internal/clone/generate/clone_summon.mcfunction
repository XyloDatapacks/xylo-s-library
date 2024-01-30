#-> {yawn}

#body
$summon minecraft:area_effect_cloud ~ ~-0.55 ~ {Rotation:[$(yawn)f,$(pitch)f],Duration:1000000000,Tags:["smithed.entity","smithed.strict","xlib.internal.clone"],Passengers:[{id:"minecraft:marker",Tags:["smithed.entity","smithed.strict","xlib.internal.clone"]},{id:"minecraft:armor_stand",Rotation:[$(yawn)f,0.0f],Tags:["smithed.entity","smithed.strict","retina.ignore","xlib.non_interactive","xlib.internal.clone","xlib.internal.clone_new"],Pose:{LeftArm:[-20.0f,0.0f,352.0f],RightArm:[-20.0f,0.0f,8.0f]},Invisible:1b,NoGravity:1b,NoBasePlate:1b,DisabledSlots:4144959,Passengers:[\
{id:"minecraft:item_display",Rotation:[$(yawn)f,0.0f],item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"$(name)",CustomModelData:1}},Tags:["smithed.entity","smithed.strict","xlib.internal.clone","head"],item_display:"thirdperson_righthand",view_range:0.6f,transformation:{translation:[0.0f,-0.545f,0.0f],left_rotation:{angle:3.141590,axis:[0.0f,1.0f,0.0f]},scale:[1.1f,1.1f,1.1f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}},\
{id:"minecraft:item_display",Rotation:[$(yawn)f,0.0f],item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"$(name)",CustomModelData:2}},Tags:["smithed.entity","smithed.strict","xlib.internal.clone","arm_r"],item_display:"thirdperson_righthand",view_range:0.6f,transformation:{translation:[0.02f,-1024.485f,-0.03f],left_rotation:{angle:3.141590,axis:[0.0493865f, 0.98773f, -0.148159f]},scale:[1.1f,1.1f,1.1f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}},\
{id:"minecraft:item_display",Rotation:[$(yawn)f,0.0f],item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"$(name)",CustomModelData:3}},Tags:["smithed.entity","smithed.strict","xlib.internal.clone","arm_l"],item_display:"thirdperson_righthand",view_range:0.6f,transformation:{translation:[-0.02f,-2048.485f,-0.03f],left_rotation:{angle:3.141590,axis:[-0.0493865f, 0.98773f, -0.148159f]},scale:[1.1f,1.1f,1.1f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}},\
{id:"minecraft:item_display",Rotation:[$(yawn)f,0.0f],item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"$(name)",CustomModelData:4}},Tags:["smithed.entity","smithed.strict","xlib.internal.clone","torso"],item_display:"thirdperson_righthand",view_range:0.6f,transformation:{translation:[0.0f,-3072.475f,0.0f],left_rotation:{angle:3.141590,axis:[0.0f,1.0f,0.0f]},scale:[1.1f,1.1f,1.1f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}},\
{id:"minecraft:item_display",Rotation:[$(yawn)f,0.0f],item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"$(name)",CustomModelData:5}},Tags:["smithed.entity","smithed.strict","xlib.internal.clone","leg_r"],item_display:"thirdperson_righthand",view_range:0.6f,transformation:{translation:[0.0f,-4097.175f,0.0f],left_rotation:{angle:3.141590,axis:[0.0f,1.0f,0.0f]},scale:[1.1f,1.1f,1.1f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}},\
{id:"minecraft:item_display",Rotation:[$(yawn)f,0.0f],item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"$(name)",CustomModelData:6}},Tags:["smithed.entity","smithed.strict","xlib.internal.clone","leg_l"],item_display:"thirdperson_righthand",view_range:0.6f,transformation:{translation:[0.0f,-5121.175f,0.0f],left_rotation:{angle:3.141590,axis:[0.0f,1.0f,0.0f]},scale:[1.1f,1.1f,1.1f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}}\
]}]}

execute positioned ~ ~-0.55 ~ run summon minecraft:wandering_trader ~ ~10000 ~ {Tags:["smithed.entity","smithed.strict","xlib.internal.clone","xlib.internal.clone.hitbox",xlib.internal.clone_new],NoAI:1b,Silent:1b,Offers:{},active_effects:[{id:"minecraft:invisibility",duration:-1,show_particles:0b}]}

# set data
tag @s add xlib.internal.clone.player
execute positioned ~ ~-0.55 ~ as @e[type=minecraft:armor_stand,distance=..0.01,tag=xlib.internal.clone_new] run function xylo_library:internal/clone/generate/clone_data
tag @s remove xlib.internal.clone.player

