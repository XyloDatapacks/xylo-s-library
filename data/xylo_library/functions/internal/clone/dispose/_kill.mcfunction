# from aoe (stack base)

execute on passengers on passengers run kill @s
execute on passengers if entity @s[tag=xlib.internal.clone.hitbox] run team join xlib.no_collision @s
execute on passengers run kill @s
kill @s
