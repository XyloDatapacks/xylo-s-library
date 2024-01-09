scoreboard objectives add smithed.actionbar.temp dummy
scoreboard objectives add smithed.actionbar.const dummy
scoreboard objectives add smithed.actionbar.priority dummy
scoreboard objectives add smithed.actionbar.freeze dummy
scoreboard objectives add smithed.actionbar.sleep_t dummy

# We use score explicitly instead of sneaking predicate
#  scores check for shift-key usage (intentional sneaking)
#  predicates also check for force sneaking (like in 1x1 gap)
# Score's catch some false negatives that predicates would miss
scoreboard objectives add smithed.actionbar.sneaking minecraft.custom:minecraft.sneak_time

scoreboard players set $default.freeze smithed.actionbar.const 20
scoreboard players set $max.freeze smithed.actionbar.const 50
scoreboard players set $min.freeze smithed.actionbar.const 0
scoreboard players set #100 smithed.actionbar.const 100

advancement revoke @a only smithed.actionbar:v0.4.1/vanilla/bed/clicked_bed
advancement revoke @a only smithed.actionbar:v0.4.1/vanilla/bed/slept_in_bed
advancement revoke @a only smithed.actionbar:v0.4.1/vanilla/container/clicked_lockable_block

schedule function smithed.actionbar:v0.4.1/technical/tick 1
