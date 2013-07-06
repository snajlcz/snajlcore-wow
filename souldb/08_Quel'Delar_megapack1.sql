-- after last quest events

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` in (30115,33817,30116);
DELETE FROM smart_scripts WHERE entryorguid in (30115,33817,30116,3011500,3381700,3381701,3381702,3011600,3011601);
INSERT INTO smart_scripts VALUES
(30115,0,0,0,20,0,100,0,24796,0,0,0,80,3011500,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Quest - Call Timer ActionList"),
(3011500,9,0,0,0,0,100,0,2000,2000,2000,2000,1,0,0,0,0,0,0,19,30115,15,0,0,0,0,0,'Say 1'),
(30116,0,0,0,20,0,100,0,24800,0,0,0,80,3011600,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Quest - Call Timer ActionList"),
(3011600,9,0,0,0,0,100,0,2000,2000,2000,2000,1,0,0,0,0,0,0,19,30116,15,0,0,0,0,0,'Say 1'),
(30116,0,1,0,20,0,100,0,24801,0,0,0,80,3011601,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Quest - Call Timer ActionList"),
(3011601,9,0,0,0,0,100,0,2000,2000,2000,2000,1,0,0,0,0,0,0,19,30116,15,0,0,0,0,0,'Say 1'),
(33817,0,0,0,20,0,100,0,24795,0,0,0,80,3381700,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Quest - Call Timer ActionList"),
(3381700,9,0,0,0,0,100,0,2000,2000,2000,2000,1,0,0,0,0,0,0,19,33817,15,0,0,0,0,0,'Say 1'),
(33817,0,1,0,20,0,100,0,24799,0,0,0,80,3381701,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Quest - Call Timer ActionList"),
(3381701,9,0,0,0,0,100,0,2000,2000,2000,2000,1,1,0,0,0,0,0,19,33817,15,0,0,0,0,0,'Say 1'),
(33817,0,2,0,20,0,100,0,24798,0,0,0,80,3381702,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Quest - Call Timer ActionList"),
(3381702,9,0,0,0,0,100,0,2000,2000,2000,2000,1,1,0,0,0,0,0,19,33817,15,0,0,0,0,0,'Say 1');


DELETE FROM creature_text WHERE entry in (30115,33817,30116);
INSERT INTO `creature_text`(`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(30115,0,0,"This is a great day for all who oppose the Lich King! Brave $N has taken up the ancient blade, Quel'Delar, in the name of the Silver Covenant!",14,0,100,1,0,0,"Vereesa Windrunner"),
(33817,0,0,"Crusaders and combatants, a true hero stands before you this day! $N, of the Silver Covenant, has restored the ancient blade of Quel'Delar as a symbol of our resolve to defeat the Lich King!",14,0,100,1,0,0,"Justicar Mariel Trueheart"),
(30116,0,0,"As the leader of the Sunreavers, it is with great pride that I present $N as the new bearer of Quel'Delar!",14,0,100,1,0,0,"Archmage Aethas Sunreaver"),
(33817,1,0,"Crusaders and combatants, a true hero stands before you this day! $N, of the Sunreavers, has restored the ancient blade of Quel'Delar as a symbol of our resolve to defeat the Lich King!",14,0,100,1,0,0,"Justicar Mariel Trueheart");


-- correct quest lines for "Quel'Delar"

UPDATE quest_template SET RequiredClasses = 1104 WHERE id = 24595;
UPDATE quest_template SET RequiredClasses = 431 WHERE id = 24553;

UPDATE quest_template SET RequiredClasses = 16, RequiredRaces = 512 WHERE id = 24596;
UPDATE quest_template SET RequiredClasses = 430, RequiredRaces = 512 WHERE id = 24594;
UPDATE quest_template SET RequiredClasses = 1104, RequiredRaces = 178 WHERE id = 24598;
UPDATE quest_template SET RequiredClasses = 431, RequiredRaces = 178 WHERE id = 24564;

UPDATE `quest_template` SET `PrevQuestId` = 24454 WHERE `id` = 24461;
UPDATE `quest_template` SET `PrevQuestId` = 24558 WHERE `id` = 24559;
UPDATE `quest_template` SET `NextQuestIdChain` = 24557 WHERE `id` = 24555;
UPDATE `quest_template` SET `PrevQuestId` = 24535 WHERE `id` IN (24553, 24595);
UPDATE `quest_template` SET `PrevQuestId` = 24563 WHERE `id` IN (24596, 24598, 24564, 24594);