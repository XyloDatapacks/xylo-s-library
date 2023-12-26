$summon $(id) ~ ~ ~ $(data)
$ride @e[type=$(id),distance=..0.001,tag=xitm.throwable.throw.add_passenger_new,limit=1] mount @s
execute on passengers run tag @s remove xitm.throwable.throw.add_passenger_new
