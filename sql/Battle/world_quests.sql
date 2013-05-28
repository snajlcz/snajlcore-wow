set names utf8;
-- DB/Quests: Fix: Lost in Battle
-- http://ru.wowhead.com/quest=4921
UPDATE `creature_template` SET `npcflag` = 3 WHERE `entry` = 10668;

-- DB/Quests: Fix: Body and Heart (Druid)
-- http://ru.wowhead.com/quest=6001
-- http://ru.wowhead.com/quest=6002
UPDATE `quest_template` SET `RequiredNpcOrGo1`='12138' WHERE `Id`=6001; 
UPDATE `quest_template` SET `RequiredNpcOrGoCount1`='1' WHERE `Id`=6001;
UPDATE `quest_template` SET `SpecialFlags`=0 WHERE `Id`=6001;
UPDATE `quest_template` SET `RequiredNpcOrGo1`='12138' WHERE `Id`=6002; 
UPDATE `quest_template` SET `RequiredNpcOrGoCount1`='1' WHERE `Id`=6002;
UPDATE `quest_template` SET `SpecialFlags`=0 WHERE `Id`=6002;

-- DB/Quests: Fix: A Suitable Disguise 
-- http://ru.wowhead.com/quest=20438
-- http://ru.wowhead.com/quest=24556
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

-- Nagrand thx @Dimitro
-- DB/Quests: Fix: Blessing of Incineratus
-- http://ru.wowhead.com/quest=9805
UPDATE `item_template` SET `ScriptName` = "item_living_fire" WHERE `entry` = 24467;

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

-- DB/Quests: Fix: Norgannon's Shell
-- http://ru.wowhead.com/quest=12872
UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry`=29775;

-- DB/Quests: Fix: The Dreghood Elders THX @Dimitro
-- http://ru.wowhead.com/quest=10368
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
INSERT IGNORE INTO `fishing_loot_template`(`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES 
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
-- http://ru.wowhead.com/quest=12070
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE entry = 26261;
-- Grant quest credit, after spell used on npc.
DELETE FROM `smart_scripts` WHERE entryorguid = 26261;
INSERT INTO `smart_scripts` VALUES (26261, 0, 0, 0, 8, 0, 100, 0, 47394, 0, 0, 0, 33, 26261, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Spellhit call Killcredit for Q 12070');

-- DB/Quest: Update: Arena Grandmaster
-- DB/Quest: Update: Großmeister der Arena
-- Update SpecialFlags, NOT repeatable. (hack)
-- http://ru.wowhead.com/quest=7838
UPDATE `quest_template` SET SpecialFlags = 0 WHERE `Id` = 7838;

-- DB/Quest: Fix: In Search Of Answers
-- DB/Quest: Fix: Auf der Suche nach Antworten
-- Activate GO for players.
-- http://ru.wowhead.com/quest=12902/in-search-of-answers
UPDATE `gameobject_template` SET flags = 32 WHERE entry = 191766;

-- DB/Quest: Fix: A Suitable Disguise
-- DB/Quest: Fix: Eine passende Verkleidung
-- http://ru.wowhead.com/quest=20438/a-suitable-disguise
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
-- http://ru.wowhead.com/quest=1920/investigate-the-blue-recluse
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
-- http://ru.wowhead.com/quest=14102/mistcaller-yngvar
DELETE FROM `event_scripts` WHERE `id`=21997 AND `command`=10;
INSERT INTO `event_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(21997,2,10,34965,120000,0,10181.96,1183.417,76.12115,5.934119);
-- Disable questitem if the npc is already summoned or the player has the quest completed, but not yet rewarded.
DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceEntry= 66621;
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, comment ) VALUES
(17, 0, 66621, 0, 0, 29, 34965, 40, 0, 1, 0, "Cant use Mistcallers Charm within 40 yards of Yngvar"),
(17, 0, 66621, 0, 0, 28, 14102, 0, 0, 1, 0, "Cant use Mistcallers Charm, if player has quest objective completed, but not yet rewarded.");

-- DB/Quest: Hack: The Frost Wyrm and its Master
-- DB/Quest: Hack: Der Frostwyrm und sein Meister
-- http://ru.wowhead.com/quest=11238/the-frost-wyrm-and-its-master
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

-- DB/Quest: Fix: Into the pit
-- http://ru.wowhead.com/quest=12997/into-the-pit
REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES (30174, 0, 0, 0, 0, 0, 26388, 0, 0, 0, 'Hyldsmeet Warbear', '', '', 0, 80, 80, 2, 2128, 2128, 16777216, 1, 1.71429, 1, 0, 420, 630, 0, 157, 1, 2000, 2000, 1, 8, 8, 4, 0, 0, 0, 0, 336, 504, 126, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 222, 0, 0, '', 0, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 164, 1, 0, 0, '', 12340);
REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES (30175, 0, 0, 0, 0, 0, 25771, 0, 0, 0, 'Hyldsmeet Bear Rider', '', '', 0, 79, 80, 2, 2128, 2128, 1, 1, 1.28571, 1, 0, 420, 630, 0, 157, 1, 2000, 2000, 1, 33554944, 8, 0, 0, 0, 0, 0, 336, 504, 126, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '', 12340);
