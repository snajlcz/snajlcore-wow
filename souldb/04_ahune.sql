UPDATE  creature_template SET  minlevel=76,
maxlevel=76 WHERE  entry=25697;
UPDATE  creature_template SET  minlevel=75,
maxlevel=75 WHERE  entry=25754;
UPDATE  creature_template SET  minlevel=20,
maxlevel=20 WHERE  entry=25961;
DELETE FROM creature_template_addon WHERE entry=25754;
INSERT INTO creature_template_addon (entry,path_id,mount,bytes1,bytes2,emote,auras) VALUES 
(25754,0,0,1,0,0,NULL);
-- Daily quest reward
DELETE FROM gameobject_involvedrelation WHERE quest=11691;
DELETE FROM creature_questrelation WHERE quest=11691;
DELETE FROM game_event_creature_quest WHERE quest=11691;
UPDATE  quest_template SET  RewardItemId2=49426,
RewardItemCount2=2 WHERE  Id=25484;
-- NPCs and Objects spawns
DELETE FROM creature WHERE id IN (25755,25756,25757,25740,25697,25961,25754,40446,25745);
DELETE FROM gameobject WHERE id=187882;
INSERT INTO gameobject (id,map,spawnMask,phaseMask,position_x,position_y,position_z,orientation,rotation0,rotation1,rotation2,rotation3,spawntimesecs,animprogress,state) VALUES
(187882,547,1,1,-73.4977,-155.976,-1.8987,3.23816,0,0,0.998834,-0.0482674,300,0,1);
INSERT INTO creature (id,map,spawnMask,phaseMask,modelid,equipment_id,position_x,position_y,position_z,orientation,spawntimesecs,spawndist,currentwaypoint,curhealth,curmana,MovementType,npcflag,unit_flags,dynamicflags) VALUES
(25745,547,1,1,0,0,-73.4977,-155.976,-1.8987,3.23816,300,0,0,42,0,0,0,33554432,0),
(25697,547,1,1,0,0,-90.5919,-119.585,-2.27612,2.38759,300,0,0,42,0,0,0,0,0),
(25961,547,1,1,0,0,-109.22,-120.05,-2.982,0,120,0,0,1,0,0,0,0,0),
(25961,547,1,1,0,0,-92.68,-119.62,-2.27,0,120,0,0,1,0,0,0,0,0),
(25754,547,1,1,0,0,-110.19,-116.62,-3.255,0,120,0,0,1,0,0,0,0,0),
(25754,547,1,1,0,0,-112.2,-120.2,-2.657,0,120,0,0,1,0,0,0,0,0),
(25754,547,1,1,0,0,-93.18,-115.92,-2.692,0,120,0,0,1,0,0,0,0,0),
(40446,547,1,1,0,0,-77.2636,-151.912,-1.92421,5.44435,300,0,0,164,300,0,0,0,0),
(25745,547,1,1,0,0,-97.3569,-222.144,-1.278,1.53498,300,0,0,42,0,0,0,0,0);
DELETE FROM gameobject WHERE id IN (188142,188067);
INSERT INTO gameobject (id,map,spawnMask,phaseMask,position_x,position_y,position_z,orientation,rotation0,rotation1,rotation2,rotation3,spawntimesecs,animprogress,state) VALUES
(188142,547,1,1,-118.441,-197.501,-1.5102,5.93865,0,0,0.171415,-0.985199,300,0,1),
(188142,547,1,1,-76.2934,-210.658,-3.18791,3.18112,0,0,0.999805,-0.0197608,300,0,1),
(188142,547,1,1,-121.058,-161.888,-1.69318,4.15893,0,0,0.873393,-0.487016,300,0,1),
(188067,547,1,1,-75.7694,-156.862,-2.10425,2.79159,0,0,0.984727,0.174108,300,0,1),
(188067,547,1,1,-74.4267,-154.113,-1.78473,5.34021,0,0,0.454211,-0.890894,300,0,1),
(188067,547,1,1,-71.5432,-155.462,-1.74659,3.50631,0,0,0.983419,-0.181351,300,0,1),
(188067,547,1,1,-72.8331,-157.889,-2.06323,1.92766,0,0,0.821382,0.570378,300,0,1);
-- Daily quest loot
DELETE FROM creature_ai_scripts WHERE creature_id IN (25740,25755,25756);
DELETE FROM item_loot_template WHERE entry=54536;
INSERT INTO item_loot_template (entry,item,ChanceOrQuestChance,lootmode,groupid,mincountOrRef,maxcount) VALUES 
(54536,54806,6,1,0,1,1),
(54536,53641,3,1,0,1,1),
(54536,23247,100,1,0,5,15);
-- Skar'this the Summoner
UPDATE  creature_template SET  minlevel=75,
maxlevel=80,
faction_A=16,
faction_H=16,
mindmg=400,
maxdmg=500,
dmg_multiplier=10,
AIName= 'SmartAI',
Health_mod=13 WHERE  entry=40446;
DELETE FROM smart_scripts WHERE entryorguid=40446;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
(40446,0,0,0,0,0,100,0,5000,5000,15000,15000,11,55909,1,0,0,0,0,2,0,0,0,0,0,0,0,'Skar''this the Summoner - cast Crashing Wave'),
(40446,0,1,0,0,0,100,0,10000,10000,20000,20000,11,11831,1,0,0,0,0,2,0,0,0,0,0,0,0,'Skar''this the Summoner - cast Frost Nova'),
(40446,0,2,0,0,0,100,0,7000,7000,9000,9000,11,15043,0,0,0,0,0,2,0,0,0,0,0,0,0,'Skar''this the Summoner - cast Frostbolt'),
(40446,0,3,0,0,0,100,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Skar''this the Summoner - On agro - say');
DELETE FROM creature_text WHERE  entry=40446;
INSERT INTO creature_text (entry,groupid,id,text,type,language,probability,emote,duration,sound,comment) VALUES 
(40446,0,0,'How DARE you! You will not stop the coming of Lord Ahune!',14,0,100,0,0,0,'');
-- Ice Stone & bunny scripts
UPDATE  creature_template SET  modelid1=21955,
modelid2=0,
AIName= 'SmartAI',
flags_extra=130 WHERE  entry IN (25745,25746);
UPDATE  gameobject_template SET  AIName= 'SmartGameObjectAI' WHERE  entry=187882;
DELETE FROM smart_scripts WHERE entryorguid IN (40446,187882,18788200,25745,25746);
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES 
(187882,1,0,1,62,0,100,0,11389,1,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'On Gossip - close Gossip'),
(187882,1,1,0,61,0,100,0,0,0,0,0,80,18788200,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Gossip - call Actionlist'),
(18788200,9,0,0,0,0,100,0,500,500,0,0,9,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ice Stone - activate'),
(18788200,9,1,0,0,0,100,0,5000,5000,0,0,12,25740,6,500000,0,0,0,8,0,0,0,-97.3569,-222.144,-1.278,1.5495,'Ice Stone - spawn Ahune'),
(25745,0,0,0,1,0,100,0,1000,1000,15000,15000,11,45945,1,0,0,0,0,1,0,0,0,0,0,0,0,'Ahune - Slippery Floor'),
(25746,0,0,0,54,0,100,0,0,0,0,0,11,45939,1,0,0,0,0,1,0,0,0,0,0,0,0,'Ice Chest bunny - summon Ice Chest');
DELETE FROM gossip_menu WHERE entry=11389;
INSERT INTO gossip_menu VALUES (11389,15864);
DELETE FROM gossip_menu_option WHERE menu_id=11389;
INSERT INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,box_coded,box_money,box_text) VALUES
(11389,1,0,'Disturb the stone and summon Lord Ahune.',1,1,0,0,0,0,NULL);
-- Ice Core scripts
UPDATE  creature_template SET  difficulty_entry_1=0,
minlevel=80,
maxlevel=80,
faction_A=16,
faction_H=16,
mindmg=0,
maxdmg=0,
dmg_multiplier=0,
unit_flags=262148,
Health_mod=100,
AIName= 'SmartAI' WHERE  entry=25865;
DELETE FROM smart_scripts WHERE entryorguid=25865;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
(25865,0,0,0,0,0,100,1,20000,20000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Frozen Core - announce'),
(25865,0,1,0,6,0,100,0,0,0,0,0,51,0,0,0,0,0,0,11,25740,10,0,0,0,0,0,'Frozen Core - Kill Ahune');
DELETE FROM creature_text WHERE entry=25865;
INSERT INTO creature_text (entry,groupid,id,text,type,language,probability,emote,duration,sound,comment) VALUES 
(25865,0,0,'Ahune will soon resurface.',41,0,100,0,0,0,'');
-- Ice Spear scripts
UPDATE  creature_template SET  modelid1=21955,
modelid2=0,
AIName= 'SmartAI',
flags_extra=130 WHERE  entry=25985;
UPDATE  gameobject_template SET  flags= '16' WHERE  gameobject_template.entry=188077;
DELETE FROM smart_scripts WHERE entryorguid=25985;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
(25985,0,0,1,54,0,100,1,0,0,0,0,11,75498,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Summon - Ice Spear Visual'),
(25985,0,1,0,61,0,100,1,0,0,0,0,50,188077,3000,0,0,0,0,1,0,0,0,0,0,0,0,'OOC - Summon Ice Spear Object'),
(25985,0,2,3,0,0,100,1,3000,3000,0,0,11,46360,0,0,0,0,0,1,0,0,0,0,0,0,0,'OOC - cast Ice Spear'),
(25985,0,3,4,61,0,100,1,0,0,0,0,9,0,0,0,0,0,0,15,188077,2,0,0,0,0,0,'OOC - Activate Ice Spear Object'),
(25985,0,4,0,61,0,100,1,0,0,0,0,41,0,0,0,0,0,0,15,188077,2,0,0,0,0,0,'OOC - Despawn Ice Spear Object');
-- Spell Cold Slap
DELETE FROM spell_linked_spell WHERE spell_trigger=46145;
INSERT INTO spell_linked_spell (spell_trigger,spell_effect,type,comment) VALUES 
(46145,64319,0,'Cold Slap - triggered Knockback');
-- Ahunite Hailstone
UPDATE  creature_template SET  difficulty_entry_1=0,
minlevel=80,
maxlevel=80,
faction_A=16,
faction_H=16,
mindmg=422,
maxdmg=586,
attackpower=642,
dmg_multiplier=15,
Health_mod=18.77,
AIName= '',
ScriptName= 'npc_ahunite_hailstone' WHERE  entry=25755;
-- Ahunite Coldweave
UPDATE  creature_template SET  difficulty_entry_1=0,
minlevel=80,
maxlevel=80,
faction_A=16,
faction_H=16,
mindmg=422,
maxdmg=586,
attackpower=642,
dmg_multiplier=7,
Health_mod=3.6,
AIName= '',
ScriptName= 'npc_ahunite_coldweave' WHERE  entry=25756;
-- Ahunite Frostwind
UPDATE  creature_template SET  ScriptName= 'npc_ahunite_frostwind' WHERE  entry=25757;
-- Ahune
UPDATE  creature_template SET  difficulty_entry_1=0,
minlevel=82,
maxlevel=82,
unit_flags=4,
lootid=0,
AIName= '',
mechanic_immune_mask = 617299803,
ScriptName= 'boss_ahune' WHERE  entry=25740;
