UPDATE `creature_template` SET skinloot = 70210, AIName='SmartAI' WHERE entry in (40417,40419,40423);

DELETE FROM `smart_scripts` WHERE entryorguid in (40417,40419,40423);
INSERT INTO `smart_scripts` VALUES
(40417,0,0,0,0,0,100,0,4000,6500,10000,13000,11,75413,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Charscale Invoker - Cast Flame Wave'),
(40417,0,1,0,0,0,100,0,8000,8000,20000,25000,11,75416,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Charscale Invoker - Cast Rally'),
(40417,0,2,0,0,0,100,0,2000,3000,7000,13000,11,75412,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Charscale Invoker - Cast Scorch'),
(40419,0,0,0,0,0,100,0,4000,4000,6000,9000,11,15284,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Charscale Assaulter - Cast Cleave'),
(40419,0,1,0,0,0,100,0,8000,8000,20000,25000,11,75416,0,0,0,0,0,16,0,0,0,0,0,0,0, 'Charscale Assaulter - Cast Rally'),
(40419,0,2,0,0,0,100,0,2000,2000,10000,15000,11,75417,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Charscale Assaulter - Cast Shockwave'),
(40423,0,0,0,0,0,100,0,2000,2000,7000,10000,11,13737,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Charscale Commander - Cast Mortal Strike'),
(40423,0,1,0,0,0,100,0,8000,8000,20000,25000,11,75416,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Charscale Commander - Cast Rally'),
(40423,0,2,0,0,0,100,0,6000,6000,60000,65000,11,75414,0,0,0,0,0,16,0,0,0,0,0,0,0, 'Charscale Commander - Cast Rallying Shout');


UPDATE `creature_template` SET  mindmg = 497, maxdmg = 676, attackpower = 795, dmg_multiplier = 35 WHERE entry in (39747,39746);