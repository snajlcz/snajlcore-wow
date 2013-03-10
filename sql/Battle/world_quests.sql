set names utf8;

-- nagrand_arena_last_boss_quest
--UPDATE `quest_template` SET `RequiredNpcOrGo1` = '18069',`RequiredNpcOrGoCount1` = '1' WHERE `Id` =9977;
--UPDATE `quest_template` SET `SpecialFlags` = '0' WHERE `Id` =9977;
--UPDATE `quest_template` SET `RequiredNpcOrGo1`='18069' WHERE `Id`=9977; 
--UPDATE `quest_template` SET `RequiredNpcOrGoCount1`='1' WHERE `Id`=9977;
--UPDATE `quest_template` SET `SpecialFlags`=0 WHERE `Id`=9977;
---UPDATE `quest_template` SET `RequiredNpcOrGo1`='30022' WHERE `Id`=12948; 
---UPDATE `quest_template` SET `SpecialFlags`=0 WHERE `Id`=12948;

-- fix  quests 4921 "Пропавшая без вести"
UPDATE `creature_template` SET `npcflag` = 3 WHERE `entry` = 10668;

-- fix quests 6001,6002 Druid
UPDATE `quest_template` SET `RequiredNpcOrGo1`='12138' WHERE `Id`=6001; 
UPDATE `quest_template` SET `RequiredNpcOrGoCount1`='1' WHERE `Id`=6001;
UPDATE `quest_template` SET `SpecialFlags`=0 WHERE `Id`=6001;
UPDATE `quest_template` SET `RequiredNpcOrGo1`='12138' WHERE `Id`=6002; 
UPDATE `quest_template` SET `RequiredNpcOrGoCount1`='1' WHERE `Id`=6002;
UPDATE `quest_template` SET `SpecialFlags`=0 WHERE `Id`=6002;