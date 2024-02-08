# check for impact
execute if predicate xylo_projectiles:hit run return run function xylo_projectiles:auto_correction/hit

# projectile correction (for display)
function xylo_projectiles:position_correction/tick/start
