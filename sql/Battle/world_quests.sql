set names utf8;
-- Quests fix 4921 "Пропавшая без вести"
UPDATE `creature_template` SET `npcflag` = 3 WHERE `entry` = 10668;

-- Quests fix 6001,6002 Druid
UPDATE `quest_template` SET `RequiredNpcOrGo1`='12138' WHERE `Id`=6001; 
UPDATE `quest_template` SET `RequiredNpcOrGoCount1`='1' WHERE `Id`=6001;
UPDATE `quest_template` SET `SpecialFlags`=0 WHERE `Id`=6001;
UPDATE `quest_template` SET `RequiredNpcOrGo1`='12138' WHERE `Id`=6002; 
UPDATE `quest_template` SET `RequiredNpcOrGoCount1`='1' WHERE `Id`=6002;
UPDATE `quest_template` SET `SpecialFlags`=0 WHERE `Id`=6002;

-- Quests: A Suitable Disguise, http://old.wowhead.com/quest=20438
--                              http://old.wowhead.com/quest=24556
SET @ENTRY := 36856;
SET @SOURCETYPE := 0;
SET @GOSSIP := 10854;
SET @MENUID := 0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,2,62,0,100,0,@GOSSIP,@MENUID,0,0,50,201384,60,0,0,0,0,8,0,0,0,5802.22,691.556,657.949,3.50801,"Arcanum Core - Script for quest http://wowhead.com/quest=24556"),
(@ENTRY,@SOURCETYPE,1,2,62,0,100,0,@GOSSIP,@MENUID+1,0,0,50,201384,60,0,0,0,0,8,0,0,0,5802.22,691.556,657.949,3.50801,"Arcanum Core - Script for quest http://wowhead.com/quest=20438"),
(@ENTRY,@SOURCETYPE,2,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"On gossip option select - Close gossip");

-- Pit_of_saron_questfixes
DELETE FROM `creature_questrelation` WHERE `quest` IN (24510,24499,24498,24710,24711,24506,24511,24682,24683,24507,24712,24713);
DELETE FROM `creature_involvedrelation` WHERE `quest` IN (24510,24499,24498,24710,24711,24506,24511,24682,24683,24507,24712,24713);
INSERT INTO `creature_questrelation` (`id`,`quest`) VALUES 
-- alliance
(37776,24510),
(37597,24499),
(38160,24683),
(36993,24498),
(37591,24710),
(38188,24711),
-- horde
(37780,24506),
(37596,24511),
(38161,24682),
(36990,24507),
(37592,24712),
(38189,24713);
INSERT INTO `creature_involvedrelation` (`id`,`quest`) VALUES 
-- alliance
(37597,24510),
(38160,24499),
(36993,24683),
(37591,24498),
(38188,24710),
(37221,24711),
-- horde
(37596,24506),
(38161,24511),
(36990,24682),
(37592,24507),
(38189,24712),
(37223,24713);
SET @GOBJ := 201969; -- ball and chain
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry`=@GOBJ;
DELETE FROM `smart_scripts` WHERE `source_type`=1 AND `entryorguid`=@GOBJ;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@GOBJ,1,0,0,64,0,100,0,0,0,0,0,33,36764,0,0,0,0,0,7,0,0,0,0,0,0,0, 'credit on gossip hello - alliance'),
(@GOBJ,1,1,0,64,0,100,0,0,0,0,0,33,36770,0,0,0,0,0,7,0,0,0,0,0,0,0, 'credit on gossip hello - horde');

-- Quest 12872
UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry`=29775;

-- Quest 10368 THX @Dimitro
SET @ENTRY := 20678;
SET @SOURCETYPE := 0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,1,62,0,100,0,8163,0,0,0,33,20678,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Arcanum Core - Script quest 10368"),
(@ENTRY,@SOURCETYPE,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Arcanum Core - Script quest 10368");
SET @ENTRY := 20677;
SET @SOURCETYPE := 0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,1,62,0,100,0,8162,0,0,0,33,20678,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Arcanum Core - Script quest 10368"),
(@ENTRY,@SOURCETYPE,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Arcanum Core - Script quest 10368");
SET @ENTRY := 20679;
SET @SOURCETYPE := 0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,1,62,0,100,0,8161,0,0,0,33,20678,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Arcanum Core - Script quest 10368"),
(@ENTRY,@SOURCETYPE,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Arcanum Core - Script quest 10368");

-- Dalaran
-- Missing fishing loot
INSERT INTO `fishing_loot_template`(`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES 
( '4395','43630','0.2','1','1','1','1');

-- Nagrand arena
UPDATE `smart_scripts` SET `target_type`=16 WHERE
    (`entryorguid`=18398 AND `id`=1) OR
    (`entryorguid`=18399 AND `id`=4) OR
    (`entryorguid`=18400 AND `id`=5) OR
    (`entryorguid`=18401 AND `id`=3) OR
    (`entryorguid`=18402 AND `id`=4 AND `link`=5);
UPDATE `smart_scripts` SET `action_param2`=5 WHERE
    (`entryorguid`=1847100 AND `id`=1) OR
    (`entryorguid`=1847101 AND `id` IN (1,2)) OR
    (`entryorguid`=1847102 AND `id`=1) OR
    (`entryorguid`=1847103 AND `id`=1) OR
    (`entryorguid`=1847104 AND `id`=1);
DELETE FROM `smart_scripts` WHERE `entryorguid`=18069 AND `id`= 5;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(18069,0,5,0,6,0,100,0,0,0,0,0,15,9977,0,0,0,0,0,16,0,0,0,0,0,0,0,"Mogor - On Death - Give Quest Credit");
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|0x10000000 WHERE `entry`=18069;
UPDATE `creature` SET `spawntimesecs`=0 WHERE `id`=18069;

-- DB/Quest: Fix: Standards and Practices
-- DB/Quest: Fix: Standarten
SET @SpellBattleStandard := 32205; -- Place Mag'har Battle Standard
SET @FirstTriggerNPC := 18305; -- First trigger NPC
SET @SecondTriggerNPC := 18306; -- Second trigger NPC
SET @ThirdTriggerNPC := 18307; -- Third trigger NPC
SET @FirstBB := 182261; -- First Burning Blade Pyre
SET @SecondBB := 182264; -- Second Burning Blade Pyre
SET @ThirdBB := 182262; -- Third Burning Blade Pyre
SET @TriggerBB := 182263; -- First Burning Blade Pyre (Trigger GO)
-- Spawnpoints of Burning Blades
DELETE FROM `gameobject` WHERE `id` IN (@FirstBB, @SecondBB, @ThirdBB, @TriggerBB);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(22718, @TriggerBB, 530, 1, 1, -2532.98, 6307.27, 14.0203, 2.95833, 0, 0, 0.995805, 0.091502, 181, 100, 1),
(379, @TriggerBB, 530, 1, 1, -2533.19, 6168.61, 59.9391, 2.81871, 0, 0, 0.986996, 0.160743, 181, 100, 1),
(371, @TriggerBB, 530, 1, 1, -2475.29, 6106.4, 91.9832, 1.98095, 0, 0, 0.836286, 0.548293, 181, 100, 1),
(22716, @FirstBB, 530, 1, 1, -2532.98, 6307.27, 14.0203, 2.95833, 0, 0, 0.995805, 0.091502, 181, 100, 1),
(22719, @SecondBB, 530, 1, 1, -2533.19, 6168.61, 59.9391, 2.81871, 0, 0, 0.986996, 0.160743, 181, 100, 1),
(22717, @ThirdBB, 530, 1, 1, -2475.29, 6106.4, 91.9832, 1.98095, 0, 0, 0.836286, 0.548293, 181, 100, 1);
-- Trigger NPC's for quest complete
DELETE FROM `creature` WHERE `guid` IN (65640, 65641, 65642);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(65640, @FirstTriggerNPC, 530, 1, 1, 0, 0, -2532.98, 6307.27, 14.0203, 2.95833, 300, 0, 0, 800, 0, 0, 0, 0, 0),
(65641, @SecondTriggerNPC, 530, 1, 1, 0, 0, -2533.19, 6168.61, 59.9391, 2.81871, 300, 0, 0, 800, 0, 0, 0, 0, 0),
(65642, @ThirdTriggerNPC, 530, 1, 1, 0, 0, -2475.29, 6106.4, 91.9832, 1.98095, 300, 0, 0, 800, 0, 0, 0, 0, 0);
-- Ignore LOS for trigger spell
DELETE FROM `disables` WHERE `sourceType` = 0 AND `entry` = @SpellBattleStandard;
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES
(0, @SpellBattleStandard, 64, '', '', 'Ignore LOS for Place Mag''har Battle Standard');

-- DB/Quest: Fix: Rallying the Troops
-- DB/Quest: Fix: Neue Kraft für die Truppen
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE entry = 26261;
-- Grant quest credit, after spell used on npc.
DELETE FROM `smart_scripts` WHERE entryorguid = 26261;
INSERT INTO `smart_scripts` VALUES (26261, 0, 0, 0, 8, 0, 100, 0, 47394, 0, 0, 0, 33, 26261, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Spellhit call Killcredit for Q 12070');

-- Creature_AI to Smart_AI Conversion for Proto-Drake Egg (ID 23777)
-- Delete old Creature_AI, set new one.
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 23777;
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry` = 23777;
-- New Smart_AI
DELETE FROM `smart_scripts` WHERE `entryorguid` = 23777;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(23777,0,0,1,25,0,100,0,0,0, 0, 0, 21 ,0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Proto-Drake Egg - On Spawn - Prevent Combat Movement"),
(23777,0,1,0,61,0,100,0,0,0, 0, 0, 20 ,0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Proto-Drake Egg - Linked with Previous Event - Disable Combat"),
(23777,0,2,3,8 ,0,100,0,46606,0, 0, 0, 12 ,24160, 1, 300000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Proto-Drake Egg - On Spellhit Tillinghast's Plague Canister Dummy - Spawn Plagued Proto-Whelp"),
(23777,0,3,0,61,0,100,0,0,0, 0, 0, 37 ,0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Proto-Drake Egg - Linked with Previous Event - Die"),
(23777,0,4,0,6 ,1,100,0,0,0, 0, 0, 12 ,23688, 1, 300000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Proto-Drake Egg - On Death - Spawn Proto-Whelp"),
(23777,0,5,0,4, 0,100,1,0,0,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0, "Proto-Drake Egg - On Aggro - Set Phase 2");

-- DB/Quest: Update: Arena Grandmaster
-- DB/Quest: Update: Großmeister der Arena
-- Update SpecialFlags, NOT repeatable. (hack)
UPDATE `quest_template` SET SpecialFlags = 0 WHERE `Id` = 7838;

-- DB/Quest: Fix: The Heart of the Storm | by Pitcrawler
-- DB/Quest: Fix: Das Herz des Sturms
SET @NARVIR := 30299;
SET @HEART := 192181;
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry`=@HEART;
UPDATE `creature_template` SET `speed_run`=0.99206, `faction_H`=1954, `faction_A`=1954, `unit_flags`=768, `AIName`='SmartAI' WHERE `entry`=@NARVIR;
DELETE FROM `creature_equip_template` WHERE `entry`=@NARVIR;
INSERT INTO `creature_equip_template` (`entry`,`id`,`itemEntry1`,`itemEntry2`,`itemEntry3`) VALUES
(@NARVIR,1,35727,0,0);
DELETE FROM `smart_scripts` WHERE `entryorguid`=@NARVIR AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@HEART AND `source_type`=1;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@NARVIR*100,@HEART*100) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@NARVIR,0,0,0,11,0,100,0,0,0,0,0,80,@NARVIR*100,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Overseer Narvir - On spawn - Run script'),
(@NARVIR,0,1,2,8,0,100,0,40163,0,0,0,33,@NARVIR,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Overseer Narvir - On spellhit Teleport - Quest credit'),
(@NARVIR,0,2,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Overseer Narvir - On spellhit Teleport - Despawn'),
(@HEART,1,0,0,70,0,100,0,2,0,0,0,80,@HEART*100,2,0,0,0,0,1,0,0,0,0,0,0,0, 'The Heart of the Storm - On state changed - Run script'),
(@NARVIR*100,9,0,0,0,0,100,0,20,20,0,0,11,56485,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Overseer Narvir script - Spellcast The Storm''s Fury'),
(@NARVIR*100,9,1,0,0,0,100,0,500,500,0,0,69,0,0,0,0,0,0,8,0,0,0,7312.406,-726.3165,791.6095,0, 'Overseer Narvir script - Move to position'),
(@NARVIR*100,9,2,0,0,0,100,0,6500,6500,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,1.919862, 'Overseer Narvir script - Turn to'),
(@NARVIR*100,9,3,0,0,0,100,0,1500,1500,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Overseer Narvir script - Say line'),
(@NARVIR*100,9,4,0,0,0,100,0,6000,6000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Overseer Narvir script - Say line'),
(@NARVIR*100,9,5,0,0,0,100,0,3000,3000,0,0,5,274,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Overseer Narvir script - Play emote'),
(@NARVIR*100,9,6,0,0,0,100,0,3000,3000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,3.385939, 'Overseer Narvir script - Turn to'),
(@NARVIR*100,9,7,0,0,0,100,0,500,500,0,0,17,69,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Overseer Narvir script - Play emotestate'),
(@NARVIR*100,9,8,0,0,0,100,0,3500,3500,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Overseer Narvir script - Stop emotestate'),
(@NARVIR*100,9,9,0,0,0,100,0,1500,1500,0,0,11,40163,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Overseer Narvir script - Spellcast Teleport'),
(@HEART*100,9,0,0,0,0,100,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0, 'The Heart of the Storm script - Store targetlist'),
(@HEART*100,9,1,0,0,0,100,0,0,0,0,0,12,@NARVIR,8,0,0,0,0,8,0,0,0,7313.231,-711.5209,791.6917,5.61996, 'The Heart of the Storm script - Summon Overseer Narvir'),
(@HEART*100,9,2,0,0,0,100,0,10,10,0,0,100,1,0,0,0,0,0,19,@NARVIR,50,0,0,0,0,0, 'The Heart of the Storm script - Send targetlist to Overseer Narvir');
DELETE FROM `creature_text` WHERE `entry`=@NARVIR;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@NARVIR,0,0,'You didn''t think that I was going to let you walk in here and take the Heart of the Storm, did you?',12,0,100,6,0,0,'Overseer Narvir'),
(@NARVIR,1,0,'You may have killed Valduran, but that will not stop me from completing the colossus.',12,0,100,1,0,0,'Overseer Narvir');

-- DB/Quest: Fix: In Search Of Answers
-- DB/Quest: Fix: Auf der Suche nach Antworten
-- Activate GO for players.
UPDATE `gameobject_template` SET flags = 32 WHERE entry = 191766;

-- DB/Quest: Fix: A Suitable Disguise
-- DB/Quest: Fix: Eine passende Verkleidung
/* SUMMARY:
Basically we are running a random script (4 in total) every 12 seconds after gossip select. Every script has a different subject. For example when we run script @ENTRY*100+1 it will require you to throw a bucket of water into the tub. If you don't do this on time, the event will fail and you'll have to start it over again.
The gossip flags are turned off on gossip select (@ENTRY*100+0) because we don't want the same event to be ran more than once at a time.
As you might have noticed we are using phases a LOT. This helps us to basically add conditions to some lines so they won't occur all the time, yet we can easily time them OOC.
We are also using Data Set event and action types a lot. As you can see when a bunny is hit by the spell which belongs to it, it will set data to Shandy which makes Shandy say something like 'Well done'.
The way the gameobjects are handled is maybe pretty much a work-around but it will need a LOT of core work to make this work like it works on Blizzlike. It should be different objects if you're either horde or alliance. Right now I've just spawned them on-top of each other, because in the end you can only use the object which belongs to your faction.
PROBLEMS:
Shandy Glossgleam should start a waypoint after completing script. (wtb sniffs)
Aquanos' evocation spell seems to have a bugged effect.
RESOURCES:
http://www.youtube.com/watch?v=Fe4mRWO20Hw
http://www.youtube.com/watch?v=tqBbFr_BhC4
http://www.youtube.com/watch?v=OFBRam2MgUw
http://www.wowwiki.com/Quest:A_Suitable_Disguise_(Alliance)
PHASES:
Phase 0: when event did not start yet
Phase 1: when event is happening
Phase 2: when event failed
Phase 4: resetting everything */
-- Shandy Glossgleam SAI
SET @ENTRY := 36856;
SET @QUEST_A := 20438;
SET @QUEST_H := 24556;
SET @GUID := 10000000; -- Go ahead Nayd
SET @GOSSIP := @ENTRY; -- Here as well
UPDATE `creature_template` SET `AIName`='SmartAI',`gossip_menu_id`=@GOSSIP WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY,@ENTRY*100+0,@ENTRY*100+1,@ENTRY*100+2,@ENTRY*100+3,@ENTRY*100+4,@ENTRY*100+5,@ENTRY*100+6,@ENTRY*100+7);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`, `event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`, `target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,62,0,100,0,@GOSSIP,0,0,0,80,@ENTRY*100+0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shandy Glossgleam - On Gossip Select - Run script"),
(@ENTRY,0,1,0,1,1,100,0,8000,8000,12000,12000,88,@ENTRY*100+1,@ENTRY*100+4,0,0,0,0,1,0,0,0,0,0,0,0,"Shandy Glossgleam - Timed - Run Random Script"),
(@ENTRY,0,2,0,38,1,100,0,1,1,0,0,80,@ENTRY*100+5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shandy Glossgleam - On Data Set 1 1 - Run Task Successful Script"),
(@ENTRY,0,3,0,1,1,100,1,120000,120000,0,0,80,@ENTRY*100+7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shandy Glossgleam - Timed - Run Complete Script"),
(@ENTRY,0,4,0,1,2,100,1,0,0,0,0,80,@ENTRY*100+6,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shandy Glossgleam - Timed - Run Failure Script"),
(@ENTRY,0,5,0,1,4,100,1,0,0,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shandy Glossgleam - Timed - Set Back Gossip & Quest Flags"), -- This can only occur in phase 4 so no need to time it (P4 is set in completion script)
(@ENTRY,0,6,0,1,4,100,1,0,0,0,0,78,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shandy Glossgleam - Timed - Reset Scripts"),
-- Start script
(@ENTRY*100+0,9,0,0,0,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Shandy Glossgleam - Script 0 - Close Gossip"),
(@ENTRY*100+0,9,1,0,0,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shandy Glossgleam - Script 0 - Turn of Gossip & Questgiver flags"),
(@ENTRY*100+0,9,2,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shandy Glossgleam - Script 0 - Say Line 0"),
(@ENTRY*100+0,9,3,0,0,0,100,0,5000,5000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shandy Glossgleam - Script 0 - Say Line 1"),
(@ENTRY*100+0,9,4,0,0,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shandy Glossgleam - Script 0 - Set Phase 1"),
-- Wants Water
(@ENTRY*100+1,9,0,0,0,0,100,0,0,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shandy Glossgleam - Script 1 - Say Line 4"),
(@ENTRY*100+1,9,1,0,0,0,100,0,0,0,0,0,12,36947,1,10000,0,0,0,8,0,0,0,5796.970215,693.942993,658.351990,0,"Shandy Glossgleam - Script 1 - Summon Wants Water"),
(@ENTRY*100+1,9,2,0,0,0,100,0,10000,10000,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shandy Glossgleam - Script 1 - Set Phase 2"),
-- Wants Pants
(@ENTRY*100+2,9,0,0,0,0,100,0,0,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shandy Glossgleam - Script 2 - Say Line 5"),
(@ENTRY*100+2,9,1,0,0,0,100,0,0,0,0,0,12,36945,1,10000,0,0,0,8,0,0,0,5796.970215,693.942993,658.351990,0,"Shandy Glossgleam - Script 2 - Summon Wants Pants"),
(@ENTRY*100+2,9,2,0,0,0,100,0,10000,10000,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shandy Glossgleam - Script 2 - Set Phase 2"),
-- Wants Unmentionables
(@ENTRY*100+3,9,0,0,0,0,100,0,0,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shandy Glossgleam - Script 3 - Say Line 3"),
(@ENTRY*100+3,9,1,0,0,0,100,0,0,0,0,0,12,36946,1,10000,0,0,0,8,0,0,0,5796.970215,693.942993,658.351990,0,"Shandy Glossgleam - Script 3 - Summon Wants Unmentionables"),
(@ENTRY*100+3,9,2,0,0,0,100,0,10000,10000,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shandy Glossgleam - Script 3 - Set Phase 2"),
-- Wants Shirts
(@ENTRY*100+4,9,0,0,0,0,100,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shandy Glossgleam - Script 4 - Say Line 2"),
(@ENTRY*100+4,9,1,0,0,0,100,0,0,0,0,0,12,36944,1,10000,0,0,0,8,0,0,0,5796.970215,693.942993,658.351990,0,"Shandy Glossgleam - Script 4 - Summon Wants Shirts"),
(@ENTRY*100+4,9,2,0,0,0,100,0,10000,10000,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shandy Glossgleam - Script 4 - Set Phase 2"),
-- Task successful
(@ENTRY*100+5,9,0,0,0,0,100,0,0,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shandy Glossgleam - Script 6 - Say Line 6 (random)"),
-- End failure
(@ENTRY*100+6,9,0,0,0,0,100,0,0,0,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shandy Glossgleam - Script 7 - Say Line 7"),
(@ENTRY*100+6,9,1,0,0,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shandy Glossgleam - Script 7 - Force Despawn"),
-- Completion script
(@ENTRY*100+7,9,0,0,0,0,100,0,0,0,0,0,78,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shandy Glossgleam - Script 8 - Stop Current Scripts"),
(@ENTRY*100+7,9,1,0,0,0,100,0,2000,2000,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shandy Glossgleam - Script 8 - Say Line 8"),
(@ENTRY*100+7,9,2,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,19,36851,0,0,0,0,0,0,"Shandy Glossgleam - Script 8 - Face Aquanos"),
(@ENTRY*100+7,9,3,0,0,0,100,0,8000,8000,0,0,1,9,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shandy Glossgleam - Script 8 - Say Line 9"),
(@ENTRY*100+7,9,4,0,0,0,100,0,0,0,0,0,50,201384,30000,0,0,0,0,8,0,0,0,5797.147461,696.602417,657.949463,6.090852,"Shandy Glossgleam - Script 8 - Summon Clean Laundry"),
(@ENTRY*100+7,9,5,0,0,0,100,0,0,0,0,0,22,4,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shandy Glossgleam - Script 8 - Set Phase 4"),
(@ENTRY*100+7,9,6,0,0,0,100,0,0,0,0,0,41,8000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shandy Glossgleam - Script 8 - Force Despawn");
-- Texts
-- They all emote ONESHOT_TALK apart from request texts (as seen in videos)
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
-- Start
(@ENTRY,0,0,"You're in luck. I've got just what you need in the load I'm about to wash.",12,0,100,0,0,0,"Shandy Glossgleam"),
(@ENTRY,1,0,"See the piles of laundry and the bucket of water? I'll run out what I need next, and you put it in the tub. Ready?",12,0,100,0,0,0,"Shandy Glossgleam"),
-- Requests
(@ENTRY,2,0,"Quick, add some shirts to the laundry!",12,0,100,0,0,0,"Shandy Glossgleam"), -- Emote ONESHOT_POINT
(@ENTRY,3,0,"Add the unmentionables... uh, I mean, the 'delicates'!",12,0,100,25,0,0,"Shandy Glossgleam"), -- Emote ONESHOT_POINT
(@ENTRY,4,0,"The tub needs more water!",12,0,100,25,0,0,"Shandy Glossgleam"), -- Emote ONESHOT_POINT
(@ENTRY,5,0,"Toss some pants in to the tub!",12,0,100,25,0,0,"Shandy Glossgleam"), -- Emote ONESHOT_POINT
-- Correct
(@ENTRY,6,0,"I should keep you around.",12,0,100,0,0,0,"Shandy Glossgleam"),
(@ENTRY,6,1,"Well done!",12,0,100,0,0,0,"Shandy Glossgleam"),
(@ENTRY,6,2,"That's how it's done!",12,0,100,0,0,0,"Shandy Glossgleam"),
(@ENTRY,6,3,"Clean and tidy!",12,0,100,0,0,0,"Shandy Glossgleam"),
(@ENTRY,6,4,"Nice. I don't want to know what that stain was.",12,0,100,0,0,0,"Shandy Glossgleam"),
(@ENTRY,6,5,"Aquanos can hardly keep up!",12,0,40,0,0,0,"Shandy Glossgleam"),
-- Incorrect
(@ENTRY,7,0,"Oh, no! That wasn't right. Now I'll have to go get more detergent so we can start over!",12,0,100,0,0,0,"Shandy Glossgleam"),
-- End
(@ENTRY,8,0,"Aquanos, stop sending the clothes so high! You didn't have to see the look on Aethas Sunreaver's face when he found his pants in the fountain!",12,0,100,0,0,0,"Shandy Glossgleam"),
(@ENTRY,9,0,"See how easy that was with everyone working together? Just take what you need from the clean laundry here, but don't forget to return it when you're finished.",12,0,100,0,0,0,"Shandy Glossgleam");
-- Give Clean Laundry quest item loot
DELETE FROM `gameobject_loot_template` WHERE `entry`=27725;
INSERT INTO `gameobject_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(27725,49648,-100,1,0,1,1);
-- Summon quest gameobjects
DELETE FROM `gameobject` WHERE `id` IN (201295,201931,201301,201296,201300,201932,201936,201933,201299,201855,201298) AND `guid` BETWEEN @GUID+0 AND @GUID+10;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GUID+0,201295,571,1,1,5805.76,694.548,657.949,4.79886,0,0,0.675882,-0.73701,300,0,1),
(@GUID+1,201931,571,1,1,5805.76,694.548,658.447,0.139097,0,0,0.0694922,0.997582,300,0,1),
(@GUID+2,201301,571,1,1,5805.76,694.548,658.447,0.139097,0,0,0.0694922,0.997582,300,0,1),
(@GUID+3,201296,571,1,1,5805.29,691.864,657.949,4.76666,0,0,0.687659,-0.726034,300,0,1),
(@GUID+4,201300,571,1,1,5805.29,691.864,658.365,4.77845,0,0,0.683371,-0.730071,300,0,1),
(@GUID+5,201932,571,1,1,5805.29,691.864,658.365,4.77845,0,0,0.683371,-0.730071,300,0,1),
(@GUID+6,201936,571,1,1,5805.28,697.603,657.949,3.61841,0,0,0.971715,-0.236158,300,0,1),
(@GUID+7,201933,571,1,1,5805.28,697.603,658.281,3.61841,0,0,0.971715,-0.236158,300,0,1),
(@GUID+8,201299,571,1,1,5805.28,697.603,658.281,3.61841,0,0,0.971715,-0.236158,300,0,1),
(@GUID+9,201855,571,1,1,5806.72,690.329,659.15,5.65024,0,0,0.311216,-0.950339,300,0,1),
(@GUID+10,201298,571,1,1,5806.72,690.329,659.15,5.65024,0,0,0.311216,-0.950339,300,0,1);
-- Insert option menu
DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`) VALUES
(@GOSSIP,0,0,"Arcanist Tybalin said you might be able to lend me a certain tabard.",1,1);
-- Basic text for Shandy Glossgleam
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=15066;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,15066);
-- Add conditions for gossip - as you see we are using ElseGroup (logical 'OR')
DELETE FROM `conditions` WHERE `SourceGroup` IN (@GOSSIP) AND `ConditionValue1` IN (@QUEST_A,@QUEST_H);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@GOSSIP,0,0,9,@QUEST_A,0,0,0,'',"Only show first gossip if player is on quest A Suitable Disguise (A)"),
(15,@GOSSIP,0,1,9,@QUEST_H,0,0,0,'',"Only show first gossip if player is on quest A Suitable Disguise (H)");
-- Aquanos SAI
SET @ENTRY := 36851;
SET @SPELL_EVOCATION := 69659;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`, `event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`, `target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,38,0,100,0,2,2,0,0,11,@SPELL_EVOCATION,1,0,0,0,0,1,0,0,0,0,0,0,0,"Aquanos - On Data Set 2 2 - Cast Evocation (Visual Only)");
-- Wants Water SAI
SET @ENTRY := 36947;
SET @SPELL_WATER := 69614;
UPDATE `creature_template` SET `AIName`='SmartAI',`minlevel`=70,`maxlevel`=70,`exp`=2,`unit_class`=2,`unit_flags`=`unit_flags`|33554432,`flags_extra`=`flags_extra`|128 WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`, `event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`, `target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,8,0,100,1,@SPELL_WATER,0,0,0,45,1,1,0,0,0,0,19,36856,0,0,0,0,0,0,"Wants Water - On Spellhit - Set Data Shandy Glossgleam"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,45,2,2,0,0,0,0,19,36851,0,0,0,0,0,0,"Wants Water - On Spellhit - Set Data Aquanos");
-- Wants Pants SAI
SET @ENTRY := 36945;
SET @SPELL_PANTS := 69600;
UPDATE `creature_template` SET `AIName`='SmartAI',`minlevel`=70,`maxlevel`=70,`exp`=2,`unit_class`=2,`unit_flags`=`unit_flags`|33554432,`flags_extra`=`flags_extra`|128 WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`, `event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`, `target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,8,0,100,1,@SPELL_PANTS,0,0,0,45,1,1,0,0,0,0,19,36856,0,0,0,0,0,0,"Wants Pants - On Spellhit - Set Data Shandy Glossgleam"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,45,2,2,0,0,0,0,19,36851,0,0,0,0,0,0,"Wants Pants - On Spellhit - Set Data Aquanos");
-- Wants Unmentionables SAI
SET @ENTRY := 36946;
SET @SPELL_UNMENTIONABLES := 69601;
UPDATE `creature_template` SET `AIName`='SmartAI',`minlevel`=70,`maxlevel`=70,`exp`=2,`unit_class`=2,`unit_flags`=`unit_flags`|33554432,`flags_extra`=`flags_extra`|128 WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`, `event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`, `target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,8,0,100,1,@SPELL_UNMENTIONABLES,0,0,0,45,1,1,0,0,0,0,19,36856,0,0,0,0,0,0,"Wants Unmentionables - On Spellhit - Set Data Shandy Glossgleam"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,45,2,2,0,0,0,0,19,36851,0,0,0,0,0,0,"Wants Unmentionables - On Spellhit - Set Data Aquanos");
-- Wants Shirts SAI
SET @ENTRY := 36944;
SET @SPELL_SHIRT := 69593;
UPDATE `creature_template` SET `AIName`='SmartAI',`minlevel`=70,`maxlevel`=70,`exp`=2,`unit_class`=2,`unit_flags`=`unit_flags`|33554432,`flags_extra`=`flags_extra`|128 WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`, `event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`, `target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,8,0,100,1,@SPELL_SHIRT,0,0,0,45,1,1,0,0,0,0,19,36856,0,0,0,0,0,0,"Wants Shirts - On Spellhit - Set Data Shandy Glossgleam"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,45,2,2,0,0,0,0,19,36851,0,0,0,0,0,0,"Wants Shirts - On Spellhit - Set Data Aquanos");
-- The conditions are made this way because the PLAYER should throw the 'item'. (water, shirt, pant, etc.) Basically when you click the object it casts a trigger spell on you. This trigger spell can only target players and will make the player cast 'Toss XX', which has direct conditions to one of the Wants XX imps.
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (69593,69600,69601,69614,69548,69542,69544,69543);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`comment`) VALUES
(13,1,69593,31,3,36944, 'Toss Shirts requires target Wants Shirts'),
(13,1,69600,31,3,36945, 'Toss Pants requires target Wants Pants'),
(13,1,69601,31,3,36946, 'Toss Unmentionables requires target Wants Unmentionables'),
(13,1,69614,31,3,36947, 'Toss Water requires target Wants Water'),
-- other conditions are unneeded, and having them causes problems.
-- These are erroring still, but the quest works with this change:
(13,1,69548,32,128,0,'Trigger Throw Water requires target player'),
(13,1,69542,32,128,0,'Trigger Throw Pants requires target player'),
(13,1,69544,32,128,0,'Trigger Throw Unmentionables requires target player'),
(13,1,69543,32,128,0,'Trigger Throw Shirt requires target player');

-- DB/Quest: Hack: Investigate the Blue Recluse
-- DB/Quest: Hack: Untersuchungen im Blauen Eremiten
SET @ENTRY = 6492;
-- Add spawns for NPC Rift Spawn
DELETE FROM `creature` WHERE id = @ENTRY;
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
(@ENTRY, 0, 1, 1, 0, 0, -9107.86, 832.569, 105.421, 0.753009, 300, 0, 0, 356, 0, 0, 0, 0, 0),
(@ENTRY, 0, 1, 1, 0, 0, -9096.52, 839.324, 97.629, 4.02503, 300, 0, 0, 356, 0, 0, 0, 0, 0),
(@ENTRY, 0, 1, 1, 0, 0, -9110.89, 828.068, 97.6299, 1.25651, 300, 0, 0, 356, 0, 0, 0, 0, 0);

-- DB/Quest: Fix: Mistcaller Yngvar
-- DB/Quest: Fix: Nebelrufer Yngvar
-- Missing event script for mob spawn.
DELETE FROM `event_scripts` WHERE `id`=21997 AND `command`=10;
INSERT INTO `event_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(21997,2,10,34965,120000,0,10181.96,1183.417,76.12115,5.934119);
-- Disable questitem if the npc is already summoned or the player has the quest completed, but not yet rewarded.
DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceEntry= 66621;
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, comment ) VALUES
(17, 0, 66621, 0, 0, 29, 34965, 40, 0, 1, 0, "Cant use Mistcallers Charm within 40 yards of Yngvar"),
(17, 0, 66621, 0, 0, 28, 14102, 0, 0, 1, 0, "Cant use Mistcallers Charm, if player has quest objective completed, but not yet rewarded.");

-- DB/Quest: Fix: Conversing With the Depths | by Pitcrawler
-- DB/Quest: Fix: Gespräche mit den Tiefen
SET @GUID := 62851;
SET @TRIGGER := 4951;
SET @ELM_BUNNY := 23837;
SET @ELM_BUNNY_LARGE := 24110;
SET @OACHANOA := 26648;
SET @PEARL := 188422;
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI', `ScriptName`='' WHERE `entry`=@PEARL;
UPDATE `creature_template` SET `speed_run`=2.14286, `faction_A`=190, `faction_H`=190, `unit_flags`=33536, `unit_flags2`=2080, `AIName`='SmartAI', `InhabitType`=4 WHERE `entry`=@OACHANOA;
DELETE FROM `creature` WHERE `guid` BETWEEN @GUID+0 AND @GUID+3;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(@GUID+0,@ELM_BUNNY,571,1,1,11686,0,2452.865,1722.222,61.8313,5.654867,300,0,0,42,0,0,0,0,0),
(@GUID+1,@ELM_BUNNY_LARGE,571,1,1,11686,0,2427.382,1680.861,-0.05963766,2.356194,300,0,0,42,0,0,0,0,0),
(@GUID+2,@ELM_BUNNY_LARGE,571,1,1,11686,0,2407.345,1733.472,7.560452,2.443461,300,0,0,42,0,0,0,0,0),
(@GUID+3,@ELM_BUNNY_LARGE,571,1,1,11686,0,2436.226,1710.697,-0.01387666,5.183628,300,0,0,42,0,0,0,0,0);
DELETE FROM `areatrigger_scripts` WHERE `entry`=@TRIGGER;
INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES
(@TRIGGER,'SmartTrigger');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceEntry`=@TRIGGER AND `SourceId`=2;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceEntry`=@PEARL AND `SourceId`=1;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(22,1,@PEARL,1,0,9,0,12032,0,0,0,0,'','SAI only activates if player is on quest Conversing With the Depths'),
(22,1,@TRIGGER,2,0,9,0,12032,0,0,0,0,'','SAI only activates if player is on quest Conversing With the Depths'),
(22,1,@TRIGGER,2,0,1,0,47098,0,0,0,0,'','SAI only activates if player has aura Oacha''noa''s Compulsion');
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-(@GUID+0),-(@GUID+1),-(@GUID+2),-(@GUID+3),@OACHANOA) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@PEARL AND `source_type`=1;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@TRIGGER AND `source_type`=2;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@OACHANOA*100,@OACHANOA*100+1,@PEARL*100) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(-(@GUID+0),0,0,0,38,0,100,0,0,1,0,0,11,38497,0,0,0,0,0,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny - On data 0 1 set - Spellcast Cyclone Water Visual'),
(-(@GUID+0),0,1,0,38,0,100,0,0,2,0,0,28,38497,0,0,0,0,0,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny - On data 0 2 set - Remove aura Cyclone Water Visual'),
(-(@GUID+1),0,0,0,38,0,100,0,0,1,0,0,11,47479,0,0,0,0,0,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny Large - On data 0 1 set - Spellcast Water Spout'),
(-(@GUID+2),0,0,0,38,0,100,0,0,1,0,0,11,45849,0,0,0,0,0,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny Large - On data 0 1 set - Spellcast Camera Shake - Tremor'),
(-(@GUID+3),0,0,0,38,0,100,0,0,1,0,0,11,47479,0,0,0,0,0,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny Large - On data 0 1 set - Spellcast Water Spout'),
(@OACHANOA,0,0,1,11,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Oacha''noa - On Spawn - Set event phase 1'),
(@OACHANOA,0,1,2,61,0,100,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Oacha''noa - On Spawn - Set run'),
(@OACHANOA,0,2,0,61,0,100,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,2367.975,1712.07,43.56623,0, 'Oacha''noa - On Spawn - Move to position'),
(@OACHANOA,0,3,0,34,1,100,0,0,1,0,0,80,@OACHANOA*100,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Oacha''noa - On movement inform (phase 1) - Run script 0'),
(@OACHANOA,0,4,0,52,1,100,0,3,@OACHANOA,0,0,1,4,10100,0,0,0,0,1,0,0,0,0,0,0,0, 'Oacha''noa - On text 3 over (phase 1) - Say line'),
(@OACHANOA,0,5,6,52,1,100,0,4,@OACHANOA,0,0,1,9,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Oacha''noa - On text 4 over (phase 1) - Say line'),
(@OACHANOA,0,6,7,61,0,100,0,0,0,0,0,6,12032,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Oacha''noa - On text 4 over (phase 1) - Fail quest'),
(@OACHANOA,0,7,0,61,0,100,0,0,0,0,0,41,2000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Oacha''noa - On text 4 over (phase 1) - Despawn after 2 seconds'),
(@OACHANOA,0,8,9,38,1,100,0,0,1,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Oacha''noa - On data 0 1 set (phase 1) - Set event phase 0'),
(@OACHANOA,0,9,0,61,0,100,0,0,0,0,0,80,@OACHANOA*100+1,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Oacha''noa - On data 0 1 set (phase 1) - Run script 1'),
(@TRIGGER,2,0,0,46,0,100,0,0,0,0,0,45,0,1,0,0,0,0,14,21195,@PEARL,0,0,0,0,0, 'On trigger - Set data 0 1 Pearl of the Depths'),
(@PEARL,1,0,0,70,0,100,0,2,0,0,0,80,@PEARL*100,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Pearl of the Depths - On state changed - Run script'),
(@PEARL,1,1,0,38,0,100,0,0,1,0,0,45,0,1,0,0,0,0,19,@OACHANOA,100,0,0,0,0,0, 'Pearl of the Depths - On data 0 1 set - Set data 0 1 Oacha''noa'),
(@OACHANOA*100,9,0,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Oacha''noa script 0 - Turn to'),
(@OACHANOA*100,9,1,0,0,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,@GUID+1,@ELM_BUNNY_LARGE,0,0,0,0,0, 'Oacha''noa script 0 - Set data 0 1 ELM General Purpose Bunny Large'),
(@OACHANOA*100,9,2,0,0,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,@GUID+2,@ELM_BUNNY_LARGE,0,0,0,0,0, 'Oacha''noa script 0 - Set data 0 1 ELM General Purpose Bunny Large'),
(@OACHANOA*100,9,3,0,0,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,@GUID+3,@ELM_BUNNY_LARGE,0,0,0,0,0, 'Oacha''noa script 0 - Set data 0 1 ELM General Purpose Bunny Large'),
(@OACHANOA*100,9,4,0,0,0,100,0,1200,1200,0,0,1,0,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Oacha''noa script 0 - Say line'),
(@OACHANOA*100,9,5,0,0,0,100,0,8500,8500,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Oacha''noa script 0 - Say line'),
(@OACHANOA*100,9,6,0,0,0,100,0,9700,9700,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Oacha''noa script 0 - Say line'),
(@OACHANOA*100,9,7,0,0,0,100,0,0,0,0,0,11,47098,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Oacha''noa script 0 - Spellcast Oacha''noa''s Compulsion'),
(@OACHANOA*100,9,8,0,0,0,100,0,10900,10900,0,0,1,3,10000,0,0,0,0,1,0,0,0,0,0,0,0, 'Oacha''noa script 0 - Say line'),
(@OACHANOA*100+1,9,0,0,0,0,100,0,0,0,0,0,15,12032,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Oacha''noa script 1 - Complete quest'),
(@OACHANOA*100+1,9,1,0,0,0,100,0,0,0,0,0,1,5,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Oacha''noa script 1 - Say line'),
(@OACHANOA*100+1,9,2,0,0,0,100,0,10600,10600,0,0,1,6,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Oacha''noa script 1 - Say line'),
(@OACHANOA*100+1,9,3,0,0,0,100,0,10800,10800,0,0,1,7,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Oacha''noa script 1 - Say line'),
(@OACHANOA*100+1,9,4,0,0,0,100,0,10700,10700,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,3.281219, 'Oacha''noa script 1 - Turn to'),
(@OACHANOA*100+1,9,5,0,0,0,100,0,200,200,0,0,1,8,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Oacha''noa script 1 - Say line'),
(@OACHANOA*100+1,9,6,0,0,0,100,0,1000,1000,0,0,5,374,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Oacha''noa script 1 - Play emote'),
(@OACHANOA*100+1,9,7,0,0,0,100,0,0,0,0,0,4,11561,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Oacha''noa script 1 - Play sound'),
(@OACHANOA*100+1,9,8,0,0,0,100,0,2300,2300,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Oacha''noa script 1 - Despawn'),
(@PEARL*100,9,0,0,0,0,100,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Pearl of the Depths script - Store targetlist'),
(@PEARL*100,9,1,0,0,0,100,0,0,0,0,0,99,0,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Pearl of the Depths script - Set state'),
(@PEARL*100,9,2,0,0,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,@GUID+0,@ELM_BUNNY,0,0,0,0,0, 'Pearl of the Depths script - Set data 0 1 ELM General Purpose Bunny'),
(@PEARL*100,9,3,0,0,0,100,0,20000,20000,0,0,45,0,2,0,0,0,0,10,@GUID+0,@ELM_BUNNY,0,0,0,0,0, 'Pearl of the Depths script - Set data 0 2 ELM General Purpose Bunny'),
(@PEARL*100,9,4,0,0,0,100,0,0,0,0,0,12,@OACHANOA,8,0,0,0,0,8,0,0,0,2367.975,1712.07,0.232847,0, 'Pearl of the Depths script - Summon Oacha''noa'),
(@PEARL*100,9,5,0,0,0,100,0,1000,1000,0,0,100,1,0,0,0,0,0,19,@OACHANOA,100,0,0,0,0,0, 'Pearl of the Depths script - Send targetlist'),
(@PEARL*100,9,6,0,0,0,100,0,74000,74000,0,0,99,3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Pearl of the Depths script - Set state');
DELETE FROM `creature_text` WHERE `entry`=@OACHANOA;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@OACHANOA,0,0,'Little $N, why do you call me forth? Are you working with the trolls of this land? Have you come to kill me and take my power as your own?',14,0,100,33,0,11557,'Oacha''noa'),
(@OACHANOA,1,0,'I sense uncertainty in you, and I do not trust it whether you are with them, or not. If you wish my augury for the Kalu''ak, you will have to prove yourself first.',14,0,100,33,0,11557,'Oacha''noa'),
(@OACHANOA,2,0,'I will lay a mild compulsion upon you. Jump into the depths before me so that you put yourself into my element and thereby display your submission.',14,0,100,33,0,11557,'Oacha''noa'),
(@OACHANOA,3,0,'Though you are compelled, the choice, and the last step before you leap, are yours. You have twenty more seconds to decide.',14,0,100,33,0,11557,'Oacha''noa'),
(@OACHANOA,4,0,'I''m rather curious as to what will happen, should you ignore this and NOT jump into the water.',14,0,100,33,0,11557,'Oacha''noa'),
(@OACHANOA,5,0,'Well done, $N. Your display of respect is duly noted. Now, I have information for you that you must convey to the Kalu''ak.',14,0,100,33,0,11557,'Oacha''noa'),
(@OACHANOA,6,0,'Simply put, you must tell the tuskarr that they cannot run. If they do so, their spirits will be destroyed by the evil rising within Northrend.',15,0,100,0,0,0,'Oacha''noa'),
(@OACHANOA,7,0,'Tell the mystic that his people are to stand and fight alongside the Horde and Alliance against the forces of Malygos and the Lich King.',15,0,100,0,0,0,'Oacha''noa'),
(@OACHANOA,8,0,'Now swim back with the knowledge I have granted you. Do what you can for them, $r.',15,0,100,0,0,0,'Oacha''noa'),
(@OACHANOA,9,0,'Very well, $N, you have failed to act. The prophecy is not yours to learn. Do not call upon me again until you have found your backbone.',14,0,100,33,0,11557,'Oacha''noa');

-- DB/Quest: Fix: The Focus on the Beach, Atop the Woodlands, The End of the Line | by Pitcrawler
-- DB/Quest: Fix: Der Fokus am Strand, Über den Waldländern, Endstation
DELETE FROM `creature` WHERE `guid` IN (116020,116021,116022,116023,116024,116025,116026,116029,116030,116031,116032,116033,116035,116037,116038,116039,116040,116042,116043,116044,116045,116046,116047,116049,116050,116051,116053,116054,116055,116056,116057,116058,116059,116060,116061,116065);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (47374,47469,47634,50546,50547,50548);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry` IN (47374,47469,47634);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorType`,`ScriptName`,`Comment`) VALUES
(13,1,47374,0,31,0,3,23837,0,0,'','Spell Ley Line Focus Control Ring targets ELM General Purpose Bunny'),
(13,1,47469,0,31,0,3,23837,0,0,'','Spell Ley Line Focus Control Amulet targets ELM General Purpose Bunny'),
(13,1,47634,0,31,0,3,23837,0,0,'','Spell Ley Line Focus Control Talisman targets ELM General Purpose Bunny'),
(13,1,50546,0,31,0,3,23837,0,0,'','Spell The Focus on the Beach: Ley Line Focus Control Ring Effect targets ELM General Purpose Bunny'),
(13,1,50547,0,31,0,3,23837,0,0,'','Spell Atop the Woodlands: Ley Line Focus Control Amulet Effect targets ELM General Purpose Bunny'),
(13,1,50548,0,31,0,3,23837,0,0,'','Spell The End of the Line: Ley Line Focus Control Talisman Effect targets ELM General Purpose Bunny'),
(17,0,47374,0,29,0,23837,7,0,97,'','Spell Ley Line Focus Control Ring can be casted only within 7y from ELM General Purpose Bunny'),
(17,0,47469,0,29,0,23837,7,0,97,'','Spell Ley Line Focus Control Amulet can be casted only within 7y from ELM General Purpose Bunny'),
(17,0,47634,0,29,0,23837,7,0,97,'','Spell Ley Line Focus Control Talisman can be casted only within 7y from ELM General Purpose Bunny');
DELETE FROM `creature_text` WHERE `entry` IN (26762,26815);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(26762,0,0,'Keep them away from the focus!',12,0,100,0,0,0,'Captain Emmy Malin'),
(26815,0,0,'Ya shouldn''a taken the boat north, mon!',12,0,100,0,0,0,'Lieutenant Ta''zinni');
DELETE FROM `spell_scripts` WHERE `id` IN (47393,47615,47638);
INSERT INTO `spell_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(47393,0,14,47391,0,0,0,0,0,0),
(47615,0,14,47473,0,0,0,0,0,0),
(47638,0,14,47636,0,0,0,0,0,0);
DELETE FROM `areatrigger_scripts` WHERE `entry`=4956;
INSERT INTO `areatrigger_scripts` (`entry`,`ScriptName`) VALUES
(4956,'SmartTrigger');
UPDATE `creature_template` SET `npcflag`=2 WHERE `entry`=26873;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (26762,26815);
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (26762,26815);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-98534,-98535,-98537,-98564,-98599,-98617,-115920,-115921,-115922,-115923,-115924,-115925,-115926,-115927,-115945,-115946,-115947,-115948,-115958,-115959,-115973,-115974,-115975,-115976,24021,26762,26815) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=4956 AND `source_type`=2;
DELETE FROM `smart_scripts` WHERE `entryorguid` BETWEEN 24021*100+0 AND 24021*100+16 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(-98534,0,0,0,8,0,100,0,47469,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0, 'ELM General Purpose Bunny - On spellhit Ley Line Focus Control Amulet - Store targetlist'),
(-98534,0,1,0,8,0,100,0,50547,0,0,0,11,47472,0,0,0,0,0,12,1,0,0,0,0,0,0, 'ELM General Purpose Bunny - On spellhit Atop the Woodlands: Ley Line Focus Control Amulet Effect - Spellcast Atop the Woodlands: Ley Line Focus Bunny Beam'),
(-98535,0,0,0,8,0,100,0,47469,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0, 'ELM General Purpose Bunny - On spellhit Ley Line Focus Control Amulet - Store targetlist'),
(-98535,0,1,0,8,0,100,0,50547,0,0,0,11,47472,0,0,0,0,0,12,1,0,0,0,0,0,0, 'ELM General Purpose Bunny - On spellhit Atop the Woodlands: Ley Line Focus Control Amulet Effect - Spellcast Atop the Woodlands: Ley Line Focus Bunny Beam'),
(-98537,0,0,0,8,0,100,0,47374,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0, 'ELM General Purpose Bunny - On spellhit Ley Line Focus Control Ring - Store targetlist'),
(-98537,0,1,0,8,0,100,0,50546,0,0,0,11,47390,0,0,0,0,0,12,1,0,0,0,0,0,0, 'ELM General Purpose Bunny - On spellhit The Focus on the Beach: Ley Line Focus Control Ring Effect - Spellcast The Focus on the Beach: Ley Line Focus Bunny Beam'),
(-98564,0,0,0,8,0,100,0,47634,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0, 'ELM General Purpose Bunny - On spellhit Ley Line Focus Control Talisman - Store targetlist'),
(-98564,0,1,0,8,0,100,0,50548,0,0,0,11,47635,0,0,0,0,0,12,1,0,0,0,0,0,0, 'ELM General Purpose Bunny - On spellhit The End of the Line: Ley Line Focus Control Talisman Effect - Spellcast The End of the Line: Ley Line Focus Bunny Beam'),
(-98599,0,0,0,8,0,100,0,47374,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0, 'ELM General Purpose Bunny - On spellhit Ley Line Focus Control Ring - Store targetlist'),
(-98599,0,1,0,8,0,100,0,50546,0,0,0,11,47390,0,0,0,0,0,12,1,0,0,0,0,0,0, 'ELM General Purpose Bunny - On spellhit The Focus on the Beach: Ley Line Focus Control Ring Effect - Spellcast The Focus on the Beach: Ley Line Focus Bunny Beam'),
(-98617,0,0,0,8,0,100,0,47634,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0, 'ELM General Purpose Bunny - On spellhit Ley Line Focus Control Talisman - Store targetlist'),
(-98617,0,1,0,8,0,100,0,50548,0,0,0,11,47635,0,0,0,0,0,12,1,0,0,0,0,0,0, 'ELM General Purpose Bunny - On spellhit The End of the Line: Ley Line Focus Control Talisman Effect - Spellcast The End of the Line: Ley Line Focus Bunny Beam'),
(-115924,0,0,0,1,0,100,0,0,1000,24000,25000,87,24021*100+1,24021*100+2,24021*100+3,24021*100+4,24021*100+5,24021*100+6,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny Large - On update OOC - Run random script'),
(-115925,0,0,0,1,0,100,0,0,1000,24000,25000,87,24021*100+1,24021*100+2,24021*100+3,24021*100+4,24021*100+5,24021*100+6,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny Large - On update OOC - Run random script'),
(-115926,0,0,0,1,0,100,0,0,1000,24000,25000,87,24021*100+1,24021*100+2,24021*100+3,24021*100+4,24021*100+5,24021*100+6,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny Large - On update OOC - Run random script'),
(-115927,0,0,0,1,0,100,0,0,1000,24000,25000,87,24021*100+1,24021*100+2,24021*100+3,24021*100+4,24021*100+5,24021*100+6,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny Large - On update OOC - Run random script'),
(-115947,0,0,0,1,0,100,0,0,1000,24000,25000,87,24021*100+1,24021*100+2,24021*100+3,24021*100+4,24021*100+5,24021*100+6,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny Large - On update OOC - Run random script'),
(-115948,0,0,0,1,0,100,0,0,1000,24000,25000,87,24021*100+1,24021*100+2,24021*100+3,24021*100+4,24021*100+5,24021*100+6,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny Large - On update OOC - Run random script'),
(-115920,0,0,0,1,0,100,0,0,1000,20000,21000,87,24021*100+7,24021*100+8,24021*100+9,24021*100+10,24021*100+11,0,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny Large - On update OOC - Run random script'),
(-115921,0,0,0,1,0,100,0,0,1000,20000,21000,87,24021*100+7,24021*100+8,24021*100+9,24021*100+10,24021*100+11,0,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny Large - On update OOC - Run random script'),
(-115922,0,0,0,1,0,100,0,0,1000,20000,21000,87,24021*100+7,24021*100+8,24021*100+9,24021*100+10,24021*100+11,0,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny Large - On update OOC - Run random script'),
(-115923,0,0,0,1,0,100,0,0,1000,20000,21000,87,24021*100+7,24021*100+8,24021*100+9,24021*100+10,24021*100+11,0,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny Large - On update OOC - Run random script'),
(-115945,0,0,0,1,0,100,0,0,1000,20000,21000,87,24021*100+7,24021*100+8,24021*100+9,24021*100+10,24021*100+11,0,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny Large - On update OOC - Run random script'),
(-115946,0,0,0,1,0,100,0,0,1000,20000,21000,87,24021*100+7,24021*100+8,24021*100+9,24021*100+10,24021*100+11,0,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny Large - On update OOC - Run random script'),
(-115958,0,0,0,1,0,100,0,0,1000,24000,25000,87,24021*100+12,24021*100+13,24021*100+14,24021*100+15,24021*100+16,0,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny Large - On update OOC - Run random script'),
(-115959,0,0,0,1,0,100,0,0,1000,24000,25000,87,24021*100+12,24021*100+13,24021*100+14,24021*100+15,24021*100+16,0,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny Large - On update OOC - Run random script'),
(-115973,0,0,0,1,0,100,0,0,1000,24000,25000,87,24021*100+12,24021*100+13,24021*100+14,24021*100+15,24021*100+16,0,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny Large - On update OOC - Run random script'),
(-115974,0,0,0,1,0,100,0,0,1000,24000,25000,87,24021*100+12,24021*100+13,24021*100+14,24021*100+15,24021*100+16,0,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny Large - On update OOC - Run random script'),
(-115975,0,0,0,1,0,100,0,0,1000,24000,25000,87,24021*100+12,24021*100+13,24021*100+14,24021*100+15,24021*100+16,0,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny Large - On update OOC - Run random script'),
(-115976,0,0,0,1,0,100,0,0,1000,24000,25000,87,24021*100+12,24021*100+13,24021*100+14,24021*100+15,24021*100+16,0,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny Large - On update OOC - Run random script'),
(24021,0,0,0,54,0,100,0,0,0,0,0,80,24021*100+0,2,0,0,0,0,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny Large - Just summoned - Run script'),
(26762,0,0,0,11,0,100,0,0,0,0,0,11,46906,0,0,0,0,0,10,115948,24021,0,0,0,0,0, 'Captain Emmy Malin - On spawn - Spellcast Surge Needle Beam'),
(26762,0,1,0,21,0,100,0,0,0,0,0,11,46906,0,0,0,0,0,10,115948,24021,0,0,0,0,0, 'Captain Emmy Malin - On homeposition reached - Spellcast Surge Needle Beam'),
(26762,0,2,0,9,0,100,0,0,40,3000,4000,11,20792,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Captain Emmy Malin - On target within 40y - Spellcast Frostbolt'),
(26762,0,3,0,0,0,100,0,7000,10000,9000,12000,11,49906,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Captain Emmy Malin - On update IC - Spellcast Ice Lance'),
(26762,0,4,0,9,0,100,0,0,5,9000,12000,11,11831,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Captain Emmy Malin - On target within 5y - Spellcast Frost Nova'),
(26762,0,5,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Captain Emmy Malin - On aggro - Say line'),
(26815,0,0,0,9,0,100,0,0,40,3000,4000,11,51779,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Lieutenant Ta''zinni - On target within 40y - Spellcast Frostfirebolt'),
(26815,0,1,0,9,0,100,0,0,10,12000,18000,11,35250,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Lieutenant Ta''zinni - On target within 10y - Spellcast Dragon''s Breath'),
(26815,0,2,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Lieutenant Ta''zinni - On aggro - Say line'),
(4956,2,0,0,46,0,100,0,4956,0,0,0,33,26889,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Areatrigger Azure Dragonshire - On trigger - Quest credit'),
(24021*100+0,9,0,0,0,0,100,0,0,0,0,0,11,47334,0,0,0,0,0,7,0,0,0,0,0,0,0, 'ELM General Purpose Bunny Large script 0 - Spellcast Ley Line Beam (no cast kit)'),
(24021*100+0,9,1,0,0,0,100,0,3000,4000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny Large  script 0 - Despawn'),
(24021*100+1,9,0,0,0,0,100,0,0,0,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3126.05,2140.401,17.8579,5.585053, 'ELM General Purpose Bunny Large script 1 - Summon ELM General Purpose Bunny Large'),
(24021*100+1,9,1,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3125.524,2146.786,15.84835,2.129302, 'ELM General Purpose Bunny Large script 1 - Summon ELM General Purpose Bunny Large'),
(24021*100+1,9,2,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3121.857,2144.208,19.87348,0.3141593, 'ELM General Purpose Bunny Large script 1 - Summon ELM General Purpose Bunny Large'),
(24021*100+1,9,3,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3131.571,2143.177,19.43405,0.4014257, 'ELM General Purpose Bunny Large script 1 - Summon ELM General Purpose Bunny Large'),
(24021*100+1,9,4,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3128.101,2141.035,17.94403,1.902409, 'ELM General Purpose Bunny Large script 1 - Summon ELM General Purpose Bunny Large'),
(24021*100+1,9,5,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3123.163,2141.134,16.98522,3.316126, 'ELM General Purpose Bunny Large script 1 - Summon ELM General Purpose Bunny Large'),
(24021*100+2,9,0,0,0,0,100,0,0,0,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3125.091,2140.601,17.71151,2.443461, 'ELM General Purpose Bunny Large script 2 - Summon ELM General Purpose Bunny Large'),
(24021*100+2,9,1,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3132.777,2149.866,15.00388,5.986479, 'ELM General Purpose Bunny Large script 2 - Summon ELM General Purpose Bunny Large'),
(24021*100+2,9,2,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3127.046,2144.976,16.4135,5.183628, 'ELM General Purpose Bunny Large script 2 - Summon ELM General Purpose Bunny Large'),
(24021*100+2,9,3,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3122.372,2139.047,17.24562,5.009095, 'ELM General Purpose Bunny Large script 2 - Summon ELM General Purpose Bunny Large'),
(24021*100+2,9,4,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3126.123,2142.99,17.00723,2.792527, 'ELM General Purpose Bunny Large script 2 - Summon ELM General Purpose Bunny Large'),
(24021*100+2,9,5,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3128.526,2145.889,15.85672,0.2443461, 'ELM General Purpose Bunny Large script 2 - Summon ELM General Purpose Bunny Large'),
(24021*100+3,9,0,0,0,0,100,0,0,0,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3126.866,2149.983,13.7796,1.832596, 'ELM General Purpose Bunny Large script 3 - Summon ELM General Purpose Bunny Large'),
(24021*100+3,9,1,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3131.825,2144.75,17.25836,1.570796, 'ELM General Purpose Bunny Large script 3 - Summon ELM General Purpose Bunny Large'),
(24021*100+3,9,2,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3121.043,2140.726,16.30317,4.24115, 'ELM General Purpose Bunny Large script 3 - Summon ELM General Purpose Bunny Large'),
(24021*100+3,9,3,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3129.281,2141.083,18.61101,3.124139, 'ELM General Purpose Bunny Large script 3 - Summon ELM General Purpose Bunny Large'),
(24021*100+3,9,4,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3125.717,2146.401,16.13597,5.72468, 'ELM General Purpose Bunny Large script 3 - Summon ELM General Purpose Bunny Large'),
(24021*100+3,9,5,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3123.911,2142.552,17.50746,4.380776, 'ELM General Purpose Bunny Large script 3 - Summon ELM General Purpose Bunny Large'),
(24021*100+4,9,0,0,0,0,100,0,0,0,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3130.754,2151.47,14.37193,5.183628, 'ELM General Purpose Bunny Large script 4 - Summon ELM General Purpose Bunny Large'),
(24021*100+4,9,1,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3124.838,2143.604,17.12428,0.4014257, 'ELM General Purpose Bunny Large script 4 - Summon ELM General Purpose Bunny Large'),
(24021*100+4,9,2,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3127.993,2143.675,16.80205,5.148721, 'ELM General Purpose Bunny Large script 4 - Summon ELM General Purpose Bunny Large'),
(24021*100+4,9,3,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3121.175,2142.392,17.06362,0.9075712, 'ELM General Purpose Bunny Large script 4 - Summon ELM General Purpose Bunny Large'),
(24021*100+4,9,4,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3128.526,2145.889,15.85672,0.2443461, 'ELM General Purpose Bunny Large script 4 - Summon ELM General Purpose Bunny Large'),
(24021*100+4,9,5,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3134.843,2147.028,18.17949,5.864306, 'ELM General Purpose Bunny Large script 4 - Summon ELM General Purpose Bunny Large'),
(24021*100+5,9,0,0,0,0,100,0,0,0,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3122.565,2142.866,17.20188,3.647738, 'ELM General Purpose Bunny Large script 5 - Summon ELM General Purpose Bunny Large'),
(24021*100+5,9,1,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3126.29,2142.063,17.4064,5.72468, 'ELM General Purpose Bunny Large script 5 - Summon ELM General Purpose Bunny Large'),
(24021*100+5,9,2,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3129.656,2149.474,14.7912,5.550147, 'ELM General Purpose Bunny Large script 5 - Summon ELM General Purpose Bunny Large'),
(24021*100+5,9,3,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3124.519,2149.514,14.5581,4.29351, 'ELM General Purpose Bunny Large script 5 - Summon ELM General Purpose Bunny Large'),
(24021*100+5,9,4,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3127.796,2138.372,19.97332,0.01745329, 'ELM General Purpose Bunny Large script 5 - Summon ELM General Purpose Bunny Large'),
(24021*100+5,9,5,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3132.397,2147.686,15.91525,0.9599311, 'ELM General Purpose Bunny Large script 5 - Summon ELM General Purpose Bunny Large'),
(24021*100+6,9,0,0,0,0,100,0,0,0,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3131.072,2147.995,15.61533,1.466077, 'ELM General Purpose Bunny Large script 6 - Summon ELM General Purpose Bunny Large'),
(24021*100+6,9,1,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3128.782,2144.123,16.61955,5.742133, 'ELM General Purpose Bunny Large script 6 - Summon ELM General Purpose Bunny Large'),
(24021*100+6,9,2,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3123.601,2139.016,17.71019,0.4537856, 'ELM General Purpose Bunny Large script 6 - Summon ELM General Purpose Bunny Large'),
(24021*100+6,9,3,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3133.935,2143.841,21.74682,6.178465, 'ELM General Purpose Bunny Large script 6 - Summon ELM General Purpose Bunny Large'),
(24021*100+6,9,4,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3126.675,2146.103,16.11657,1.43117, 'ELM General Purpose Bunny Large script 6 - Summon ELM General Purpose Bunny Large'),
(24021*100+6,9,5,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3130.211,2145.085,16.58946,2.827433, 'ELM General Purpose Bunny Large script 6 - Summon ELM General Purpose Bunny Large'),
(24021*100+7,9,0,0,0,0,100,0,0,0,0,0,12,24021,8,4000,0,0,0,8,0,0,0,2894.85,1820.674,131.0997,1.012291, 'ELM General Purpose Bunny Large script 7 - Summon ELM General Purpose Bunny Large'),
(24021*100+7,9,1,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,2891.408,1818.045,128.5932,0.541052, 'ELM General Purpose Bunny Large script 7 - Summon ELM General Purpose Bunny Large'),
(24021*100+7,9,2,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,2888.546,1816.658,131.655,2.024582, 'ELM General Purpose Bunny Large script 7 - Summon ELM General Purpose Bunny Large'),
(24021*100+7,9,3,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,2890.363,1810.202,129.936,0.7679449, 'ELM General Purpose Bunny Large script 7 - Summon ELM General Purpose Bunny Large'),
(24021*100+7,9,4,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,2889.329,1822.168,130.1942,2.600541, 'ELM General Purpose Bunny Large script 7 - Summon ELM General Purpose Bunny Large'),
(24021*100+7,9,5,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,2892.142,1809.754,129.4616,5.689773, 'ELM General Purpose Bunny Large script 7 - Summon ELM General Purpose Bunny Large'),
(24021*100+8,9,0,0,0,0,100,0,0,0,0,0,12,24021,8,4000,0,0,0,8,0,0,0,2894.762,1813.133,132.1913,1.256637, 'ELM General Purpose Bunny Large script 8 - Summon ELM General Purpose Bunny Large'),
(24021*100+8,9,1,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,2888.24,1811.167,131.9773,3.473205, 'ELM General Purpose Bunny Large script 8 - Summon ELM General Purpose Bunny Large'),
(24021*100+8,9,2,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,2891.765,1820.341,128.2378,2.443461, 'ELM General Purpose Bunny Large script 8 - Summon ELM General Purpose Bunny Large'),
(24021*100+8,9,3,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,2889.968,1816.515,130.1833,3.577925, 'ELM General Purpose Bunny Large script 8 - Summon ELM General Purpose Bunny Large'),
(24021*100+8,9,4,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,2895.262,1817.665,131.9376,4.415683, 'ELM General Purpose Bunny Large script 8 - Summon ELM General Purpose Bunny Large'),
(24021*100+8,9,5,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,2892.956,1819.63,129.6165,3.106686, 'ELM General Purpose Bunny Large script 8 - Summon ELM General Purpose Bunny Large'),
(24021*100+9,9,0,0,0,0,100,0,0,0,0,0,12,24021,8,4000,0,0,0,8,0,0,0,2890.813,1812.197,129.4449,4.24115, 'ELM General Purpose Bunny Large script 9 - Summon ELM General Purpose Bunny Large'),
(24021*100+9,9,1,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,2894.83,1810.606,132.5347,1.37881, 'ELM General Purpose Bunny Large script 9 - Summon ELM General Purpose Bunny Large'),
(24021*100+9,9,2,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,2891.949,1816.533,128.7643,4.502949, 'ELM General Purpose Bunny Large script 9 - Summon ELM General Purpose Bunny Large'),
(24021*100+9,9,3,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,2888.356,1820.349,131.507,3.839724, 'ELM General Purpose Bunny Large script 9 - Summon ELM General Purpose Bunny Large'),
(24021*100+9,9,4,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,2893.333,1820.718,129.6705,1.48353, 'ELM General Purpose Bunny Large script 9 - Summon ELM General Purpose Bunny Large'),
(24021*100+10,9,0,0,0,0,100,0,0,0,0,0,12,24021,8,4000,0,0,0,8,0,0,0,2889.118,1823.984,130.3343,3.455752, 'ELM General Purpose Bunny Large script 10 - Summon ELM General Purpose Bunny Large'),
(24021*100+10,9,1,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,2896.332,1820.913,131.8123,5.689773, 'ELM General Purpose Bunny Large script 10 - Summon ELM General Purpose Bunny Large'),
(24021*100+10,9,2,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,2894.166,1819.122,130.8789,3.211406, 'ELM General Purpose Bunny Large script 10 - Summon ELM General Purpose Bunny Large'),
(24021*100+10,9,3,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,2890.605,1822.912,128.89,1.762783, 'ELM General Purpose Bunny Large script 10 - Summon ELM General Purpose Bunny Large'),
(24021*100+10,9,4,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,2888.642,1809.098,131.9985,3.385939, 'ELM General Purpose Bunny Large script 10 - Summon ELM General Purpose Bunny Large'),
(24021*100+10,9,5,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,2892.705,1812.745,129.8363,1.308997, 'ELM General Purpose Bunny Large script 10 - Summon ELM General Purpose Bunny Large'),
(24021*100+11,9,0,0,0,0,100,0,0,0,0,0,12,24021,8,4000,0,0,0,8,0,0,0,2895.333,1822.925,131.1403,2.879793, 'ELM General Purpose Bunny Large script 11 - Summon ELM General Purpose Bunny Large'),
(24021*100+11,9,1,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,2891.805,1822.136,128.129,6.161012, 'ELM General Purpose Bunny Large script 11 - Summon ELM General Purpose Bunny Large'),
(24021*100+11,9,2,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,2894.475,1823.367,130.2928,1.937315, 'ELM General Purpose Bunny Large script 11 - Summon ELM General Purpose Bunny Large'),
(24021*100+11,9,3,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,2889.26,1810.871,130.8892,0.8726646, 'ELM General Purpose Bunny Large script 11 - Summon ELM General Purpose Bunny Large'),
(24021*100+11,9,4,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,2893.049,1810.656,130.546,1.396263, 'ELM General Purpose Bunny Large script 11 - Summon ELM General Purpose Bunny Large'),
(24021*100+12,9,0,0,0,0,100,0,0,0,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3057.062,1394.183,113.0584,5.8294, 'ELM General Purpose Bunny Large script 12 - Summon ELM General Purpose Bunny Large'),
(24021*100+12,9,1,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3054.48,1394.618,112.7426,1.762783, 'ELM General Purpose Bunny Large script 12 - Summon ELM General Purpose Bunny Large'),
(24021*100+12,9,2,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3060.249,1394.656,113.9411,0.3141593, 'ELM General Purpose Bunny Large script 12 - Summon ELM General Purpose Bunny Large'),
(24021*100+12,9,3,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3055.488,1393.478,112.698,3.141593, 'ELM General Purpose Bunny Large script 12 - Summon ELM General Purpose Bunny Large'),
(24021*100+12,9,4,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3061.458,1396.66,115.1446,0.1570796, 'ELM General Purpose Bunny Large script 12 - Summon ELM General Purpose Bunny Large'),
(24021*100+12,9,5,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3051.968,1401.044,116.3351,0.9424778, 'ELM General Purpose Bunny Large script 12 - Summon ELM General Purpose Bunny Large'),
(24021*100+13,9,0,0,0,0,100,0,0,0,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3054.074,1397.247,113.4051,0.4712389, 'ELM General Purpose Bunny Large script 13 - Summon ELM General Purpose Bunny Large'),
(24021*100+13,9,1,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3057.188,1403.892,115.3656,4.380776, 'ELM General Purpose Bunny Large script 13 - Summon ELM General Purpose Bunny Large'),
(24021*100+13,9,2,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3052.451,1405.315,117.081,0.8552113, 'ELM General Purpose Bunny Large script 13 - Summon ELM General Purpose Bunny Large'),
(24021*100+13,9,3,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3059.104,1401.156,116.369,5.096361, 'ELM General Purpose Bunny Large script 13 - Summon ELM General Purpose Bunny Large'),
(24021*100+13,9,4,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3049.546,1404.567,114.6574,4.24115, 'ELM General Purpose Bunny Large script 13 - Summon ELM General Purpose Bunny Large'),
(24021*100+13,9,5,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3060.958,1399.016,117.6381,0.3665192, 'ELM General Purpose Bunny Large script 13 - Summon ELM General Purpose Bunny Large'),
(24021*100+14,9,0,0,0,0,100,0,0,0,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3056.078,1396.021,113.2624,1.919862, 'ELM General Purpose Bunny Large script 14 - Summon ELM General Purpose Bunny Large'),
(24021*100+14,9,1,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3051.097,1400.683,119.1771,3.124139, 'ELM General Purpose Bunny Large script 14 - Summon ELM General Purpose Bunny Large'),
(24021*100+14,9,2,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3061.056,1398.113,116.3519,2.303835, 'ELM General Purpose Bunny Large script 14 - Summon ELM General Purpose Bunny Large'),
(24021*100+14,9,3,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3057.511,1398.638,114.0719,0.4886922, 'ELM General Purpose Bunny Large script 14 - Summon ELM General Purpose Bunny Large'),
(24021*100+14,9,4,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3055.962,1397.876,113.629,4.171337, 'ELM General Purpose Bunny Large script 14 - Summon ELM General Purpose Bunny Large'),
(24021*100+14,9,5,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3053.035,1396.689,115.7215,3.054326, 'ELM General Purpose Bunny Large script 14 - Summon ELM General Purpose Bunny Large'),
(24021*100+15,9,0,0,0,0,100,0,0,0,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3054.111,1406.132,118.344,5.183628, 'ELM General Purpose Bunny Large script 15 - Summon ELM General Purpose Bunny Large'),
(24021*100+15,9,1,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3058.348,1399.74,114.4599,1.117011, 'ELM General Purpose Bunny Large script 15 - Summon ELM General Purpose Bunny Large'),
(24021*100+15,9,2,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3060.409,1401.954,119.1423,4.433136, 'ELM General Purpose Bunny Large script 15 - Summon ELM General Purpose Bunny Large'),
(24021*100+15,9,3,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3055.117,1405.109,116.396,1.867502, 'ELM General Purpose Bunny Large script 15 - Summon ELM General Purpose Bunny Large'),
(24021*100+15,9,4,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3051.709,1402.488,113.6939,5.009095, 'ELM General Purpose Bunny Large script 15 - Summon ELM General Purpose Bunny Large'),
(24021*100+15,9,5,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3059.448,1404.954,119.1292,4.712389, 'ELM General Purpose Bunny Large script 15 - Summon ELM General Purpose Bunny Large'),
(24021*100+16,9,0,0,0,0,100,0,0,0,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3056.558,1406.72,119.7402,3.124139, 'ELM General Purpose Bunny Large script 16 - Summon ELM General Purpose Bunny Large'),
(24021*100+16,9,1,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3052.471,1393.973,116.9445,5.637414, 'ELM General Purpose Bunny Large script 16 - Summon ELM General Purpose Bunny Large'),
(24021*100+16,9,2,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3061.914,1394.956,114.8677,0.7853982, 'ELM General Purpose Bunny Large script 16 - Summon ELM General Purpose Bunny Large'),
(24021*100+16,9,3,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3054.167,1403.503,114.3343,1.256637, 'ELM General Purpose Bunny Large script 16 - Summon ELM General Purpose Bunny Large'),
(24021*100+16,9,4,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3049.392,1406.412,118.5037,2.80998, 'ELM General Purpose Bunny Large script 16 - Summon ELM General Purpose Bunny Large'),
(24021*100+16,9,5,0,0,0,100,0,4000,4000,0,0,12,24021,8,4000,0,0,0,8,0,0,0,3057.68,1392.579,112.8306,2.792527, 'ELM General Purpose Bunny Large script 16 - Summon ELM General Purpose Bunny Large');

-- DB/Quest: Hack: The Frost Wyrm and its Master
-- DB/Quest: Hack: Der Frostwyrm und sein Meister
SET @WyrmcallerVile := 24029;
SET @Glacion := 24019;
SET @GOPlatform := 300161; -- TEMP The Wyrmlord's Platform
SET @SummonSpell := 42817;
SET @QuestA := 11238;
SET @QuestH := 11267;
DELETE FROM `creature` WHERE id IN (@WyrmcallerVile, @Glacion);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@WyrmcallerVile, 571, 1, 1, 0, 127, 2816.98, -3607.67, 246.053, 3.77733, 300, 0, 0, 9291, 3231, 0, 0, 0, 0);
DELETE FROM `gameobject` WHERE id = @GOPlatform;
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@GOPlatform, 571, 1, 1, 2818.71, -3619.43, 247.504, 1.72037, 0, 0, 0.757965, 0.652295, 300, 0, 1),
(@GOPlatform, 571, 1, 1, 2804.32, -3601.11, 247.686, 0.68679, 0, 0, 0.336686, 0.941617, 300, 0, 1),
(@GOPlatform, 571, 1, 1, 2805.15, -3613.83, 247.795, 3.90142, 0, 0, 0.928696, -0.370841, 300, 0, 1),
(@GOPlatform, 571, 1, 1, 2816.61, -3607.82, 246.088, 0.583118, 0, 0, 0.287446, 0.957797, 300, 0, 1);
DELETE FROM `conditions` WHERE SourceEntry = @SummonSpell;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ScriptName`, `Comment`) VALUES
(17, 0, @SummonSpell, 0, 0, 29, 0, @Glacion, 100, 0, 1, '', "Do not summon Glacion, if he is already spawned (100 Yards)"),
(17, 0, @SummonSpell, 0, 0, 28, 0, @QuestH, 0, 0, 1, '', "Do not summon Glacion, if player has quest objective completed, but not yet rewarded. (Horde)"),
(17, 0, @SummonSpell, 0, 0, 28, 0, @QuestA, 0, 0, 1, '', "Do not summon Glacion, if player has quest objective completed, but not yet rewarded. (Alliance)");
