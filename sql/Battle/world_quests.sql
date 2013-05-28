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
-- http://ru.wowhead.com/quest=9910/standards-and-practices
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

-- DB/Quest: Fix: Foolish Endeavors | by dr-j
-- DB/Quest: Fix: Törichtes Unterfangen
-- http://ru.wowhead.com/quest=11705/foolish-endeavors
SET @Getry := 25729;  -- Shadowstalker Getry
SET @Varidus := 25618;  -- Varidus the Flenser
SET @Necrolord := 25730;  -- En'kilah Necrolord
SET @Saurfang := 25751;  -- High Overlord Saurfang
SET @Prisoner := 25624;  -- Infested Prisoner
SET @Aberration := 25625;  -- Warsong Aberration
SET @quest := 11705;  -- Foolish Endeavors
SET @guid := 300010;  -- Needs 42 for missing spawns of infested prisoner (300010, is custom by EchoCore)
UPDATE `creature_template` SET `minlevel`=65, `maxlevel`=70, `exp`=2, `faction_A`=14, `faction_H`=14, `unit_flags`=33554688,`AIName`= 'SmartAI' WHERE  `entry`=@Prisoner;
UPDATE `creature_template` SET `AIName`= 'SmartAI',`ScriptName`='',`unit_flags`= 0 WHERE `entry`IN(@Getry,@Varidus,@Necrolord,@Saurfang,@Aberration);
UPDATE `creature_template` SET `minlevel`=70, `maxlevel`=70, `exp`=2,`mindmg`=474, `maxdmg`=574 WHERE  `entry`=@Saurfang;
UPDATE `creature_template` SET `unit_flags`=32768 WHERE  `entry`=@Getry;
DELETE FROM `creature` WHERE `id`=@Prisoner;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
(@guid, @Prisoner, 571, 1, 1, 0, 0, 3092.136, 6516.039, 82.06012, 5.183628, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+1, @Prisoner, 571, 1, 1, 0, 0, 3089.2, 6526.226, 81.77282, 1.902409, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+2, @Prisoner, 571, 1, 1, 0, 0, 3096.962, 6510.87, 82.08541, 0.5585054, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+3, @Prisoner, 571, 1, 1, 0, 0, 3093.876, 6522.219, 81.79565, 0.01745329, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+4, @Prisoner, 571, 1, 1, 0, 0, 3098.928, 6517.495, 81.77497, 3.001966, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+5, @Prisoner, 571, 1, 1, 0, 0, 3103.036, 6504.89, 82.04672, 3.944444, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+6, @Prisoner, 571, 1, 1, 0, 0, 3104.042, 6511.731, 81.80676, 3.455752, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+7, @Prisoner, 571, 1, 1, 0, 0, 3093.038, 6547.074, 80.75952, 5.899213, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+8, @Prisoner, 571, 1, 1, 0, 0, 3096.117, 6544.481, 80.7102, 1.605703, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+9, @Prisoner, 571, 1, 1, 0, 0, 3099.3, 6541.367, 80.77256, 4.799655, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+10, @Prisoner, 571, 1, 1, 0, 0, 3090.39, 6541.875, 81.06445, 3.054326, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+11, @Prisoner, 571, 1, 1, 0, 0, 3102.454, 6538.238, 80.83416, 1.58825, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+12, @Prisoner, 571, 1, 1, 0, 0, 3093.245, 6538.743, 81.06524, 3.455752, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+13, @Prisoner, 571, 1, 1, 0, 0, 3105.601, 6534.979, 80.85965, 0.1570796, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+14, @Prisoner, 571, 1, 1, 0, 0, 3096.462, 6535.528, 81.13345, 4.921828, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+15, @Prisoner, 571, 1, 1, 0, 0, 3087.603, 6536.683, 81.36699, 4.18879, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+16, @Prisoner, 571, 1, 1, 0, 0, 3108.599, 6531.898, 80.8754, 5.462881, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+17, @Prisoner, 571, 1, 1, 0, 0, 3100.571, 6532.094, 81.16553, 6.230825, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+18, @Prisoner, 571, 1, 1, 0, 0, 3122.098, 6518.814, 80.70912, 1.815142, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+19, @Prisoner, 571, 1, 1, 0, 0, 3116.981, 6515.013, 81.07998, 5.899213, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+20, @Prisoner, 571, 1, 1, 0, 0, 3126.142, 6514.962, 80.68482, 1.954769, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+21, @Prisoner, 571, 1, 1, 0, 0, 3112.065, 6511.906, 81.3951, 5.148721, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+22, @Prisoner, 571, 1, 1, 0, 0, 3129.413, 6511.592, 80.7066, 2.722714, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+23, @Prisoner, 571, 1, 1, 0, 0, 3122.214, 6510.255, 81.00794, 2.86234, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+24, @Prisoner, 571, 1, 1, 0, 0, 3116.414, 6507.338, 81.34387, 5.811946, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+25, @Prisoner, 571, 1, 1, 0, 0, 3109.384, 6506.753, 81.68826, 6.038839, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+26, @Prisoner, 571, 1, 1, 0, 0, 3126.804, 6505.612, 81.01304, 3.909538, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+27, @Prisoner, 571, 1, 1, 0, 0, 3120.997, 6502.847, 81.33372, 3.228859, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+28, @Prisoner, 571, 1, 1, 0, 0, 3114.636, 6501.495, 81.61775, 0.3490658, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+29, @Prisoner, 571, 1, 1, 0, 0, 3109.11, 6498.783, 81.92492, 2.635447, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+30, @Prisoner, 571, 1, 1, 0, 0, 3126.413, 6498.179, 81.30205, 6.248279, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+31, @Prisoner, 571, 1, 1, 0, 0, 3120.758, 6495.855, 81.59259, 2.495821, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+32, @Prisoner, 571, 1, 1, 0, 0, 3115.22, 6492.261, 81.93079, 5.5676, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+33, @Prisoner, 571, 1, 1, 0, 0, 3126.15, 6489.568, 81.65459, 2.146755, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+34, @Prisoner, 571, 1, 1, 0, 0, 3120.454, 6486.966, 81.9426, 1.902409, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+35, @Prisoner, 571, 1, 1, 0, 0, 3095.756, 6528.297, 81.4939, 4.433136, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+36, @Prisoner, 571, 1, 1, 0, 0, 3091.309, 6532.723, 81.41476, 4.502949, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+37, @Prisoner, 571, 1, 1, 0, 0, 3104.285, 6519.577, 81.50758, 6.178465, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+38, @Prisoner, 571, 1, 1, 0, 0, 3112.36, 6527.987, 80.87508, 3.630285, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+39, @Prisoner, 571, 1, 1, 0, 0, 3104.28, 6528.084, 81.18883, 3.420845, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+40, @Prisoner, 571, 1, 1, 0, 0, 3116.763, 6524.073, 80.84852, 6.021386, 120, 0, 0, 1848, 0, 0, 0, 0, 0),
(@guid+41, @Prisoner, 571, 1, 1, 0, 0, 3099.789, 6524.306, 81.51059, 3.368485, 120, 0, 0, 1848, 0, 0, 0, 0, 0);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN(@Getry,@Varidus,@Necrolord,@Saurfang,@Prisoner,@Aberration,@Prisoner*100,@Varidus*100);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@Getry, 0, 0 ,1,19, 0, 100, 0, @quest, 0, 0,0,81,0,0,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'Shadowstalker Getry - On Quest Accept - Set Npc Flags'),
(@Getry, 0, 1 ,2,61, 0, 100, 0, 0, 0, 0,0,12,@Varidus,1,300000,0,0,0,8,0,0,0,3138.213867,6513.904785,80.220337,2.407976, 'Shadowstalker Getry - Linked with Previous Event - Spawn Varidus the Flenser'),
(@Getry, 0, 2 ,46,61, 0, 100, 0, 0, 0, 0,0,1,0,3000,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'Shadowstalker Getry - Linked with Previous Event - Say'),
(@Getry, 0, 3 ,4,52, 0, 100, 0, 0, @Getry, 0,0,1,1,0,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'Shadowstalker Getry - On Text Over - Say'),
(@Getry, 0, 4 ,0,61, 0, 100, 0, 0, 0, 0,0,53,0,@Getry,0,0,0,1,1,0,0,0,0, 0, 0, 0, 'Shadowstalker Getry - Linked with Previous Event - Start WP'),
(@Getry, 0, 5 ,0,11, 0, 100, 0, 0, 0, 0,0,81,2,0,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'Shadowstalker Getry - On Reset - Set NPC Flags'),
(@Getry, 0, 6 ,0,40, 0, 100, 1, 8, @Getry, 0,0,11,34189,0,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'Shadowstalker Getry - On reached WP8 - Cast Stealth'),
(@Getry, 0, 7 ,8,40, 0, 100, 0, 10, @Getry, 0,0,11,45922,0,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'Shadowstalker Getry - On reached WP10 - Cast Shadow Prison'),
(@Getry, 0, 8 ,9,61, 0, 100, 0, 10, 0, 0,0,85,45922,0,0,0,0,0,7,0,0,0,0, 0, 0, 0, 'Shadowstalker Getry - Linked with Previous Event - Cast Shadow Prison'),
(@Getry, 0, 9 ,10,61, 0, 100, 0, 10, 0, 0,0,101,0,0,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'Shadowstalker Getry - Linked with Previous Event - Set Home Position'),
(@Getry, 0, 10 ,17,61, 0, 100, 0, 10, 0, 0,0,1,0,5000,0,0,0,0,9,@Varidus,0,100,0, 0, 0, 0, 'Shadowstalker Getry - Linked with Previous Event - Say'),
(@Getry, 0, 11 ,18,52, 0, 100, 0, 0, @Varidus, 0,0,1,1,5000,0,0,0,0,9,@Varidus,0,100,0, 0, 0, 0, 'Shadowstalker Getry - On Text Over - Say'),
(@Getry, 0, 12 ,0,52, 0, 100, 0, 1, @Varidus, 0,0,1,2,5000,0,0,0,0,9,@Varidus,0,100,0, 0, 0, 0, 'Shadowstalker Getry - On Text Over - Say'),
(@Getry, 0, 13 ,0,52, 0, 100, 0, 2, @Varidus, 0,0,1,3,5000,0,0,0,0,9,@Varidus,0,100,0, 0, 0, 0, 'Shadowstalker Getry - On Text Over - Say'),
(@Getry, 0, 14 ,0,52, 0, 100, 0, 3, @Varidus, 0,0,1,4,5000,0,0,0,0,9,@Varidus,0,100,0, 0, 0, 0, 'Shadowstalker Getry - On Text Over - Say'),
(@Getry, 0, 15 ,0,52, 0, 100, 0, 4, @Varidus, 0,0,1,5,5000,0,0,0,0,9,@Varidus,0,100,0, 0, 0, 0, 'Shadowstalker Getry - On Text Over - Say'),
(@Getry, 0, 16 ,19,52, 0, 100, 0, 5, @Varidus, 0,0,1,6,5000,0,0,0,0,9,@Varidus,0,100,0, 0, 0, 0, 'Shadowstalker Getry - On Text Over - Say'),
(@Getry, 0, 17 ,30,61, 0, 100, 0, 0, 0, 0,0,28,34189,0,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'Shadowstalker Getry - Linked with Previous Event - Remove Stealth'),
(@Getry, 0, 18 ,0,61, 0, 100, 0, 0, 0, 0,0,12,@Necrolord,1,300000,0,0,0,8,0,0,0,3143.825195,6510.083008,80.234024,2.289084, 'Shadowstalker Getry - Linked with Previous Event - Spawn En''kilah Necrolord'),
(@Getry, 0, 19 ,0,61, 0, 100, 0, 0, 0, 0,0,45,1,1,0,0,0,0,9,@Necrolord,0,200,0,0,0,0, 'Shadowstalker Getry - Linked with Previous Event - Spawn Varidus the Flenser'),
(@Getry, 0, 20 ,0,52, 0, 100, 0, 6, @Varidus, 0,0,1,0,5000,0,0,0,0,9,@Saurfang,0,200,0,0,0,0, 'Shadowstalker Getry - On Text Over - Say'),
(@Getry, 0, 21 ,0,52, 0, 100, 0, 0, @Saurfang, 0,0,1,7,5000,0,0,0,0,9,@Varidus,0,200,0,0,0,0, 'Shadowstalker Getry - On Text Over - Say'),
(@Getry, 0, 22 ,0,52, 0, 100, 0, 7, @Varidus, 0,0,1,1,5000,0,0,0,0,9,@Saurfang,0,200,0,0,0,0, 'Shadowstalker Getry - On Text Over - Say'),
(@Getry, 0, 23 ,0,52, 0, 100, 0, 1, @Saurfang, 0,0,1,7,5000,0,0,0,0,9,@Saurfang,0,200,0,0,0,0, 'Shadowstalker Getry - On Text Over - Say'),
(@Getry, 0, 24 ,0,52, 0, 100, 0, 2, @Saurfang, 0,0,1,8,5000,0,0,0,0,9,@Varidus,0,200,0,0,0,0, 'Shadowstalker Getry - On Text Over - Say'),
(@Getry, 0, 25 ,0,52, 0, 100, 0, 8, @Varidus, 0,0,1,3,5000,0,0,0,0,9,@Saurfang,0,200,0,0,0,0, 'Shadowstalker Getry - On Text Over - Say'),
(@Getry, 0, 26 ,0,52, 0, 100, 0, 3, @Saurfang, 0,0,1,9,5000,0,0,0,0,9,@Varidus,0,200,0,0,0,0, 'Shadowstalker Getry - On Text Over - Say'),
(@Getry, 0, 27 ,0,52, 0, 100, 0, 9, @Varidus, 0,0,1,10,2000,0,0,0,0,9,@Varidus,0,200,0,0,0,0, 'Shadowstalker Getry - On Text Over - Say'),
(@Getry, 0, 28 ,29,52, 0, 100, 0, 10, @Varidus, 0,0,28,45922,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Shadowstalker Getry - On Text Over - Remove Shadow Prison'),
(@Getry, 0, 29 ,31,61, 0, 100, 0, 0, 0, 0,0,28,45922,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Shadowstalker Getry - Linked with Previous Event - Remove Shadow Prison'),
(@Getry, 0, 30 ,0,61, 0, 100, 0, 0, 0, 0,0,45,1,1,0,0,0,0,9,@Varidus,0,200,0,0,0,0, 'Shadowstalker Getry - Linked with Previous Event - Set Data'),
(@Getry, 0, 31 ,0,61, 0, 100, 0, 0, 0, 0,0,45,1,2,0,0,0,0,9,@Varidus,0,200,0,0,0,0, 'Shadowstalker Getry - Linked with Previous Event - Set Data'),
(@Getry, 0, 33 ,34,38, 0, 100, 0, 1, 4, 0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Shadowstalker Getry - Linked with Previous Event - Set Data'),
(@Getry, 0, 34 ,0,61, 0, 100, 0, 0, 0, 0,0,49,0,0,0,0,0,0,19,@Varidus,200,0,0,0,0,0, 'Shadowstalker Getry - Linked with Previous Event - Set Data'),
(@Getry, 0, 35 ,0,52, 0, 100, 0, 7, @Saurfang, 0,0,1,2,5000,0,0,0,0,9,@Saurfang,0,200,0,0,0,0, 'Shadowstalker Getry - On Text Over - Say'),
(@Getry, 0, 36 ,0,38, 0, 100, 0, 1, 3, 0,0,1,2,5000,0,0,0,0,1,0,0,0,0,0,0,0, 'Shadowstalker Getry - On Data Set - Say'),
(@Getry, 0, 37 ,38,52, 0, 100, 0, 2, @Getry, 0,0,1,3,5000,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'Shadowstalker Getry - On Text Over - Say'),
(@Getry, 0, 38 ,47,61, 0, 100, 0, 0, 0, 0,0,15,@quest,0,0,0,0,0,7,0,0,0,0, 0, 0, 0, 'Shadowstalker Getry - Linked with Previous Event - Quest Credit'),
(@Getry, 0, 39 ,0,52, 0, 100, 0, 3, @Getry, 0,0,1,4,5000,0,0,0,0,9,@Saurfang,0,200,0, 0, 0, 0, 'Shadowstalker Getry - On Text Over - Say'),
(@Getry, 0, 40 ,41,52, 0, 100, 0, 4, @Saurfang, 0,0,45,1,3,0,0,0,0,9,@Saurfang,0,200,0, 0, 0, 0, 'Shadowstalker Getry - Linked with Previous Event - Set Data'),
(@Getry, 0, 41 ,0,61, 0, 100, 0, 0, 0, 0,0,53,0,@Getry*100,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'Shadowstalker Getry - Linked with Previous Event - Start WP'),
(@Getry, 0, 42 ,43,40, 0, 100, 0, 10, @Getry*100, 0,0,81,2,0,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'Shadowstalker Getry - On reached WP10 (Return)- Set NPC Flags'),
(@Getry, 0, 43 ,44,61, 0, 100, 0, 0, 0, 0,0,18,756,0,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'Shadowstalker Getry - Linked with Previous Event - Set Unit Flags'),
(@Getry, 0, 44 ,45,61, 0, 100, 0, 0, 0, 0,0,101,0,0,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'Shadowstalker Getry - Linked with Previous Event - Set Home Position'),
(@Getry, 0, 45 ,49,61, 0, 100, 0, 0, 0, 0,0,22,0,0,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'Shadowstalker Getry - Linked with Previous Event - Set Phase 1'),
(@Getry, 0, 46 ,48,61, 0, 100, 0, 0, 0, 0,0,11,45924,0,0,0,0,0,7,0,0,0,0, 0, 0, 0, 'Shadowstalker Getry - Linked with Previous Event - Cast on Getrys Quest'),
(@Getry, 0, 47 ,0,61, 0, 100, 0, 0, 0, 0,0,15,@quest,0,0,0,0,0,21,100,0,0,0, 0, 0, 0, 'Shadowstalker Getry - Linked with Previous Event - Quest Credit'),
(@Getry, 0, 48 ,0,61, 0, 100, 0, 0, 0, 0,0,22,2,0,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'Shadowstalker Getry - Linked with Previous Event - Set Phase 2'),
(@Getry, 0, 49 ,0,61, 0, 100, 0, 0, 0, 0,0,70,0,0,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'Shadowstalker Getry - Linked with Previous Event - Respawn'),
(@Varidus, 0, 0 ,1,11, 0, 100, 0, 0, 0, 0,0,2,1982,0,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'Varidus the Flenser - On Spawn - Set Faction'),
(@Varidus, 0, 1 ,2,61, 0, 100, 0, 0, 0, 0,0,18,768,0,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'Varidus the Flenser - Linked with Previous Event - Set Unit Flags'),
(@Varidus, 0, 2 ,0,61, 0, 100, 0, 0, 0, 0,0,53,0,@Varidus,0,0,0,1,1,0,0,0,0, 0, 0, 0, 'Varidus the Flenser - Linked with Previous Event - Start WP'),
(@Varidus, 0, 3 ,0,38, 0, 100, 0, 1, 1, 0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,1.5, 'Varidus the Flenser - On Data Set - Set Orientation'),
(@Varidus, 0, 4 ,11,38, 0, 100, 0, 1, 2, 0,0,19,768,0,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'Varidus the Flenser - On Data Set - Set Unit Flags'),
(@Varidus, 0, 5 ,0,40, 0, 100, 0, 2, 0, 0,0,101,0,0,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'Varidus the Flenser - On Data Set - Set Unit Flags'),
(@Varidus, 0, 6 ,0,9, 0, 100, 0, 0, 10, 5000,8000,11,32711,0,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'Varidus the Flenser - IC - Cast Shadow Nova'),
(@Varidus, 0, 7 ,0,0, 0, 100, 0, 10000, 12000, 10000,15000,11,50329,0,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'Varidus the Flenser - IC - Cast Shied of Suffering'),
(@Varidus, 0, 8 ,0,6, 0, 100, 0, 0, 0, 0,0,45,1,3,0,0,0,0,9,@Getry,0,200,0, 0, 0, 0, 'Varidus the Flenser - On Death - Set Data'),
(@Varidus, 0, 9 ,10,4, 0, 100, 0, 0, 0, 0,0,45,1,4,0,0,0,0,9,@Getry,0,200,0, 0, 0, 0, 'Varidus the Flenser - On Agro - Set Data'),
(@Varidus, 0, 10 ,0,61, 0, 100, 0, 0, 0, 0,0,45,1,2,0,0,0,0,9,@Saurfang,0,200,0, 0, 0, 0, 'Varidus the Flenser - Linked with Previous Event - Set Data'),
(@Varidus, 0, 11 ,13,61, 0, 100, 0, 0, 0, 0,0,11,45805,0,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'Varidus the Flenser - Linked with Previous Event - Cast Release Aberration'),
(@Varidus, 0, 12 ,0,40, 0, 100, 0, 1, 0, 0,0,1,11,7000,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'Varidus the Flenser - Linked with Previous Event - Say'),
(@Varidus, 0, 13 ,14,61, 0, 100, 0, 0, 0, 0,0,28,45908,0,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'Varidus the Flenser - Linked with Previous Event - Remove Shield of Suffering'),
(@Varidus, 0, 14 ,0,61, 0, 100, 0, 0, 0, 0,0,80,@Varidus*100,2,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'Varidus the Flenser - Linked with Previous Event - Run Script'),
(@Varidus*100, 9, 0 ,0,0, 0, 100, 0, 2000, 2000, 0,0,45,1,1,0,0,0,0,9,@Aberration,0,200,0, 0, 0, 0, 'Varidus the Flenser - Timed Script - Set Data'),
(@Necrolord, 0, 0 ,1,11, 0, 100, 0, 0, 0, 0,0,2,1982,0,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'En''kilah Necrolord - On Spawn - Set Faction'),
(@Necrolord, 0, 1 ,2,61, 0, 100, 0, 0, 0, 0,0,18,768,0,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'En''kilah Necrolord - Linked with Previous Event - Set Unit Flags'),
(@Necrolord, 0, 2 ,0,61, 0, 100, 0, 0, 0, 0,0,53,0,@Necrolord,0,0,0,1,1,0,0,0,0, 0, 0, 0, 'En''kilah Necrolord - Linked with Previous Event - Start WP'),
(@Necrolord, 0, 3 ,0,40, 0, 100, 0, 2, 0, 0,0,101,0,0,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'En''kilah Necrolord - On reached WP1 - Set Home Position'),
(@Necrolord, 0, 4 ,5,38, 0, 100, 0, 1, 1, 0,0,36,@Saurfang,0,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'En''kilah Necrolord - On Data Set- Set Entry'),
(@Necrolord, 0, 5 ,6,61, 0, 100, 0, 0, 0, 0,0,66,0,0,0,0,0,0,8,0,0,0,0, 0, 0, 4.5, 'En''kilah Necrolord - Linked with Previous Event - Set Orientation'),
(@Necrolord, 0, 6 ,0,61, 0, 100, 0, 0, 0, 0,0,2,1981  ,0,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'High Overlord Saurfang - On Data Set - Set Unit Flags'),
(@Necrolord, 0, 7 ,0,38, 0, 100, 0, 1, 2, 0,0,19,768,0,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'High Overlord Saurfang - On Data Set - Set Unit Flags'),
(@Necrolord, 0, 9 ,0,38, 0, 100, 0, 1, 3, 0,0,41,3000,0,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'High Overlord Saurfang - On Data Set - Despawn'),
(@Necrolord, 0, 10 ,0,9, 0, 100, 0, 0, 5, 33000,38000,11,41097,0,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'High Overlord Saurfang - On Range - Cast Whirlwind'),
(@Necrolord, 0, 11 ,0,0, 0, 100, 0, 3000, 7000, 3000,8000,11,16044,0,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'High Overlord Saurfang - IC - Cast Cleave'),
(@Necrolord, 0, 12 ,0,0, 0, 100, 0, 2000, 7000, 5000,7000,11,24573,0,0,0,0,0,2,0,0,0,0, 0, 0, 0, 'High Overlord Saurfang - IC - Cast Mortal Strike'),
(@Necrolord, 0, 13 ,0,9, 0, 100, 0, 8, 25, 5000,5000,11,15749,0,0,0,0,0,2,0,0,0,0, 0, 0, 0, 'High Overlord Saurfang - On Range - Cast Shield Charge'),
(@Necrolord, 0, 14 ,15,4, 0, 100, 0, 0, 0, 0,0,11,45950,0,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'High Overlord Saurfang - On Agro - Cast Saurfangs Rage'),
(@Necrolord, 0, 15 ,16,61, 0, 100, 0, 0, 0, 0,0,11,45950,0,0,0,0,0,9,@Getry,0,200,0, 0, 0, 0, 'High Overlord Saurfang - Linked with Previous Event - Cast Saurfangs Rage'),
(@Necrolord, 0, 16 ,17,61, 0, 100, 0, 0, 0, 0,0,11,45950,0,0,0,0,0,21,100,0,0,0, 0, 0, 0, 'High Overlord Saurfang - Linked with Previous Event - Cast Saurfangs Rage'),
(@Necrolord, 0, 17 ,20,61, 0, 100, 0, 0, 0, 0,0,1,5,1000,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'High Overlord Saurfang - Linked with Previous Event - Say'),
(@Necrolord, 0, 18 ,0,52, 0, 100, 0, 5, @Saurfang, 0,0,1,6,1000,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'High Overlord Saurfang - On Text Over - Say'),
(@Necrolord, 0, 20 ,0,61, 0, 100, 0, 0, 0, 0,0,21,1,0,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'High Overlord Saurfang - Linked with Previous Event - Interupt Whirlwind'),
(@Prisoner, 0, 0 ,0,6, 0, 100, 0, 0, 0, 0,0,11,45802,2,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'Infested Prisoner - On Death - Cast Summoned Aberration'),
(@Aberration, 0, 0 ,0,11, 0, 100, 0, 0, 0, 0,0,2,1982,0,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'Warsong Aberration - On Spawn - Set Faction'),
(@Aberration, 0, 1 ,0,38, 0, 100, 0, 1, 1, 0,0,53,1,@Aberration,0,0,0,2,1,0,0,0,0, 0, 0, 0, 'Warsong Aberration - Linked with Previous Event - Start WP'),
(@Aberration, 0, 2 ,3,40, 0, 100, 0, 1, 0, 0,0,101,0,0,0,0,0,0,1,0,0,0,0, 0, 0, 0, 'Warsong Aberration - On Reached WP1 - Set Home Position'),
(@Aberration, 0, 3 ,0,61, 0, 100, 0, 0, 0, 0,0,49,0,0,0,0,0,0,19,@Necrolord,500,0,0, 0, 0, 0, 'Warsong Aberration - Linked with Previous Event - Attack'),
(@Aberration, 0, 4 ,0,9, 0, 100, 0, 0, 5, 990,3000,11,50306,2,0,0,0,0,7,0,0,0,0, 0, 0, 0, 'Warsong Aberration - IC - Cast Thrash Kick');
DELETE FROM `creature_text` WHERE `entry` IN(@Getry,@Varidus,@Saurfang);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@Getry,0,0,'This is it, $N. The start of the end of the world. And you''re here to see it off...',12,1,100,1,0,0,'Shadowstalker Getry'),
(@Getry,1,0,'Let''s go...',12,1,100,25,0,0,'Shadowstalker Getry'),
(@Getry,2,0,'I... I can''t believe it... Saurfang... I... I am honored... honored to have fought along side you, sir.',12,1,100,0,0,0,'Shadowstalker Getry'),
(@Getry,3,0,'You should return to Warsong Hold now, friend. Hellscream will surely want to hear of what just happened here... of Saurfang...',12,0,100,0,0,0,'Shadowstalker Getry'),
(@Varidus,0,0,'Is this it? Is this all the mighty Horde could muster?',12,0,100,6,0,0,'Varidus the Flenser'),
(@Varidus,1,0,'Pathetic.',12,0,100,11,0,0,'Varidus the Flenser'),
(@Varidus,2,0,'I''ve never understood your type. The hero...',12,0,100,1,0,0,'Varidus the Flenser'),
(@Varidus,3,0,'Why won''t you just let go? Why do you fight the inevitable?',12,0,100,6,0,0,'Varidus the Flenser'),
(@Varidus,4,0,'The Lich King cannot be stopped. Accept it.',12,0,100,274,0,0,'Varidus the Flenser'),
(@Varidus,5,0,'This world is coming to an end. Let. It. Burn.',12,0,100,397,0,0,'Varidus the Flenser'),
(@Varidus,6,0,'Take $g him:her; away and prepare $g him:her; for reanimation.',12,0,100,1,0,0,'Varidus the Flenser'),
(@Varidus,7,0,'What''s this now?',12,0,100,1,0,0,'Varidus the Flenser'),
(@Varidus,8,0,'Then you are a fool.',12,0,100,25,0,0,'Varidus the Flenser'),
(@Varidus,9,0,'You? A lone orc? Against me and...',12,0,100,397,0,0,'Varidus the Flenser'),
(@Varidus,10,0,'RISE!',14,0,100,0,0,0,'Varidus the Flenser'),
(@Varidus,11,0,'I will reanimate them all as servants of the Lich King! Bring them here...',14,0,100,0,0,0,'Varidus the Flenser'),
(@Saurfang,0,0,'I''ll rip your shriveled heart out with my bare hands before any harm comes to $N, necromancer.',12,1,100,5,0,0,'En''kilah Necrolord'),
(@Saurfang,1,0,'You were never alone, $N.',12,1,100,1,0,0,'Varidus the Flenser'),
(@Saurfang,2,0,'We will fight you with every fiber of our being - until we are nothing more than dust and debris. We will fight until the end.',12,1,100,1,0,0,'En''kilah Necrolord'),
(@Saurfang,3,0,'A fool who is about to end you, necrolord. There will be nothing left of you for the Lich King to reanimate!',12,1,100,397,0,0,'En''kilah Necrolord'),
(@Saurfang,4,0,'You''ll make no mention of me. Either of you!',12,1,100,0,0,0,'En''kilah Necrolord'),
(@Saurfang,5,0,'%s''s eyes glow red for a brief moment.',16,0,100,0,0,0,'En''kilah Necrolord'),
(@Saurfang,6,0,'Is that the best you can do?',12,1,100,0,0,0,'En''kilah Necrolord'),
(@Saurfang,7,0,'This world that you seek to destroy is our home.',12,1,100,1,0,0,'En''kilah Necrolord');
DELETE FROM `waypoints` WHERE `entry`IN(@Getry,@Varidus,@Necrolord,@Getry*100,@Aberration);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(@Getry, 1, 3109.214111,6587.148438,91.369102, 'Shadowstalker Getry'),
(@Getry, 2, 3115.414062,6595.680176,91.362068, 'Shadowstalker Getry'),
(@Getry, 3, 3125.109863,6590.983887,91.378548, 'Shadowstalker Getry'),
(@Getry, 4, 3123.863281,6582.144043,88.786133, 'Shadowstalker Getry'),
(@Getry, 5, 3117.805664,6583.018555,86.219604, 'Shadowstalker Getry'),
(@Getry, 6, 3118.874512,6590.157715,83.402168, 'Shadowstalker Getry'),
(@Getry, 7, 3127.298340,6589.030273,79.707741, 'Shadowstalker Getry'),
(@Getry, 8, 3126.639404,6584.798828,77.656845, 'Shadowstalker Getry'), -- Stealth
(@Getry, 9, 3123.355957,6575.417969,78.330284, 'Shadowstalker Getry'), 
(@Getry, 10,  3121.773926,6538.688477,80.066902, 'Shadowstalker Getry'), -- Event
(@Varidus, 1, 3123.657227,6522.142090,80.486023, 'Varidus the Flenser'),
(@Varidus, 2, 3115.540283,6530.901367,80.566826, 'Varidus the Flenser'),
(@Necrolord, 1, 3116.012451,6532.729492,80.472694, 'En''kilah Necrolord'),
(@Necrolord, 2, 3118.596191,6535.331055,80.281487, 'En''kilah Necrolord'),
(@Getry*100, 1, 3123.355957,6575.417969,78.330284, 'Shadowstalker Getry'), 
(@Getry*100, 2, 3126.639404,6584.798828,77.656845, 'Shadowstalker Getry'), 
(@Getry*100, 3, 3127.298340,6589.030273,79.707741, 'Shadowstalker Getry'),
(@Getry*100, 4, 3118.874512,6590.157715,83.402168, 'Shadowstalker Getry'),
(@Getry*100, 5, 3117.805664,6583.018555,86.219604, 'Shadowstalker Getry'),
(@Getry*100, 6, 3123.863281,6582.144043,88.786133, 'Shadowstalker Getry'),
(@Getry*100, 7, 3125.109863,6590.983887,91.378548, 'Shadowstalker Getry'),
(@Getry*100, 8, 3115.414062,6595.680176,91.362068, 'Shadowstalker Getry'),
(@Getry*100, 9, 3109.214111,6587.148438,91.369102, 'Shadowstalker Getry'),
(@Getry*100, 10, 3113.419922,6576.810059,97.090698, 'Shadowstalker Getry'),
(@Aberration, 1, 3113.419922,6576.810059,97.090698, 'Warsong Aberration');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceEntry`=@Getry;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(22, 37, @Getry, 0, 0, 36, 1, 0, 0, 0, 0, 0, '','Only execute SAI if Shadowstalker Getry alive');
DELETE FROM `creature_equip_template` WHERE `entry`=@Saurfang;
INSERT INTO `creature_equip_template` (`entry`, `id`, `itemEntry1`, `itemEntry2`, `itemEntry3`) VALUES 
(@Saurfang, 1, 21580, 0, 0);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=45805;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 1, 45805, 0, 0, 31, 0, 3, @Prisoner, 0, 0, 0, '','Release Aberration Targets Infested Prisoner');
DELETE FROM `disables` WHERE `sourceType`=0 AND `entry`=45805;
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES 
(0, 45805, 64, '', '', 'Ignore LOS on Release Aberration');
DELETE FROM `creature_template_addon` WHERE `entry` IN(@Getry,@Prisoner,@Varidus);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES 
(@Varidus, 0, 0, 0x0, 0x1, 0, '45908'),
(@Prisoner, 0, 0, 0x0, 0x1, 0, ''),
(@Getry, 0, 0, 0x0, 0x101, 0, '');

-- DB/Conditions: Fix: Correct conditions for To Bor gorok Outpost, Quickly!, Defense of Warsong Hold | by dr-j
-- DB/Conditions: Fix: Korrekte Conditions für Auf zum Außenposten Bor'gorok, schnell!, Die Verteidigung der Kriegshymnenfeste
-- http://ru.wowhead.com/quest=12486/to-borgorok-outpost-quickly
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE  `Id`=12486;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (19,20) and `SourceEntry`IN(11595,11596,11597,12486);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(20, 0, 12486, 0, 0, 8, 0, 11595, 0, 0, 0, 0, 0, '', 'To Bor gorok Outpost, Quickly! once The Defense of Warsong Hold Has been completed'),
(19, 0, 12486, 0, 0, 8, 0, 11595, 0, 0, 0, 0, 0, '', 'To Bor gorok Outpost, Quickly! once The Defense of Warsong Hold Has been completed'),
(20, 0, 12486, 0, 1, 8, 0, 11596, 0, 0, 0, 0, 0, '', 'To Bor gorok Outpost, Quickly! once The Defense of Warsong Hold Has been completed'),
(19, 0, 12486, 0, 1, 8, 0, 11596, 0, 0, 0, 0, 0, '', 'To Bor gorok Outpost, Quickly! once The Defense of Warsong Hold Has been completed'),
(20, 0, 12486, 0, 2, 8, 0, 11597, 0, 0, 0, 0, 0, '', 'To Bor gorok Outpost, Quickly! once The Defense of Warsong Hold Has been completed'),
(19, 0, 12486, 0, 2, 8, 0, 11597, 0, 0, 0, 0, 0, '', 'To Bor gorok Outpost, Quickly! once The Defense of Warsong Hold Has been completed'),
(20, 0, 11595, 0, 0, 8, 0, 7784, 0, 0, 0, 0, 0, '', 'Defense of Warsong Hold (11595) Only if player has completed The Lord of Blackrock'),
(19, 0, 11595, 0, 0, 8, 0, 7784, 0, 0, 0, 0, 0, '', 'Defense of Warsong Hold (11595) Only if player has completed The Lord of Blackrock'),
(20, 0, 11596, 0, 0, 8, 0, 7784, 0, 0, 1, 0, 0, '', 'Defense of Warsong Hold (11596) Only if player has not completed The Lord of Blackrock'),
(19, 0, 11596, 0, 0, 8, 0, 7784, 0, 0, 1, 0, 0, '', 'Defense of Warsong Hold (11596) Only if player has not completed The Lord of Blackrock'),
(20, 0, 11596, 0, 0, 8, 0, 8743, 0, 0, 1, 0, 0, '', 'Defense of Warsong Hold (11596) Only if player has not completed Bang a Gong'),
(19, 0, 11596, 0, 0, 8, 0, 8743, 0, 0, 1, 0, 0, '', 'Defense of Warsong Hold (11596) Only if player has not completed Bang a Gong'),
(20, 0, 11597, 0, 0, 8, 0, 8743, 0, 0, 0, 0, 0, '', 'Defense of Warsong Hold (11597) Only if player has completed Bang a Gong'),
(19, 0, 11597, 0, 0, 8, 0, 8743, 0, 0, 0, 0, 0, '', 'Defense of Warsong Hold (11597) Only if player has completed Bang a Gong');

-- DB/Quest: Fix: Frostmourne Cavern | by Pitcrawler
-- DB/Quest: Fix: Frostgramhöhlen
-- http://ru.wowhead.com/quest=12478/frostmourne-cavern
SET @OGUID := 7080;
SET @ARTHAS := 27455;
SET @MURADIN := 27480;
SET @THELZAN := 27851;
SET @ALTAR := 190332;
UPDATE `creature` SET `spawndist`=0,`MovementType`=0 WHERE `id`=@THELZAN;
DELETE FROM `gameobject` WHERE `map`=571 AND `id` IN (192066,192065,192064,190191,@ALTAR);
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES 
(@OGUID,192066,571,1,1,4816.637,-582.2271,163.1873,-1.240983,-0.5743933,0.2897787,-0.5093117,0.5715788,120,0,1),
(@OGUID+1,192065,571,1,1,4816.552,-581.2853,163.0618,1.043091,0.5583439,0.3292217,0.3740091,0.6633116,120,0,1),
(@OGUID+2,192064,571,1,1,4823.089,-581.7293,164.1632,2.408346,-0.3306689,-0.6249218,0.6858006,0.1726511,120,0,1),
(@OGUID+3,190191,571,1,1,4819.284,-583.5658,163.5637,1.343901,0,0,0.6225138,0.7826088,120,0,1),
(@OGUID+4,@ALTAR,571,1,1,4819.374,-583.699,163.5065,1.500983,0,0,0.6819983,0.7313538,120,0,1);
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@THELZAN;
UPDATE `creature_template` SET `InhabitType`=1, `AIName`='SmartAI' WHERE `entry` IN (@MURADIN,@ARTHAS);
DELETE FROM `event_scripts` WHERE `id`=18281;
INSERT INTO `event_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`x`,`y`,`z`,`o`) VALUES
(18281,0,10,@THELZAN,20000,4819.284,-583.5658,163.5637,1.343901);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=49825;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceEntry`=@THELZAN;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`Comment`) VALUES
(13,1,49825,0,0,31,3,@MURADIN,0,0,0, 'Arthas Calls to Spirits targets Muradin'),
(22,2,@THELZAN,0,0,29,@MURADIN,100,0,1,0, 'SAI activates only if Muradin is not around');
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` IN (@ARTHAS,@MURADIN,@THELZAN);
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid` IN (@ARTHAS*100,@MURADIN*100,@MURADIN*100+1,@THELZAN*100);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ARTHAS,0,0,0,38,0,100,0,0,10,0,0,80,@ARTHAS*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'Prince Arthas - On dataset - Run script'),
(@MURADIN,0,0,0,38,0,100,0,0,10,0,0,80,@MURADIN*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - On dataset - Run script'),
(@MURADIN,0,1,0,8,0,100,0,49825,0,0,0,80,@MURADIN*100+1,2,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - On spellhit - Run script'),
(@THELZAN,0,0,0,54,0,100,0,0,0,0,0,3,0,17200,0,0,0,0,1,0,0,0,0,0,0,0,'Thel''zan Spell Dummy - Just summoned - Run script'),
(@THELZAN,0,1,0,54,0,100,0,0,0,0,0,80,@THELZAN*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'Thel''zan Spell Dummy - Just summoned - Run script'),
(@ARTHAS*100,9,0,0,0,0,100,0,0,0,0,0,45,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Prince Arthas - Script - reset data 0'),
(@ARTHAS*100,9,1,0,0,0,100,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,4820.175,-581.226,163.6158,0,'Prince Arthas - Script - moveto'),
(@ARTHAS*100,9,2,0,0,0,100,0,8000,8000,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,'Prince Arthas - Script - say 6'),
(@ARTHAS*100,9,3,0,0,0,100,0,6000,6000,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,'Prince Arthas - Script - say 7'),
(@ARTHAS*100,9,4,0,0,0,100,0,6000,6000,0,0,11,49824,0,0,0,0,0,1,0,0,0,0,0,0,0,'Prince Arthas - Script - Spellcast Arthas Calls to Spirits'),
(@ARTHAS*100,9,5,0,0,0,100,0,10000,10000,0,0,69,0,0,0,0,0,0,8,0,0,0,4819.658,-582.5223,163.752,0,'Prince Arthas - Script - moveto'),
(@ARTHAS*100,9,6,0,0,0,100,0,0,0,0,0,71,0,7,0,0,0,0,1,0,0,0,0,0,0,0,'Prince Arthas - Script - Change weapon'),
(@ARTHAS*100,9,7,0,0,0,100,0,1000,1000,0,0,5,397,0,0,0,0,0,1,0,0,0,0,0,0,0,'Prince Arthas - Script - Emote OneShotPointNoSheathe'),
(@ARTHAS*100,9,8,0,0,0,100,0,0,0,0,0,71,0,7,33350,0,0,0,1,0,0,0,0,0,0,0,'Prince Arthas - Script - Change weapon'),
(@ARTHAS*100,9,9,0,0,0,100,0,0,0,0,0,9,0,0,0,0,0,0,20,@ALTAR,5,0,0,0,0,0,'Prince Arthas - Script - Activate Altar'),
(@ARTHAS*100,9,10,0,0,0,100,0,4000,4000,0,0,69,0,0,0,0,0,0,8,0,0,0,4814.56,-577.2604,162.2522,0,'Prince Arthas - Script - moveto'),
(@ARTHAS*100,9,11,0,0,0,100,0,3500,3500,0,0,5,15,0,0,0,0,0,1,0,0,0,0,0,0,0,'Prince Arthas - Script - Emote OneShotRoar'),
(@ARTHAS*100,9,12,0,0,0,100,0,4000,4000,0,0,53,1,@ARTHAS,0,0,0,0,1,0,0,0,0,0,0,0,'Prince Arthas - Script - Start WP movement'),
(@MURADIN*100,9,0,0,0,0,100,0,0,0,0,0,45,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - Script - reset data 0'),
(@MURADIN*100,9,1,0,0,0,100,0,500,500,0,0,69,0,0,0,0,0,0,8,0,0,0,4818.622,-582.4843,163.5883,0,'Muradin - Script - moveto'),
(@MURADIN*100,9,2,0,0,0,100,0,2000,2000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,5.305801,'Muradin - Script - turnto'),
(@MURADIN*100,9,3,0,0,0,100,0,1000,1000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - Script - say 2'),
(@MURADIN*100,9,4,0,0,0,100,0,500,500,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - Script - kneel'),
(@MURADIN*100,9,5,0,0,0,100,0,15000,15000,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - Script - stand'),
(@MURADIN*100,9,6,0,0,0,100,0,1000,1000,0,0,66,0,0,0,0,0,0,19,@ARTHAS,10,0,0,0,0,0,'Muradin - Script - turnto Prince Arthas'),
(@MURADIN*100,9,7,0,0,0,100,0,2000,2000,0,0,5,274,0,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - Script - Emote no'),
(@MURADIN*100,9,8,0,0,0,100,0,2500,2500,0,0,5,5,0,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - Script - Emote Exclamation'),
(@MURADIN*100,9,9,0,0,0,100,0,7000,7000,0,0,69,0,0,0,0,0,0,8,0,0,0,4817.42,-581.4944,163.2614,0,'Muradin - Script - moveto'),
(@MURADIN*100,9,10,0,0,0,100,0,1000,1000,0,0,66,0,0,0,0,0,0,19,@ARTHAS,10,0,0,0,0,0,'Muradin - Script - turnto Prince Arthas'),
(@MURADIN*100,9,11,0,0,0,100,0,1500,1500,0,0,1,5,0,0,0,0,0,19,@ARTHAS,10,0,0,0,0,0,'Muradin - Script - Prince Arthas say 5'),
(@MURADIN*100,9,12,0,0,0,100,0,5000,5000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - Script - say 3'),
(@MURADIN*100,9,13,0,0,0,100,0,0,0,0,0,45,0,10,0,0,0,0,19,@ARTHAS,10,0,0,0,0,0,'Muradin - Script - set data 0 10 on Prince Arthas'),
(@MURADIN*100,9,14,0,0,0,100,0,1000,1000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,5.323254,'Muradin - Script - turnto'),
(@MURADIN*100+1,9,0,0,0,0,100,0,0,0,0,0,40,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - Script - Set sheath'),
(@MURADIN*100+1,9,1,0,0,0,100,0,0,0,0,0,18,1,1,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - Script - Set unit_flag2'),
(@MURADIN*100+1,9,2,0,0,0,100,0,13000,13000,0,0,19,1,1,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - Script - Remove unit_flag2'),
(@MURADIN*100+1,9,3,0,0,0,100,0,500,500,0,0,17,64,0,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - Script - emotestate stun'),
(@MURADIN*100+1,9,4,0,0,0,100,0,5000,5000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - Script - say 4'),
(@MURADIN*100+1,9,5,0,0,0,100,0,3000,3000,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - Script - say 5'),
(@MURADIN*100+1,9,6,0,0,0,100,0,4000,4000,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - Script - emotestate none'),
(@MURADIN*100+1,9,7,0,0,0,100,0,1000,1000,0,0,11,49829,3,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - Script - Spellcast Frostmourne Cavern Quest Credit'),
(@MURADIN*100+1,9,8,0,0,0,100,0,0,0,0,0,53,1,@MURADIN,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - Script - Start WP movement'),
(@THELZAN*100,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Thel''zan Spell Dummy - Script - Say 0'),
(@THELZAN*100,9,1,0,0,0,100,0,0,0,0,0,11,33271,0,0,0,0,0,1,0,0,0,0,0,0,0,'Thel''zan Spell Dummy - Script - Spellcast Internal Shake Camera w/ rumble sound'),
(@THELZAN*100,9,2,0,0,0,100,0,7000,7000,0,0,12,@MURADIN,3,116000,0,0,0,8,0,0,0,4817.494,-579.6047,163.0956,5.102134,'Thel''zan Spell Dummy - Script - Summon Muradin'),
(@THELZAN*100,9,3,0,0,0,100,0,0,0,0,0,12,@ARTHAS,3,102000,0,0,0,8,0,0,0,4821.529,-579.8818,163.5944,4.167512,'Thel''zan Spell Dummy - Script - Summon Prince Arthas'),
(@THELZAN*100,9,4,0,0,0,100,0,0,0,0,0,9,0,0,0,0,0,0,20,@ALTAR,5,0,0,0,0,0,'Thel''zan Spell Dummy - Script - set data 0 10 on Frostmourne Altar'),
(@THELZAN*100,9,5,0,0,0,100,0,3000,3000,0,0,1,4,0,0,0,0,0,19,@ARTHAS,10,0,0,0,0,0,'Thel''zan Spell Dummy - Script - Prince Arthas Say 4'),
(@THELZAN*100,9,6,0,0,0,100,0,3000,3000,0,0,5,25,0,0,0,0,0,19,@ARTHAS,10,0,0,0,0,0,'Thel''zan Spell Dummy - Script - Prince Arthas Emote Point'),
(@THELZAN*100,9,7,0,0,0,100,0,3500,3500,0,0,45,0,10,0,0,0,0,19,@MURADIN,10,0,0,0,0,0,'Thel''zan Spell Dummy - Script - Set data 0 10 on Muradin');
DELETE FROM `waypoints` WHERE `entry` IN (@ARTHAS,@MURADIN);
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@ARTHAS,1,4793.066,-571.0735,160.8400, 'Prince Arthas'),
(@ARTHAS,2,4772.816,-566.8235,162.2605, 'Prince Arthas'),
(@ARTHAS,3,4759.816,-568.5735,164.2808, 'Prince Arthas'),
(@ARTHAS,4,4743.573,-564.3865,166.2362, 'Prince Arthas'),
(@MURADIN,1,4797.722,-576.3405,160.1779, 'Muradin'),
(@MURADIN,2,4770.222,-575.5905,162.9453, 'Muradin'),
(@MURADIN,3,4757.972,-575.0905,164.5265, 'Muradin'),
(@MURADIN,4,4753.972,-572.8405,165.1388, 'Muradin'),
(@MURADIN,5,4749.972,-569.5905,165.7607, 'Muradin'),
(@MURADIN,6,4748.024,-566.1866,165.7932, 'Muradin');
DELETE FROM `creature_text` WHERE `entry` IN (@ARTHAS,@MURADIN,@THELZAN);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ARTHAS,0,0, 'Captain, why are the guards not at their posts?',12,0,100,6,0,12725, 'Prince Arthas'),
(@ARTHAS,1,0, 'Uther had my troops recalled? Damn it! If my warriors abandon me, I''ll never defeat Mal''Ganis. The ships must be burned before the men reach the shore!',12,0,100,5,0,12726, 'Prince Arthas'),
(@ARTHAS,2,0, 'Burned down to their frames! No one goes home until our job here is done!',12,0,100,15,0,12727, 'Prince Arthas'),
(@ARTHAS,3,0, 'Spare me, Muradin. You weren''t there to see what Mal''Ganis did to my homeland.',12,0,100,1,0,12728, 'Prince Arthas'),
(@ARTHAS,4,0, 'Behold, Muradin, our salvation, Frostmourne.',12,0,100,1,0,12729, 'Prince Arthas'),
(@ARTHAS,5,0, 'I would gladly bear any curse to save my homeland.',12,0,100,1,0,12730, 'Prince Arthas'),
(@ARTHAS,6,0, 'Damn the men! Nothing shall prevent me from having my revenge, old friend. Not even you.',12,0,100,5,0,12731, 'Prince Arthas'),
(@ARTHAS,7,0, 'Now, I call out to the spirits of this place. I will give anything or pay any price, if only you will help me save my people.',12,0,100,396,0,12732, 'Prince Arthas'),
(@MURADIN,0,0, 'Isn''t that a bit much, lad?',12,0,100,6,0,12733, 'Muradin'),
(@MURADIN,1,0, 'You lied to your men and betrayed the mercenaries who fought for you. What''s happening to you, Arthas? Is vengeance all that''s important to you?',12,0,100,1,0,12734, 'Muradin'),
(@MURADIN,2,0, 'Hold, lad. There''s an inscription on the dais. It''s a warning. It says, "Whomsoever takes up this blade shall wield power eternal. Just as the blade rends flesh, so must power scar the spirit." Oh, I should''ve known. The blade is cursed! Let''s get the hell out of here!',12,0,100,0,0,12735, 'Muradin'),
(@MURADIN,3,0, 'Leave it be, Arthas. Forget this business and lead your men home.',12,0,100,396,0,12736, 'Muradin'),
(@MURADIN,4,0, 'O'' my head... Wh... Where am I?',12,0,100,0,0,0, 'Muradin'),
(@MURADIN,5,0, 'Who... Who am I?',12,0,100,0,0,0, 'Muradin'),
(@THELZAN,0,0, 'The walls of Frostmourne Cavern shudder and shake.',41,0,100,0,0,0, 'Thel''zan Spell Dummy');
