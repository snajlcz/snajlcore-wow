set names utf8;
-- fix  quests 4921 "Пропавшая без вести"
UPDATE `creature_template` SET `npcflag` = 3 WHERE `entry` = 10668;

-- fix quests 6001,6002 Druid
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

-- pit_of_saron_questfixes
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

-- Q12872
UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry`=29775;

-- Quest 10368
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
