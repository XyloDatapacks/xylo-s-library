# op
scoreboard objectives remove xlib.op 
scoreboard objectives remove xlib.test 
# version
scoreboard objectives remove xlib.player_version 

# const
scoreboard objectives remove xconst 

#==<objectives>==#

# player
scoreboard objectives remove xlib.player.selected_slot 
scoreboard objectives remove xlib.player.health_obj 
scoreboard objectives remove xlib.player._died 
scoreboard objectives remove xlib.player.died 
scoreboard objectives remove xlib.player.reapawn_status 
scoreboard objectives remove xlib.player.rotation_x 
scoreboard objectives remove xlib.player.rotation_y 
scoreboard objectives remove xlib.player.motion_x 
scoreboard objectives remove xlib.player.motion_y 
scoreboard objectives remove xlib.player.motion_z 
scoreboard objectives remove xlib.player.on_ground
scoreboard objectives remove xlib.player._jump 
scoreboard objectives remove xlib.player.jumped 
scoreboard objectives remove xlib.player._dmg_dealt 
scoreboard objectives remove xlib.player.dealt_damage 
scoreboard objectives remove xlib.player._dmg_taken 
scoreboard objectives remove xlib.player.taken_damage 
scoreboard objectives remove xlib.player.leave_game
scoreboard objectives remove xlib.player.joining
scoreboard objectives remove xlib.player.sneak_time 
scoreboard objectives remove xlib.player.sneaking 
scoreboard objectives remove xlib.player.double_sneak 
scoreboard objectives remove xlib.player.double_sneak_time
scoreboard objectives remove xlib.player.inventory_changed
scoreboard objectives remove xlib.player.selected_slot_old
scoreboard objectives remove xlib.player.selected_slot_changed

# utilities
scoreboard objectives add xlib.utilities.un_agro.reset_time dummy

# clone
scoreboard objectives remove xlib.internal.clone.generate.end_time
scoreboard objectives remove xlib.internal.clone.generate.start_time
scoreboard objectives remove xlib.internal.clone.import.invis_time

# gui
scoreboard objectives add xlib.internal.gui.priority dummy

#==<Other Inits>==#

# teams
team remove xlib.no_collision

# functions
kill 0000000d-0109-0097-0116-000000000104 

# marker (UUID:545ec994-ae69-485d-9604-981ce1612a99)
kill 545ec994-ae69-485d-9604-981ce1612a99 

# load
function xylo_items:uninstall
function xylo_projectiles:uninstall
function #xylo_library:uninstall


