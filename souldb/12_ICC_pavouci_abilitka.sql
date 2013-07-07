UPDATE  creature_template SET  AIName= 'SmartAI' WHERE  entry IN (37228,37229,37501,37502,38197,38198,38134,38137,37232,38362);
DELETE FROM smart_scripts WHERE entryorguid IN (37228,37229,37501,37502,38197,38198,38134,38137,37232,38362);
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
(37232,0,0,0,54,0,100,0,0,0,0,0,38,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Nerub''ar Broodling - Set Combat With Zone'),
(37232,0,1,0,1,0,100,0,5000,5000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Nerub''ar Broodling - Despawn OOC'),
(38362,0,0,0,54,0,100,0,0,0,0,0,38,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Nerub''ar Broodling[25] - Set Combat With Zone'),
(38362,0,1,0,1,0,100,0,5000,5000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Nerub''ar Broodling[25] - Despawn OOC'),
(37501,0,0,0,54,0,100,0,0,0,0,0,38,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Nerub''ar Champion - Set Combat With Zone'),
(37501,0,1,0,1,0,100,0,5000,5000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Nerub''ar Champion - Despawn OOC'),
(37501,0,2,0,9,0,100,0,8,25,0,0,11,71801,1,0,0,0,0,2,0,0,0,0,0,0,0,'Nerub''ar Champion - Cast Rush'),
(37501,0,3,0,6,0,100,0,0,0,0,0,11,71203,3,0,0,0,0,16,0,0,0,0,0,0,0,'Nerub''ar Champion - on death - cast Soul Feast'),
(38197,0,0,0,54,0,100,0,0,0,0,0,38,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Nerub''ar Champion[25] - Set Combat With Zone'),
(38197,0,1,0,1,0,100,0,5000,5000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Nerub''ar Champion[25] - Despawn OOC'),
(38197,0,2,0,9,0,100,0,8,25,0,0,11,71801,1,0,0,0,0,2,0,0,0,0,0,0,0,'Nerub''ar Champion[25] - Cast Rush'),
(38197,0,3,0,6,0,100,0,0,0,0,0,11,71203,3,0,0,0,0,16,0,0,0,0,0,0,0,'Nerub''ar Champion[25] - on death - Cast Soul Feast'),
(37502,0,0,0,54,0,100,0,0,0,0,0,38,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Nerub''ar Webweaver - Set Combat With Zone'),
(37502,0,1,0,1,0,100,0,5000,5000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Nerub''ar Webweaver - Despawn OOC'),
(37502,0,2,0,0,0,100,0,3000,3000,40000,40000,11,71327,1,0,0,0,0,2,0,0,0,0,0,0,0,'Nerub''ar Webweaver - Cast Web'),
(37502,0,3,0,0,0,100,0,2000,2000,3000,3000,11,71326,0,0,0,0,0,5,0,0,0,0,0,0,0,'Nerub''ar Webweaver - Cast Crypt Scarabs'),
(37502,0,4,0,6,0,100,0,0,0,0,0,11,71203,3,0,0,0,0,16,0,0,0,0,0,0,0,'Nerub''ar Webweaver - on death - Cast Soul Feast'),
(38198,0,0,0,54,0,100,0,0,0,0,0,38,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Nerub''ar Webweaver[25] - Set Combat With Zone'),
(38198,0,1,0,1,0,100,0,5000,5000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Nerub''ar Webweaver[25] - Despawn OOC'),
(38198,0,2,0,0,0,100,0,3000,3000,40000,40000,11,71327,1,0,0,0,0,2,0,0,0,0,0,0,0,'Nerub''ar Webweaver[25] - Cast Web'),
(38198,0,3,0,0,0,100,0,2000,2000,3000,3000,11,71326,0,0,0,0,0,5,0,0,0,0,0,0,0,'Nerub''ar Webweaver[25] - Cast Crypt Scarabs'),
(38198,0,4,0,6,0,100,0,0,0,0,0,11,71203,3,0,0,0,0,16,0,0,0,0,0,0,0,'Nerub''ar Webweaver[25] - on death - Cast Soul Feast'),
(37228,0,0,0,54,0,100,0,0,0,0,0,38,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Frostwarden Warrior - Set Combat With Zone'),
(37228,0,1,0,1,0,100,0,5000,5000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Frostwarden Warrior - Despawn OOC'),
(37228,0,3,0,9,0,100,0,0,5,4000,6000,11,71316,0,0,0,0,0,18,5,0,0,0,0,0,0,'Frostwarden Warrior - Cast Glacial Strike'),
(37228,0,4,0,6,0,100,0,0,0,0,0,11,71203,3,0,0,0,0,16,0,0,0,0,0,0,0,'Frostwarden Warrior - on death - Cast Soul Feast'),
(37229,0,0,0,54,0,100,0,0,0,0,0,38,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Frostwarden Sorceress - Set Combat With Zone'),
(37229,0,1,0,1,0,100,0,5000,5000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Frostwarden Sorceress - Despawn OOC'),
(37229,0,2,0,0,0,100,0,7000,15000,25000,25000,11,71320,1,0,0,0,0,2,0,0,0,0,0,0,0,'Frostwarden Sorceress - Cast Frost Nova'),
(37229,0,3,0,0,0,100,0,2000,2000,3000,3000,11,71318,0,0,0,0,0,5,0,0,0,0,0,0,0,'Frostwarden Sorceress - Cast Frostbolt'),
(37229,0,4,0,6,0,100,0,0,0,0,0,11,71203,3,0,0,0,0,16,0,0,0,0,0,0,0,'Frostwarden Sorceress - on death - Cast Soul Feast'),
(38134,0,0,0,54,0,100,0,0,0,0,0,38,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Frostwarden Warrior[25] - Set Combat With Zone'),
(38134,0,1,0,1,0,100,0,5000,5000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Frostwarden Warrior[25] - Despawn OOC'),
(38134,0,3,0,9,0,100,0,0,5,4000,6000,11,71316,0,0,0,0,0,18,5,0,0,0,0,0,0,'Frostwarden Warrior[25] - Cast Glacial Strike'),
(38134,0,4,0,6,0,100,0,0,0,0,0,11,71203,3,0,0,0,0,16,0,0,0,0,0,0,0,'Frostwarden Warrior[25] - on death - Cast Soul Feast'),
(38137,0,0,0,54,0,100,0,0,0,0,0,38,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Frostwarden Sorceress[25] - Set Combat With Zone'),
(38137,0,1,0,1,0,100,0,5000,5000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Frostwarden Sorceress[25] - Despawn OOC'),
(38137,0,2,0,0,0,100,0,7000,15000,25000,25000,11,71320,0,0,0,0,0,2,0,0,0,0,0,0,0,'Frostwarden Sorceress[25] - Cast Frost Nova'),
(38137,0,3,0,0,0,100,0,2000,2000,3000,3000,11,71318,0,0,0,0,0,5,0,0,0,0,0,0,0,'Frostwarden Sorceress[25] - Cast Frostbolt'),
(38137,0,4,0,0,0,100,0,8000,15000,15000,22000,11,71330,1,0,0,0,0,5,0,0,0,0,0,0,0,'Frostwarden Sorceress[25] - Cast Ice Tomb'),
(38137,0,5,0,6,0,100,0,0,0,0,0,11,71203,3,0,0,0,0,16,0,0,0,0,0,0,0,'Frostwarden Sorceress[25] - on death - Cast Soul Feast');

UPDATE  creature_template SET  difficulty_entry_3 = 38197 WHERE entry=37501;
UPDATE  creature_template SET  difficulty_entry_3 = 38198 WHERE entry=37502;
UPDATE  creature_template SET  difficulty_entry_3 = 38362 WHERE entry=37232;
UPDATE  creature_template SET  faction_A=16,
faction_H=16 WHERE entry=38362;
UPDATE  creature_template SET  difficulty_entry_1 = 38134,
difficulty_entry_3 = 38134,
minlevel= 80,
maxlevel= 80,
faction_A= 16,
faction_H= 16,
mindmg= 500,
maxdmg= 1000,
attackpower= 2000,
dmg_multiplier= 10,
baseattacktime= 2000 WHERE  entry=37228;
UPDATE  creature_template SET  minlevel= 80,
maxlevel= 80,
faction_A= 16,
faction_H= 16,
mindmg= 500,
maxdmg= 1000,
attackpower= 2000,
dmg_multiplier= 10,
baseattacktime= 2000,
Health_mod= 190 WHERE  entry=38134;
UPDATE  creature_template SET  difficulty_entry_1 = 38137,
difficulty_entry_3 = 38137,
minlevel= 80,
maxlevel= 80,
faction_A= 16,
faction_H= 16,
mindmg= 500,
maxdmg= 1000,
attackpower= 2000,
dmg_multiplier= 7,
baseattacktime= 2000,
unit_class= 8,
Mana_mod=2 WHERE  entry=37229;
UPDATE  creature_template SET  minlevel= 80,
maxlevel= 80,
faction_A= 16,
faction_H= 16,
mindmg= 500,
maxdmg= 1000,
attackpower= 2000,
dmg_multiplier= 7,
baseattacktime= 2000,
unit_class= 8,
Health_mod= 243,
Mana_mod= 2 WHERE  entry=38137;

DELETE FROM creature_equip_template WHERE entry IN (37228,37229,37531);
INSERT INTO creature_equip_template (entry,id,itemEntry1,itemEntry2,itemEntry3) VALUES
(37228,1,49681,0,0), -- Frostwarden Warrior
(37229,1,34816,0,0), -- Frostwarden Sorceress
(37531,1,33276,0,0); -- Frostwarden Handler
DELETE FROM spell_script_names WHERE spell_id IN (71316,71317);
INSERT INTO spell_script_names (spell_id,ScriptName) VALUES 
(71316,'spell_trash_mob_glacial_strike'),
(71317,'spell_trash_mob_glacial_strike');
DELETE FROM spelldifficulty_dbc WHERE id=71330;
INSERT INTO spelldifficulty_dbc (id,spellid0,spellid1,spellid2,spellid3) VALUES 
(71330,0,71331,0,0);