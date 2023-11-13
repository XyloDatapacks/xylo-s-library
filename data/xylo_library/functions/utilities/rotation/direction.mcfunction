#==<Rotation>===============================================================================================
# prima di richiamare inizializza:
# storage xylo_library:op SetRotation
# una volta richiamata questa funzione usa prendi data da "storage xylo_library:op Vector"
# questo vettore è il vettore unitario della direzione indicata da rotation
#===========================================================================================================

execute in minecraft:overworld positioned 0.0 0.0 0.0 as 545ec994-ae69-485d-9604-981ce1612a99 run function xylo_library:utilities/rotation/get_direction
