# 臭蛋 (1g)
tag @s remove canbuy
tag @s[scores={gold=9..}] add canbuy
tellraw @s[scores={gold=..8}] ["",{"text":">> ","color":"red","bold":true},{"text":"你没有足够的金锭来购买这个物品!","color":"red"}]
tellraw @s[tag=canbuy] ["",{"text":">> ","color":"green","bold":true},"你购买了 ",{"text":"臭蛋","color":"green"}]
execute as @s[tag=canbuy] run tellraw @a[tag=!canbuy] ["",{"text":">> ","color":"green","bold":true},{"selector": "@s","color":"green"}," 购买了 ",{"text":"臭蛋","color":"green"}]
execute as @s[tag=canbuy] at @s run playsound entity.enderman.scream ambient @a ~ ~ ~ 2 0
execute as @s[tag=canbuy] at @s run playsound entity.enderman.scream ambient @a ~ ~ ~ 2 1
execute as @s[tag=canbuy] at @s run playsound entity.enderman.scream ambient @a ~ ~ ~ 2 2
scoreboard players remove @s[tag=canbuy] gold 9
execute as @s[tag=!canbuy] at @s run function lib:sounds/error
execute as @s[tag=canbuy] run function item:shop/refresh_gold
tag @s remove canbuy