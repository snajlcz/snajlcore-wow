-- It's All Fun and Games
UPDATE  creature_template SET  InhabitType=4 WHERE  entry IN (29747, 29790);

-- The Sum is Greater than the Parts
SET @QUEST                := 13043; -- The quest...Duh!
SET @NPC_NERGELD          := 30403; -- Nergeld
SET @NPC_DR_TERRIBLE      := 30404; -- Dr. Terrible
SET @NPC_HOUND            := 30432; -- Grimmr Hound
SET @NPC_ASSAILANT        := 30471; -- Vargul Assailant
SET @AURA_ROOT            := 59037; -- The Sum is Greater than the Parts: Nergeld's Freeze Anim
SET @SPELL_DEATH_SIGNAL   := 32067; -- The Sum is Greater than the Parts: Dr. Terrible's Death Signal
SET @SPELL_MOUNT          := 56699; -- Controlling Nergeld

-- Remove random movement from Nergeld
UPDATE creature SET spawndist=0,MovementType=0 WHERE guid=124127;
DELETE FROM creature_addon WHERE guid=124127;

UPDATE creature_model_info SET combat_reach=4.05 WHERE modelid=27102;

UPDATE creature_template SET AIName='SmartAI',spell1=56746,spell2=56748,spell3=56747,spell4=60540,speed_run=0.992062866687775,VehicleId=236,unit_flags=256|32768/*256|512|32768*/,npcflag=0x1000000 WHERE entry=@NPC_NERGELD;
UPDATE creature_template SET faction_A=974,faction_H=974,unit_flags=32768,AIName='SmartAI' WHERE entry=@NPC_HOUND;
UPDATE creature_template SET faction_A=2116,faction_H=2116,unit_flags=32768,AIName='SmartAI' WHERE entry=@NPC_ASSAILANT;
UPDATE creature_template SET faction_A=974,faction_H=974,unit_flags=32832,AIName='SmartAI' WHERE entry=@NPC_DR_TERRIBLE;

DELETE FROM creature_template_addon WHERE entry=@NPC_NERGELD;
INSERT INTO creature_template_addon (entry,mount,bytes1,bytes2,auras) VALUES
(@NPC_NERGELD,0,0x0,0x1,''); -- 59037 The Sum is Greater than the Parts: Nergeld's Freeze Anim

DELETE FROM conditions WHERE (SourceTypeOrReferenceId=16 AND SourceEntry=@NPC_NERGELD) OR (SourceTypeOrReferenceId=13 AND SourceEntry=56747) OR (SourceTypeOrReferenceId=13 AND SourceEntry=56746) OR (SourceTypeOrReferenceId=18 AND SourceEntry=@SPELL_MOUNT) OR(SourceTypeOrReferenceId=13 AND SourceEntry=@SPELL_DEATH_SIGNAL);
INSERT INTO conditions (SourceTypeOrReferenceId,SourceGroup,SourceEntry,SourceId,ElseGroup,ConditionTypeOrReference,ConditionTarget,ConditionValue1,ConditionValue2,ConditionValue3,NegativeCondition,ErrorType,ErrorTextId,ScriptName,Comment) VALUES
(16,0,@NPC_NERGELD,0,0,23,0,4595,0,0,0,0,0,'','Dismount player when not in intended zone'),
(13,1,56747,0,0,31,0,3,@NPC_ASSAILANT,0,0,0,0,'','Stomp can target Vargul Assailant'),
(13,1,56747,0,1,31,0,3,@NPC_HOUND,0,0,0,0,'','Stomp can target Grimmr Hound'),
(13,1,56747,0,2,31,0,3,@NPC_DR_TERRIBLE,0,0,0,0,'','Stomp can target Dr. Terrible'),
(13,1,56746,0,0,31,0,3,@NPC_ASSAILANT,0,0,0,0,'','Punch can target Vargul Assailant'),
(13,1,56746,0,1,31,0,3,@NPC_HOUND,0,0,0,0,'','Punch can target Grimmr Hound'),
(13,1,56746,0,2,31,0,3,@NPC_DR_TERRIBLE,0,0,0,0,'','Punch can target Dr. Terrible'),
(18,@NPC_NERGELD,@SPELL_MOUNT,0,0,28,0,@QUEST,0,0,1,0,0,'','Spellclick when quest not complete'),
(18,@NPC_NERGELD,@SPELL_MOUNT,0,0,9,0,@QUEST,0,0,0,0,0,'','Spellclick when quest taken'),
(13,2,@SPELL_DEATH_SIGNAL,0,1,31,0,3,@NPC_DR_TERRIBLE,0,0,0,0,'','Dr. Terrible''s Death Signal effect1 targets Dr. Terrible'),
(13,1,@SPELL_DEATH_SIGNAL,0,1,31,0,3,@NPC_NERGELD,0,0,0,0,'','Dr. Terrible''s Death Signal effect0 targets Nergeld');



DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid IN (@NPC_NERGELD,@NPC_DR_TERRIBLE,@NPC_HOUND,@NPC_ASSAILANT) OR (source_type=9 AND entryorguid=@NPC_NERGELD*100);
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
-- Nergeld
(@NPC_NERGELD,0,0,0,28,0,100,0,0,0,0,0,75,@AURA_ROOT,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Passenger Removed - add root aura'),
(@NPC_NERGELD,0,1,2,27,0,100,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Passenger Removed - add root script'),
(@NPC_NERGELD,0,2,3,61,0,100,0,0,0,0,0,28,@AURA_ROOT,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Passenger Boarded - remove root aura'),
(@NPC_NERGELD,0,3,4,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Passenger Boarded - Talk'),
(@NPC_NERGELD,0,4,0,61,0,100,0,0,0,0,0,80,@NPC_NERGELD*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'On Passenger Boarded - Run SCript'),
(@NPC_NERGELD,0,5,6,8,0,100,0,@SPELL_DEATH_SIGNAL,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Spellhit - Say'),
(@NPC_NERGELD,0,6,0,61,0,100,0,0,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Spellhit - Die'),
-- Wave 1 05:22:46.000
(@NPC_NERGELD*100,9,0,0,0,0,100,0,5000,5000,0,0,12,@NPC_ASSAILANT,2,300000,0,0,0,8,0,0,0,7993.895,3336.905,632.3955,0.1457695,'On Script - Spawn Vargul'),
(@NPC_NERGELD*100,9,1,0,0,0,100,0,0,0,0,0,12,@NPC_ASSAILANT,2,300000,0,0,0,8,0,0,0,8003.723,3323.562,632.3955,0.6487832,'On Script - Spawn Vargul'),
(@NPC_NERGELD*100,9,2,0,0,0,100,0,0,0,0,0,12,@NPC_ASSAILANT,2,300000,0,0,0,8,0,0,0,8026.945,3307.581,632.3955,1.482069,'On Script - Spawn Vargul'),
(@NPC_NERGELD*100,9,3,0,0,0,100,0,0,0,0,0,12,@NPC_ASSAILANT,2,300000,0,0,0,8,0,0,0,8001.774,3306.377,632.3955,0.8634474,'On Script - Spawn Vargul'),
(@NPC_NERGELD*100,9,4,0,0,0,100,0,0,0,0,0,12,@NPC_ASSAILANT,2,300000,0,0,0,8,0,0,0,7987.904,3308.895,632.3955,0.6805801,'On Script - Spawn Vargul'),
(@NPC_NERGELD*100,9,5,0,0,0,100,0,0,0,0,0,12,@NPC_ASSAILANT,2,300000,0,0,0,8,0,0,0,8016.516,3318.92,632.3956,0.940311,'On Script - Spawn Vargul'),
-- Wave 2 05:23:06.000
(@NPC_NERGELD*100,9,6,0,0,0,100,0,30000,30000,0,0,12,@NPC_HOUND,2,300000,0,0,0,8,0,0,0,7996.656,3308.777,632.3955,0.7732307,'On Script - Spawn Grimmr Hound'),
(@NPC_NERGELD*100,9,7,0,0,0,100,0,0,0,0,0,12,@NPC_HOUND,2,300000,0,0,0,8,0,0,0,8011.714,3315.362,632.3955,0.9011694,'On Script - Spawn Grimmr Hound'),
(@NPC_NERGELD*100,9,8,0,0,0,100,0,0,0,0,0,12,@NPC_ASSAILANT,2,300000,0,0,0,8,0,0,0,8000.665,3317.225,632.3955,0.7105912,'On Script - Spawn Vargul'),
(@NPC_NERGELD*100,9,9,0,0,0,100,0,0,0,0,0,12,@NPC_ASSAILANT,2,300000,0,0,0,8,0,0,0,8025.243,3313.552,632.3955,1.286934,'On Script - Spawn Vargul'),
(@NPC_NERGELD*100,9,10,0,0,0,100,0,0,0,0,0,12,@NPC_ASSAILANT,2,300000,0,0,0,8,0,0,0,8007.712,3337.127,632.3955,0.4072851,'On Script - Spawn Vargul'),
(@NPC_NERGELD*100,9,11,0,0,0,100,0,0,0,0,0,12,@NPC_ASSAILANT,2,300000,0,0,0,8,0,0,0,8009.925,3319.814,632.3955,0.8048422,'On Script - Spawn Vargul'),
-- Wave 3 05:23:26.000
(@NPC_NERGELD*100,9,12,0,0,0,100,0,30000,30000,0,0,12,@NPC_HOUND,2,300000,0,0,0,8,0,0,0,8021.793,3312.446,632.3955,1.130859,'On Script - Spawn Grimmr Hound'),
(@NPC_NERGELD*100,9,13,0,0,0,100,0,0,0,0,0,12,@NPC_HOUND,2,300000,0,0,0,8,0,0,0,8001.362,3332.711,632.3955,0.4433513,'On Script - Spawn Grimmr Hound'),
(@NPC_NERGELD*100,9,14,0,0,0,100,0,0,0,0,0,12,@NPC_HOUND,2,300000,0,0,0,8,0,0,0,7999.219,3302.518,632.3955,0.8723419,'On Script - Spawn Grimmr Hound'),
(@NPC_NERGELD*100,9,15,0,0,0,100,0,0,0,0,0,12,@NPC_ASSAILANT,2,300000,0,0,0,8,0,0,0,8000.495,3345.769,632.3955,5.823889,'On Script - Spawn Vargul'),
(@NPC_NERGELD*100,9,16,0,0,0,100,0,0,0,0,0,12,@NPC_ASSAILANT,2,300000,0,0,0,8,0,0,0,8001.774,3311.945,632.3955,0.797157,'On Script - Spawn Vargul'),
(@NPC_NERGELD*100,9,17,0,0,0,100,0,0,0,0,0,12,@NPC_ASSAILANT,2,300000,0,0,0,8,0,0,0,8012.214,3325.824,632.3955,0.7376673,'On Script - Spawn Vargul'),
-- Wave 4 05:23:47.000
(@NPC_NERGELD*100,9,18,0,0,0,100,0,31000,31000,0,0,12,@NPC_DR_TERRIBLE,2,300000,0,1,0,8,0,0,0,7985.901,3296.679,632.4788,0.8377581,'On Script - Spawn Dr. Terrible'),
(@NPC_NERGELD*100,9,19,0,0,0,100,0,0,0,0,0,12,@NPC_HOUND,2,300000,0,0,0,8,0,0,0,7982.587,3301.807,632.4788,0.6981317,'On Script - Spawn Grimmr Hound'),
(@NPC_NERGELD*100,9,20,0,0,0,100,0,0,0,0,0,12,@NPC_HOUND,2,300000,0,0,0,8,0,0,0,7991.366,3293.512,632.4788,0.9075712,'On Script - Spawn Grimmr Hound'),
-- Dr. Terrible
(@NPC_DR_TERRIBLE,0,0,1,54,0,100,0,0,0,0,0,49,0,0,0,0,0,0,11,@NPC_NERGELD,50,0,0,0,0,0,'On spawn attack npc'),
(@NPC_DR_TERRIBLE,0,1,0,61,0,100,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,8039.959,3351.04,632.395,0,'On spawn go to npc'),
(@NPC_DR_TERRIBLE,0,2,0,4,0,100,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Say on Aggro'),
(@NPC_DR_TERRIBLE,0,3,0,0,0,100,0,8000,8000,15000,19000,11,61143,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Crazed Chop'),
(@NPC_DR_TERRIBLE,0,4,0,0,0,100,0,10000,12000,28000,33000,11,61146,0,0,0,0,0,5,0,0,0,0,0,0,0,'Cast Slime Stream'),
(@NPC_DR_TERRIBLE,0,5,6,2,0,100,1,0,45,0,0,11,31730,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Heal at 45% HP'),
(@NPC_DR_TERRIBLE,0,6,0,61,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Say Text'),
(@NPC_DR_TERRIBLE,0,7,8,6,0,100,1,0,0,0,0,11,@SPELL_DEATH_SIGNAL,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast on Death'),
(@NPC_DR_TERRIBLE,0,8,0,61,0,100,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Say on Death'),
-- Grimmr Hound
(@NPC_HOUND,0,0,1,54,0,100,0,0,0,0,0,49,0,0,0,0,0,0,11,@NPC_NERGELD,50,0,0,0,0,0,'On spawn attack npc'),
(@NPC_HOUND,0,1,0,61,0,100,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,8039.959,3351.04,632.395,0,'On spawn go to npc'),
(@NPC_HOUND,0,2,0,8,0,100,0,@SPELL_DEATH_SIGNAL,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Spellhit Despawn'),
-- Vargul Assailant
(@NPC_ASSAILANT,0,0,1,54,0,100,0,0,0,0,0,49,0,0,0,0,0,0,11,@NPC_NERGELD,50,0,0,0,0,0,'On spawn attack npc'),
(@NPC_ASSAILANT,0,1,0,61,0,100,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,8039.959,3351.04,632.395,0,'On spawn go to npc'),
(@NPC_ASSAILANT,0,2,0,8,0,100,0,@SPELL_DEATH_SIGNAL,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Spellhit Despawn'),
(@NPC_ASSAILANT,0,3,0,0,0,100,0,4500,5599,13400,15600,11,43410,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Chop'),
(@NPC_ASSAILANT,0,4,0,0,0,100,0,8000,9000,35000,37000,11,23262,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Demoralize');


-- NPC talk text insert
DELETE FROM creature_text WHERE entry IN (@NPC_DR_TERRIBLE,@NPC_NERGELD);
INSERT INTO creature_text (entry,groupid,id,text,type,language,probability,emote,duration,sound,comment) VALUES
(@NPC_DR_TERRIBLE,0,0,'WHO DARES?! I AM GOING TO FLAY THE FLESH FROM YOUR BONES EVEN IF I HAVE TO DESTROY NERGELD TO GET TO YOU!',14,0,100,0,0,0,'Dr. Terrible'),
(@NPC_DR_TERRIBLE,1,0,'Now the nightmare''s real.Now Dr. Terrible is here.To make you quake with fear.To make the whole world kneel.And I won''t feel ...a thing',12,0,100,0,0,0,'Dr. Terrible'),
(@NPC_DR_TERRIBLE,2,0,'I''LL RISE AGAIN AND WHEN I DO I WILL HAVE MY REVENGE!.',14,0,100,0,0,0,'Dr. Terrible to Nergeld'),
(@NPC_NERGELD,0,0,'As you jump into Nergeld,the rotting flesh of the construct comes to life.',16,0,100,0,0,0,'Nergeld'),
(@NPC_NERGELD,1,0,'%s falls to pieces.',16,0,100,0,0,0,'Nergeld to Dr. Terrible');

-- The Art of Being a Water Terror (hacked)
UPDATE  creature_template SET  unit_flags=16809996 WHERE  entry=30645;
UPDATE  smart_scripts SET  action_param1=2 WHERE entryorguid=30645 AND source_type=0 AND id=0 AND link=1;

-- Find the Ancient Hero
UPDATE  creature_template SET  speed_run=2 WHERE  entry=30886;

-- Banshee's Revenge (hacked)
UPDATE  creature_template SET  faction_A=16,
faction_H=16 WHERE  entry=31016;
DELETE FROM event_scripts WHERE id=20108;
INSERT INTO event_scripts (id,delay,command,datalong,datalong2,dataint,x,y,z,o) VALUES
(20108,0,10,31016,500000,0,7088.22,4380.14,872.267,4.36759);

-- Battle for Valhalas (hacked)
SET @NPC_GEIRRVIF := 31135;
SET @QUEST_FALLENHEROES := 13214;
SET @NPC_ELDRETH_13214 := 31195; 
SET @NPC_GENESS_13214 := 31193; 
SET @NPC_JHADRAS_13214 := 31191;
SET @NPC_MASUD_13214 := 31192;
SET @NPC_RITH_13214 := 31196;
SET @NPC_TALLA_13214 := 31194;
SET @NPC_KILLTRIG_13214 := 820011;
SET @QUEST_KDARKMASTER := 13215;
SET @NPC_FAKEKHITRIX_13215 := 900060;
SET @NPC_KHITRIX_13215 := 31222; 
SET @NPC_BONESPIDER_13215 := 32484; 
SET @QUEST_SIGRIDICEBORN := 13216;
SET @NPC_FAKESIGRID_13216 := 900061;
SET @NPC_SIGRID_13216 := 31242; 
SET @QUEST_CARNAGE := 13217;
SET @NPC_FAKECARNAGE_13217 := 900062; 
SET @NPC_CARNAGE_13217 := 31271; 
SET @QUEST_THANE := 13218;
SET @NPC_FAKETHANE_13218 := 900063; 
SET @NPC_THANE_13218 := 31277; 
SET @QUEST_FINCHAL := 13219;
SET @NPC_FAKEPRINCSAND_13219 := 900064; 
SET @NPC_PRINCSAND_13219 := 14688;
SET @KILL_13214 := 20;
SET @WIPE_13214 := 19;
SET @CREDIT_13214 := 1;
SET @CREDIT_13215 := 2;
SET @CREDIT_13216 := 3;
SET @CREDIT_13217 := 4;
SET @CREDIT_13218 := 5;
SET @CREDIT_13219 := 6;
SET @DESPAWN_13219 := 7; 
UPDATE creature_template SET InhabitType=4 WHERE entry=31135;
UPDATE quest_template SET PrevQuestId=13213 WHERE Id=13214; 
UPDATE quest_template SET PrevQuestId=13214 WHERE Id=13215;
UPDATE quest_template SET PrevQuestId=13215 WHERE Id=13216;
UPDATE quest_template SET PrevQuestId=13216 WHERE Id=13217; 
UPDATE quest_template SET PrevQuestId=13217 WHERE Id=13218; 
UPDATE quest_template SET PrevQuestId=13218 WHERE Id=13219; 
UPDATE quest_template SET RequiredNpcOrGo1=0,RequiredNpcOrGoCount1=0 WHERE Id=@QUEST_FALLENHEROES;
UPDATE creature_template SET faction_A=16,faction_H=16,AIName='SmartAI' WHERE entry IN (@NPC_ELDRETH_13214,@NPC_GENESS_13214,@NPC_JHADRAS_13214,@NPC_MASUD_13214,@NPC_TALLA_13214,@NPC_RITH_13214);
DELETE FROM smart_scripts WHERE entryorguid=@NPC_ELDRETH_13214 AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES 
(@NPC_ELDRETH_13214,0,0,0,0,0,80,0,0,0,6000,12000,11,34829,2,0,0,0,0,5,0,0,0,0,0,0,0,'Eldreth - IC - cast Arcane Shot'),
(@NPC_ELDRETH_13214,0,1,0,0,0,80,0,10000,20000,10000,20000,11,44475,2,0,0,0,0,5,0,0,0,0,0,0,0,'Eldreth - IC - cast Magic Dampening Field'),
(@NPC_ELDRETH_13214,0,2,0,9,0,80,0,5,30,3000,6000,11,15620,2,0,0,0,0,5,0,0,0,0,0,0,0,'Eldreth - on range - cast Shoot'),
(@NPC_ELDRETH_13214,0,3,0,6,0,100,1,0,0,0,0,45,1,1,0,0,0,0,11,@NPC_KILLTRIG_13214,100,0,0,0,0,0,'Eldreth - on death - set Data'),
(@NPC_ELDRETH_13214,0,4,0,21,0,100,0,0,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Eldreth - on reach home - despawn self'),
(@NPC_ELDRETH_13214,0,5,0,21,0,100,0,0,0,0,0,45,@WIPE_13214,@WIPE_13214,0,0,0,0,11,@NPC_GEIRRVIF,100,0,0,0,0,0,'Eldreth - on reach home - set data'),
(@NPC_ELDRETH_13214,0,6,0,5,0,100,0,0,0,0,0,45,@KILL_13214,@KILL_13214,0,0,0,0,11,@NPC_GEIRRVIF,100,0,0,0,0,0,'Eldreth - on kill target - set data');
DELETE FROM smart_scripts WHERE entryorguid=@NPC_GENESS_13214 AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES 
(@NPC_GENESS_13214,0,0,0,0,0,80,0,2000,6000,3000,7000,11,61041,2,0,0,0,0,2,0,0,0,0,0,0,0,'Geness Half-Soul - IC - cast Brutal Fist'),
(@NPC_GENESS_13214,0,1,0,13,0,80,0,10000,15000,0,0,11,46182,2,0,0,0,0,2,0,0,0,0,0,0,0,'Geness Half-Soul - on target cast - cast Snap Kick'),
(@NPC_GENESS_13214,0,2,0,6,0,100,1,0,0,0,0,45,2,2,0,0,0,0,11,@NPC_KILLTRIG_13214,100,0,0,0,0,0,'Geness Half-Soul - on death - set data'),
(@NPC_GENESS_13214,0,3,0,21,0,100,0,0,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Geness Half-Soul - on reach home - despawn self'),
(@NPC_GENESS_13214,0,4,0,5,0,100,0,0,0,0,0,45,@KILL_13214,@KILL_13214,0,0,0,0,11,@NPC_GEIRRVIF,100,0,0,0,0,0,'Geness Half-Soul - on kill target - set data'),
(@NPC_GENESS_13214,0,5,0,21,0,100,0,0,0,0,0,45,@WIPE_13214,@WIPE_13214,0,0,0,0,11,@NPC_GEIRRVIF,100,0,0,0,0,0,'Geness Half-Soul - on reach home - set data');
DELETE FROM smart_scripts WHERE entryorguid=@NPC_JHADRAS_13214 AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES 
(@NPC_JHADRAS_13214,0,0,0,14,0,80,0,50,40,10000,30000,11,15586,0,0,0,0,0,7,0,0,0,0,0,0,0,'Father Jhadras - on friendly hp deficit - cast Heal'),
(@NPC_JHADRAS_13214,0,1,0,0,0,80,0,0,3000,8000,15000,11,25054,0,0,0,0,0,5,0,0,40,0,0,0,0,'Father Jhadras - IC - cast Holy Smite'),
(@NPC_JHADRAS_13214,0,2,0,6,0,100,1,0,0,0,0,45,3,3,0,0,0,0,11,@NPC_KILLTRIG_13214,100,0,0,0,0,0,'Father Jhadras - on death - set data'),
(@NPC_JHADRAS_13214,0,3,0,21,0,100,0,0,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Father Jhadras - on reach home - despawn self'),
(@NPC_JHADRAS_13214,0,4,0,5,0,100,0,0,0,0,0,45,@KILL_13214,@KILL_13214,0,0,0,0,11,@NPC_GEIRRVIF,100,0,0,0,0,0,'Father Jhadras - on kill target - set data'),
(@NPC_JHADRAS_13214,0,5,0,21,0,100,0,0,0,0,0,45,@WIPE_13214,@WIPE_13214,0,0,0,0,11,@NPC_GEIRRVIF,100,0,0,0,0,0,'Father Jhadras - on reach home - set data');
DELETE FROM smart_scripts WHERE entryorguid=@NPC_MASUD_13214 AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES 
(@NPC_MASUD_13214,0,0,0,0,0,80,0,0,0,15000,25000,11,41056,0,0,0,0,0,1,0,0,0,0,0,0,0,'Masud - IC - cast Whirlwind'),
(@NPC_MASUD_13214,0,1,0,0,0,80,0,0,0,10000,20000,11,15496,0,0,0,0,0,2,0,0,0,0,0,0,0,'Masud - IC - cast Cleave'),
(@NPC_MASUD_13214,0,2,0,6,0,100,1,0,0,0,0,45,4,4,0,0,0,0,11,@NPC_KILLTRIG_13214,100,0,0,0,0,0,'Masud - on death - set data'),
(@NPC_MASUD_13214,0,3,0,21,0,100,0,0,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Masud - on reach home - despawn self'),
(@NPC_MASUD_13214,0,4,0,5,0,100,0,0,0,0,0,45,@KILL_13214,@KILL_13214,0,0,0,0,11,@NPC_GEIRRVIF,100,0,0,0,0,0,'Masud - on kill target - set data'),
(@NPC_MASUD_13214,0,5,0,21,0,100,0,0,0,0,0,45,@WIPE_13214,@WIPE_13214,0,0,0,0,11,@NPC_GEIRRVIF,100,0,0,0,0,0,'Masud - on reach home - set data');
DELETE FROM smart_scripts WHERE entryorguid=@NPC_RITH_13214 AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES 
(@NPC_RITH_13214,0,0,0,0,0,80,0,0,0,10000,20000,11,61044,0,0,0,0,0,2,0,0,0,0,0,0,0,'Rith - IC - cast Demoralizing Shout'),
(@NPC_RITH_13214,0,1,0,0,0,80,0,0,0,20000,30000,11,58461,0,0,0,0,0,2,0,0,0,0,0,0,0,'Rith - IC - cast Sunder Armor'),
(@NPC_RITH_13214,0,2,0,6,0,100,1,0,0,0,0,45,5,5,0,0,0,0,11,@NPC_KILLTRIG_13214,100,0,0,0,0,0,'Rith - on death - set data'),
(@NPC_RITH_13214,0,3,0,21,0,100,0,0,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Rith - on reach home - despawn self'),
(@NPC_RITH_13214,0,4,0,5,0,100,0,0,0,0,0,45,@KILL_13214,@KILL_13214,0,0,0,0,11,@NPC_GEIRRVIF,100,0,0,0,0,0,'Rith - on kill target - set data'),
(@NPC_RITH_13214,0,5,0,21,0,100,0,0,0,0,0,45,@WIPE_13214,@WIPE_13214,0,0,0,0,11,@NPC_GEIRRVIF,100,0,0,0,0,0,'Rith - on reach home - set data');
DELETE FROM smart_scripts WHERE entryorguid=@NPC_TALLA_13214 AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES 
(@NPC_TALLA_13214,0,0,0,0,0,80,0,0,0,5000,15000,11,14873,0,0,0,0,0,2,0,0,0,0,0,0,0,'Talla - IC - cast Sinister Strike '),
(@NPC_TALLA_13214,0,1,0,0,0,80,0,0,0,20000,25000,11,30981,0,0,0,0,0,2,0,0,0,0,0,0,0,'Talla - IC - cast Crippling Poison '),
(@NPC_TALLA_13214,0,2,0,6,0,100,1,0,0,0,0,45,6,6,0,0,0,0,11,@NPC_KILLTRIG_13214,100,0,0,0,0,0,'Talla - on death - set data'),
(@NPC_TALLA_13214,0,3,0,21,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Talla - on reach home - despawn self'),
(@NPC_TALLA_13214,0,4,0,5,0,100,0,0,0,0,0,45,@KILL_13214,@KILL_13214,0,0,0,0,11,@NPC_GEIRRVIF,100,0,0,0,0,0,'Talla - on kill target - set data'),
(@NPC_TALLA_13214,0,5,0,21,0,100,0,0,0,0,0,45,@WIPE_13214,@WIPE_13214,0,0,0,0,11,@NPC_GEIRRVIF,100,0,0,0,0,0,'Talla - on reach home - set data');
DELETE FROM creature_template WHERE entry=@NPC_KILLTRIG_13214;
INSERT INTO creature_template (entry,difficulty_entry_1,difficulty_entry_2,difficulty_entry_3,KillCredit1,KillCredit2,modelid1,modelid2,modelid3,modelid4,name,subname,IconName,gossip_menu_id,minlevel,maxlevel,exp,faction_A,faction_H,npcflag,speed_walk,speed_run,scale,rank,mindmg,maxdmg,dmgschool,attackpower,dmg_multiplier,baseattacktime,rangeattacktime,unit_class,unit_flags,dynamicflags,family,trainer_type,trainer_spell,trainer_class,trainer_race,minrangedmg,maxrangedmg,rangedattackpower,type,type_flags,lootid,pickpocketloot,skinloot,resistance1,resistance2,resistance3,resistance4,resistance5,resistance6,spell1,spell2,spell3,spell4,spell5,spell6,spell7,spell8,PetSpellDataId,VehicleId,mingold,maxgold,AIName,MovementType,InhabitType,Health_mod,Mana_mod,Armor_mod,RacialLeader,questItem1,questItem2,questItem3,questItem4,questItem5,questItem6,movementId,RegenHealth,mechanic_immune_mask,flags_extra,ScriptName,WDBVerified) VALUES 
(@NPC_KILLTRIG_13214,0,0,0,0,0,11686,11686,11686,11686,'Fallen Hyrous','','',0,60,60,0,35,35,0,1.15,1.14286,1,0,104,138,0,252,1,2000,0,1,33554436,8,0,0,0,0,0,72,106,26,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'SmartAI',0,3,0.7,1,1,0,0,0,0,0,0,0,0,1,0,0,'',12340);
DELETE FROM smart_scripts WHERE entryorguid=@NPC_KILLTRIG_13214 AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES 
(@NPC_KILLTRIG_13214,0,0,0,38,0,100,1,1,1,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kill trigger - on data set - increment phase 1(1)'),
(@NPC_KILLTRIG_13214,0,1,0,38,0,100,1,2,2,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kill trigger - on data set - increment phase 2(2)'),
(@NPC_KILLTRIG_13214,0,2,0,38,0,100,1,3,3,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kill trigger - on data set - increment phase 3(4)'),
(@NPC_KILLTRIG_13214,0,3,0,38,0,100,1,4,4,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kill trigger - on data set - increment phase 4(8)'),
(@NPC_KILLTRIG_13214,0,4,0,38,0,100,1,5,5,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kill trigger - on data set - increment phase 5(16)'),
(@NPC_KILLTRIG_13214,0,5,0,38,0,100,1,6,6,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kill trigger - on data set - increment phase 6(32)'),
(@NPC_KILLTRIG_13214,0,6,0,1,32,100,1,0,0,0,0,45,@CREDIT_13214,@CREDIT_13214,0,0,0,0,11,@NPC_GEIRRVIF,100,0,0,0,0,0,'Kill trigger - on phase 6(32) - set data');
UPDATE quest_template SET RequiredNpcOrGo1=0,RequiredNpcOrGoCount1=0 WHERE Id=@QUEST_KDARKMASTER;
UPDATE creature_template SET faction_A=16,faction_H=16,AIName='SmartAI',unit_flags=0 WHERE entry=@NPC_KHITRIX_13215;
DELETE FROM creature_template WHERE entry=@NPC_FAKEKHITRIX_13215;
INSERT INTO creature_template (entry,difficulty_entry_1,difficulty_entry_2,difficulty_entry_3,KillCredit1,KillCredit2,modelid1,modelid2,modelid3,modelid4,name,subname,IconName,gossip_menu_id,minlevel,maxlevel,exp,faction_A,faction_H,npcflag,speed_walk,speed_run,scale,rank,mindmg,maxdmg,dmgschool,attackpower,dmg_multiplier,baseattacktime,rangeattacktime,unit_class,unit_flags,dynamicflags,family,trainer_type,trainer_spell,trainer_class,trainer_race,minrangedmg,maxrangedmg,rangedattackpower,type,type_flags,lootid,pickpocketloot,skinloot,resistance1,resistance2,resistance3,resistance4,resistance5,resistance6,spell1,spell2,spell3,spell4,spell5,spell6,spell7,spell8,PetSpellDataId,VehicleId,mingold,maxgold,AIName,MovementType,InhabitType,Health_mod,Mana_mod,Armor_mod,RacialLeader,questItem1,questItem2,questItem3,questItem4,questItem5,questItem6,movementId,RegenHealth,mechanic_immune_mask,flags_extra,ScriptName,WDBVerified) VALUES 
(@NPC_FAKEKHITRIX_13215,0,0,0,0,0,25269,0,0,0,'Khitrix the Dark Master','','',0,80,80,2,7,7,0,1.6,1.42857,1,1,346,499,0,287,7.5,2000,0,8,2,8,0,0,0,0,0,315,468,69,6,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'SmartAI',0,3,12,5,1,0,0,0,0,0,0,0,150,1,8388624,0,'',12340);
DELETE FROM creature_text WHERE entry=@NPC_KHITRIX_13215;
INSERT INTO creature_text VALUES
(@NPC_KHITRIX_13215,0,0,'When I am done here,I am going to mount your heads upon the walls of Azjol-Nerub!',14,0,0,0,0,0,'Dark Master say 1');
DELETE FROM smart_scripts WHERE entryorguid IN (@NPC_KHITRIX_13215,@NPC_FAKEKHITRIX_13215*100,@NPC_FAKEKHITRIX_13215);
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES 
(@NPC_KHITRIX_13215,0,0,0,0,0,80,0,0,0,10000,20000,11,38243,0,0,0,0,0,5,0,0,0,0,0,0,0,'Khitrix the Dark Master - IC - cast Mind Flay'),
(@NPC_KHITRIX_13215,0,1,0,0,0,80,0,5000,25000,5000,25000,11,22884,0,0,0,0,0,2,0,0,0,0,0,0,0,'Khitrix the Dark Master - IC - cast Psychic Scream'),
(@NPC_KHITRIX_13215,0,2,0,0,0,80,0,10000,15000,120000,180000,11,61055,0,0,0,0,0,2,0,0,0,0,0,0,0,'Khitrix the Dark Master - IC - cast Bone Spiders'),
(@NPC_FAKEKHITRIX_13215,0,3,0,54,0,100,0,0,0,0,0,80,@NPC_FAKEKHITRIX_13215*100,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fake Khitrix the Dark Master - on summon - call script 1'),
(@NPC_FAKEKHITRIX_13215*100,9,0,0,1,0,100,0,0,0,0,0,69,8197,3502,625,0,0,0,8,0,0,0,8197.6045,3502.557,625.108032,0.585,'Fake Khitrix the Dark Master - OOC script 1 - move to position'),
(@NPC_FAKEKHITRIX_13215*100,9,1,0,1,0,100,1,10000,10000,0,0,12,@NPC_KHITRIX_13215,4,10000,0,1,0,1,0,0,0,0,0,0,0,'Fake Khitrix the Dark Master - OOC script 1 - summon real Dark Master'),
(@NPC_FAKEKHITRIX_13215*100,9,2,0,1,0,100,1,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fake Khitrix the Dark Master - OOC script 1 - despawn self'),
(@NPC_KHITRIX_13215,0,4,0,54,0,100,0,0,0,0,0,1,0,10,0,0,0,0,1,0,0,0,0,0,0,0,'Khitrix the Dark Master - on summon - Say 1'),
(@NPC_KHITRIX_13215,0,5,0,1,0,100,0,500,500,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,'Khitrix the Dark Master - OOC - Start Attack'),
(@NPC_KHITRIX_13215,0,6,0,5,0,100,0,0,0,0,0,45,@KILL_13214,@KILL_13214,0,0,0,0,11,@NPC_GEIRRVIF,100,0,0,0,0,0,'Khitrix the Dark Master - on kill target - set data'),
(@NPC_KHITRIX_13215,0,7,0,6,0,100,0,0,0,1,0,45,@CREDIT_13215,@CREDIT_13215,0,0,0,0,11,@NPC_GEIRRVIF,100,0,0,0,0,0,'Khitrix the Dark Master - on death - set data'),
(@NPC_KHITRIX_13215,0,8,0,1,0,100,1,9000,9000,0,0,45,@WIPE_13214,@WIPE_13214,0,0,0,0,11,@NPC_GEIRRVIF,100,0,0,0,0,0,'Khitrix the Dark Master - OOC - Set Data');
UPDATE creature_template SET exp=0,mindmg=200,maxdmg=300,dmg_multiplier=2,AIName='SmartAI',Health_mod=1 WHERE entry=@NPC_BONESPIDER_13215;
DELETE FROM smart_scripts WHERE entryorguid=@NPC_BONESPIDER_13215 AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES 
(@NPC_BONESPIDER_13215,0,0,0,0,0,80,0,0,0,10000,20000,11,744,0,0,0,0,0,5,0,0,0,0,0,0,0,'Bone spiders - IC - cast Poison'),
(@NPC_BONESPIDER_13215,0,1,0,1,0,100,0,500,500,0,0,49,0,0,0,0,0,0,5,0,0,0,0,0,0,0,'Bone Spiders - OOC - Start Attack Random Player');
UPDATE quest_template SET RequiredNpcOrGo1=0,RequiredNpcOrGoCount1=0 WHERE Id=@QUEST_SIGRIDICEBORN;
DELETE FROM creature_template WHERE entry IN (@NPC_SIGRID_13216,@NPC_FAKESIGRID_13216);
INSERT INTO creature_template (entry,difficulty_entry_1,difficulty_entry_2,difficulty_entry_3,KillCredit1,KillCredit2,modelid1,modelid2,modelid3,modelid4,name,subname,IconName,gossip_menu_id,minlevel,maxlevel,exp,faction_A,faction_H,npcflag,speed_walk,speed_run,scale,rank,mindmg,maxdmg,dmgschool,attackpower,dmg_multiplier,baseattacktime,rangeattacktime,unit_class,unit_flags,dynamicflags,family,trainer_type,trainer_spell,trainer_class,trainer_race,minrangedmg,maxrangedmg,rangedattackpower,type,type_flags,lootid,pickpocketloot,skinloot,resistance1,resistance2,resistance3,resistance4,resistance5,resistance6,spell1,spell2,spell3,spell4,spell5,spell6,spell7,spell8,PetSpellDataId,VehicleId,mingold,maxgold,AIName,MovementType,InhabitType,Health_mod,Mana_mod,Armor_mod,RacialLeader,questItem1,questItem2,questItem3,questItem4,questItem5,questItem6,movementId,RegenHealth,mechanic_immune_mask,flags_extra,ScriptName,WDBVerified) VALUES 
(@NPC_SIGRID_13216,0,0,0,0,0,27528,0,0,0,'Sigrid Iceborn','','',0,80,80,2,16,16,0,1.6,3.14286,1,1,346,499,0,287,7.5,2000,0,1,0,8,0,0,0,0,0,315,468,69,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'SmartAI',0,1,14,1,1,0,0,0,0,0,0,0,150,1,8388624,0,'',12340),
(@NPC_FAKESIGRID_13216,0,0,0,0,0,27528,0,0,0,'Sigrid Iceborn','','',0,80,80,2,7,7,0,1.6,3.14286,1,1,346,499,0,287,7.5,2000,0,1,2,8,0,0,0,0,0,315,468,69,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'SmartAI',0,1,14,1,1,0,0,0,0,0,0,0,150,1,8388624,0,'',12340);
DELETE FROM smart_scripts WHERE entryorguid IN (@NPC_SIGRID_13216,@NPC_FAKESIGRID_13216*100,@NPC_FAKESIGRID_13216);
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES 
(@NPC_SIGRID_13216,0,0,0,9,0,80,0,0,2,15000,30000,11,57635,0,0,0,0,0,2,0,0,0,0,0,0,0,'Sigrid Iceborn - on range - cast Disengage'),
(@NPC_SIGRID_13216,0,1,2,9,0,80,0,0,3,10000,30000,11,61170,0,0,0,0,0,2,0,0,0,0,0,0,0,'Sigrid Iceborn - IC - cast Flash Freeze'),
(@NPC_SIGRID_13216,0,2,0,61,0,80,0,0,0,0,0,89,30,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sigrid Random Move'),
(@NPC_SIGRID_13216,0,3,0,1,0,100,1,0,0,0,0,11,61165,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sigrid Iceborn - IC - cast Frostbite Weapon'),
(@NPC_SIGRID_13216,0,4,0,9,0,80,0,5,30,5000,25000,11,61168,0,0,0,0,0,5,0,0,0,0,0,0,0,'Sigrid Iceborn - on range - cast Throw'),
(@NPC_FAKESIGRID_13216,0,5,0,54,0,100,0,0,0,0,0,80,@NPC_FAKESIGRID_13216*100,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fake Sigrid Iceborn - on summon - call script 1'),
(@NPC_FAKESIGRID_13216*100,9,0,0,1,0,100,0,0,0,0,0,43,32151,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fake Sigrid Iceborn - on summon script 1 - mount'),
(@NPC_FAKESIGRID_13216*100,9,1,0,1,0,100,0,0,0,0,0,60,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fake Sigrid Iceborn - OOC script 1 - fly'),
(@NPC_FAKESIGRID_13216*100,9,2,0,1,0,100,1,1000,1000,0,0,69,8193,3499,625,0,0,0,8,0,0,0,8193.795,3499.034,625.0065,0.635,'Fake Sigrid Iceborn - OOC script 1 - move to position'),
(@NPC_FAKESIGRID_13216*100,9,3,0,1,0,100,1,12000,12000,0,0,60,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fake Sigrid Iceborn - OOC script 1 - fly off'),
(@NPC_FAKESIGRID_13216*100,9,4,0,1,0,100,1,0,0,0,0,43,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fake Sigrid Iceborn - OOC script 1 - dismount'),
(@NPC_FAKESIGRID_13216*100,9,5,0,1,0,100,1,500,500,0,0,69,8197,3502,625,0,0,0,8,0,0,0,8197.6045,3502.557,625.108032,0.585,'Fake Sigrid Iceborn - OOC script 1 - move to position'),
(@NPC_FAKESIGRID_13216*100,9,6,0,1,0,100,1,3000,3000,0,0,12,@NPC_SIGRID_13216,4,10000,0,1,0,1,0,0,0,0,0,0,0,'Fake Sigrid Iceborn - OOC script 1 - summon real Sigi'),
(@NPC_FAKESIGRID_13216*100,9,7,0,1,0,100,1,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fake Sigrid Iceborn - OOC script 1 - despawn self'),
(@NPC_SIGRID_13216,0,5,0,1,0,100,0,500,500,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,'Sigrid Iceborn - OOC - Start Attack'),
(@NPC_SIGRID_13216,0,6,0,5,0,100,0,0,0,0,0,45,@KILL_13214,@KILL_13214,0,0,0,0,11,@NPC_GEIRRVIF,100,0,0,0,0,0,'Sigrid Iceborn - on kill target - set data'),
(@NPC_SIGRID_13216,0,7,0,6,0,100,0,0,0,1,0,45,@CREDIT_13216,@CREDIT_13216,0,0,0,0,11,@NPC_GEIRRVIF,100,0,0,0,0,0,'Sigrid Iceborn - on death - set data'),
(@NPC_SIGRID_13216,0,8,0,1,0,100,1,9000,9000,0,0,45,@WIPE_13214,@WIPE_13214,0,0,0,0,11,@NPC_GEIRRVIF,100,0,0,0,0,0,'Sigrid Iceborn - OOC - Set Data');
DELETE FROM creature_template WHERE entry IN (@NPC_CARNAGE_13217,@NPC_FAKECARNAGE_13217);
INSERT INTO creature_template (entry,difficulty_entry_1,difficulty_entry_2,difficulty_entry_3,KillCredit1,KillCredit2,modelid1,modelid2,modelid3,modelid4,name,subname,IconName,gossip_menu_id,minlevel,maxlevel,exp,faction_A,faction_H,npcflag,speed_walk,speed_run,scale,rank,mindmg,maxdmg,dmgschool,attackpower,dmg_multiplier,baseattacktime,rangeattacktime,unit_class,unit_flags,dynamicflags,family,trainer_type,trainer_spell,trainer_class,trainer_race,minrangedmg,maxrangedmg,rangedattackpower,type,type_flags,lootid,pickpocketloot,skinloot,resistance1,resistance2,resistance3,resistance4,resistance5,resistance6,spell1,spell2,spell3,spell4,spell5,spell6,spell7,spell8,PetSpellDataId,VehicleId,mingold,maxgold,AIName,MovementType,InhabitType,Health_mod,Mana_mod,Armor_mod,RacialLeader,questItem1,questItem2,questItem3,questItem4,questItem5,questItem6,movementId,RegenHealth,mechanic_immune_mask,flags_extra,ScriptName,WDBVerified) VALUES 
(@NPC_CARNAGE_13217,0,0,0,0,0,24301,0,0,0,'Carnage','','',0,80,80,2,16,16,0,1.6,1.71429,1,1,348,599,0,224,7.5,2000,0,1,0,8,0,0,0,0,0,1,1,0,6,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'SmartAI',0,1,16,1,2,0,0,0,0,0,0,0,167,1,8388624,0,'',12340),
(@NPC_FAKECARNAGE_13217,0,0,0,0,0,24301,0,0,0,'Carnage','','',0,80,80,2,7,7,0,1.6,1.71429,1,1,348,599,0,224,7.5,2000,0,1,2,8,0,0,0,0,0,1,1,0,6,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'SmartAI',0,1,16,1,2,0,0,0,0,0,0,0,167,1,8388624,0,'',12340);
DELETE FROM smart_scripts WHERE entryorguid IN (@NPC_CARNAGE_13217,@NPC_FAKECARNAGE_13217*100,@NPC_FAKECARNAGE_13217);
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES 
(@NPC_CARNAGE_13217,0,1,0,0,0,80,0,10000,30000,20000,40000,11,61065,0,0,0,0,0,5,0,0,0,0,0,0,0,'Carnage - IC - cast War Stomp'),
(@NPC_CARNAGE_13217,0,2,0,0,0,80,0,5000,12000,5000,12000,11,61070,0,0,0,0,0,2,0,0,0,0,0,0,0,'Carnage - IC - cast Smash'),
(@NPC_FAKECARNAGE_13217,0,3,0,54,0,100,0,0,0,0,0,80,@NPC_FAKECARNAGE_13217*100,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fake Carnage - on summon - call script 1'),
(@NPC_FAKECARNAGE_13217*100,9,0,0,1,0,100,1,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,8193.264648,3496.165771,625.067322,0.746269,'Fake Carnage - OOC script 1 - move to position'),
(@NPC_FAKECARNAGE_13217*100,9,1,0,1,0,100,1,14000,14000,0,0,12,@NPC_CARNAGE_13217,4,10000,0,1,0,1,0,0,0,0,0,0,0,'Fake Carnage - OOC script 1 - summon real Carnage'),
(@NPC_FAKECARNAGE_13217*100,9,2,0,1,0,100,1,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fake Carnage - OOC script 1 - despawn self'),
(@NPC_CARNAGE_13217,0,3,0,1,0,100,0,500,500,0,0,49,0,0,0,0,0,0,21,70,0,0,0,0,0,0,'Carnage - OOC - Start Attack'),
(@NPC_CARNAGE_13217,0,4,0,5,0,100,0,0,0,0,0,45,@KILL_13214,@KILL_13214,0,0,0,0,11,@NPC_GEIRRVIF,100,0,0,0,0,0,'Carnage - on kill target - set data'),
(@NPC_CARNAGE_13217,0,5,0,6,0,100,0,0,0,1,0,45,@CREDIT_13217,@CREDIT_13217,0,0,0,0,11,@NPC_GEIRRVIF,100,0,0,0,0,0,'Carnage - on death - set data'),
(@NPC_CARNAGE_13217,0,6,0,1,0,100,1,9000,9000,0,0,45,@WIPE_13214,@WIPE_13214,0,0,0,0,11,@NPC_GEIRRVIF,100,0,0,0,0,0,'Carnage - OOC - Set Data');
DELETE FROM creature_template WHERE entry IN (@NPC_THANE_13218,@NPC_FAKETHANE_13218);
INSERT INTO creature_template (entry,difficulty_entry_1,difficulty_entry_2,difficulty_entry_3,KillCredit1,KillCredit2,modelid1,modelid2,modelid3,modelid4,name,subname,IconName,gossip_menu_id,minlevel,maxlevel,exp,faction_A,faction_H,npcflag,speed_walk,speed_run,scale,rank,mindmg,maxdmg,dmgschool,attackpower,dmg_multiplier,baseattacktime,rangeattacktime,unit_class,unit_flags,dynamicflags,family,trainer_type,trainer_spell,trainer_class,trainer_race,minrangedmg,maxrangedmg,rangedattackpower,type,type_flags,lootid,pickpocketloot,skinloot,resistance1,resistance2,resistance3,resistance4,resistance5,resistance6,spell1,spell2,spell3,spell4,spell5,spell6,spell7,spell8,PetSpellDataId,VehicleId,mingold,maxgold,AIName,MovementType,InhabitType,Health_mod,Mana_mod,Armor_mod,RacialLeader,questItem1,questItem2,questItem3,questItem4,questItem5,questItem6,movementId,RegenHealth,mechanic_immune_mask,flags_extra,ScriptName,WDBVerified) VALUES 
(@NPC_THANE_13218,0,0,0,0,0,27551,0,0,0,'Thane Banahogg','The Deathblow','',0,80,80,2,16,16,0,1,1.14286,1,1,348,499,0,224,7.5,2000,0,1,0,8,0,0,0,0,0,315,468,69,7,32,0,0,0,0,0,0,0,0,0,0,0,0,0,61139,0,0,0,0,0,0,0,'SmartAI',0,1,18,1,1,0,0,0,0,0,0,0,167,1,8388624,0,'',12340),
(@NPC_FAKETHANE_13218,0,0,0,0,0,27551,0,0,0,'Thane Banahogg','The Deathblow','',0,80,80,2,7,7,0,1,1.14286,1,1,348,499,0,224,7.5,2000,0,1,2,8,0,0,0,0,0,315,468,69,7,32,0,0,0,0,0,0,0,0,0,0,0,0,0,61139,0,0,0,0,0,0,0,'SmartAI',0,1,18,1,1,0,0,0,0,0,0,0,167,1,8388624,0,'',12340);
DELETE FROM creature_text WHERE entry IN (@NPC_THANE_13218,@NPC_FAKETHANE_13218);
INSERT INTO creature_text VALUES
(@NPC_FAKETHANE_13218,0,0,'ENOUGH! You tiny insects are not worthy to do battle within this sacred place!.',14,0,0,0,0,0,'Thane say 1'),
(@NPC_FAKETHANE_13218,1,1,'Fight me and die you cowards!',14,0,0,0,0,0,'Thane say 2'),
(@NPC_THANE_13218,2,2,'Haraak foln! ',12,0,0,0,0,0,'Thane say 3');
DELETE FROM smart_scripts WHERE entryorguid IN (@NPC_THANE_13218,@NPC_FAKETHANE_13218*100,@NPC_FAKETHANE_13218);
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES 
(@NPC_THANE_13218,0,1,0,0,0,80,0,5000,10000,15000,20000,11,13737,0,0,0,0,0,2,0,0,0,0,0,0,0,'Thane Banahogg - IC - cast Mortal Strike'),
(@NPC_THANE_13218,0,2,0,0,0,80,0,5000,10000,5000,10000,11,61133,0,0,0,0,0,2,0,0,0,0,0,0,0,'Thane Banahogg - IC - cast Punt'),
(@NPC_THANE_13218,0,3,4,0,0,100,0,20000,20000,20000,30000,11,61134,0,0,0,0,0,5,0,0,0,0,0,0,0,'Thane Banahogg - IC - cast Leap'),
(@NPC_THANE_13218,0,4,0,61,0,100,1,0,0,0,0,11,61139,0,0,0,0,0,5,0,0,0,0,0,0,0,'Thane Banahogg - on linked - cast Whirlwind'),
(@NPC_THANE_13218,0,5,0,12,0,100,0,0,20,5000,10000,11,61140,0,0,0,0,0,2,0,0,0,0,0,0,0,'Thane Banahogg - on %hp - cast Execute'),
(@NPC_FAKETHANE_13218,0,6,0,54,0,100,0,0,0,0,0,80,@NPC_FAKETHANE_13218*100,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fake Thane Banahogg - on summon - call script 1'),
(@NPC_FAKETHANE_13218*100,9,0,0,1,0,100,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fake Thane Banahogg - OOC script 1 - say 1'),
(@NPC_FAKETHANE_13218*100,9,1,0,1,0,100,1,2000,2000,0,0,97,25,30,8169.0015,3477.075,626.4695,0,8,0,0,0,8169.0015,3477.075,626.4695,0.673769,'Fake Thane Banahogg - OOC script 1 - jump to position'),
(@NPC_FAKETHANE_13218*100,9,2,0,1,0,100,1,4000,4000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fake Thane Banahogg - OOC script 1 - say 2'),
(@NPC_FAKETHANE_13218*100,9,3,0,1,0,100,1,5000,5000,0,0,69,8197.6045,3502.557,625.108032,0,0,0,8,0,0,0,8197.6045,3502.557,625.108032,0.585,'Fake Thane Banahogg - OOC script 1 - move to position'),
(@NPC_FAKETHANE_13218*100,9,4,0,1,0,100,1,8000,8000,0,0,12,@NPC_THANE_13218,4,10000,0,1,0,1,0,0,0,0,0,0,0,'Fake Thane Banahogg - OOC script 1 - summon real Thane'),
(@NPC_FAKETHANE_13218*100,9,5,0,1,0,100,1,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fake Thane Banahogg - OOC script 1 - despawn self'),
(@NPC_THANE_13218,0,7,0,54,0,100,1,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Thane Banahogg - Just Summoned - say 3'),
(@NPC_THANE_13218,0,8,0,1,0,100,0,500,500,0,0,49,0,0,0,0,0,0,21,70,0,0,0,0,0,0,'Thane Banahogg - OOC - Start Attack'),
(@NPC_THANE_13218,0,9,0,5,0,100,0,0,0,0,0,45,@KILL_13214,@KILL_13214,0,0,0,0,11,@NPC_GEIRRVIF,100,0,0,0,0,0,'Thane Banahogg - on kill target - set data'),
(@NPC_THANE_13218,0,10,0,6,0,100,0,0,0,1,0,45,@CREDIT_13218,@CREDIT_13218,0,0,0,0,11,@NPC_GEIRRVIF,100,0,0,0,0,0,'Thane Banahogg - on death - set data'),
(@NPC_THANE_13218,0,11,0,1,0,100,1,9000,9000,0,0,45,@WIPE_13214,@WIPE_13214,0,0,0,0,11,@NPC_GEIRRVIF,100,0,0,0,0,0,'Thane Banahogg - OOC - Set Data');
DELETE FROM creature_template WHERE entry IN (@NPC_PRINCSAND_13219,@NPC_FAKEPRINCSAND_13219);
INSERT INTO creature_template (entry,difficulty_entry_1,difficulty_entry_2,difficulty_entry_3,KillCredit1,KillCredit2,modelid1,modelid2,modelid3,modelid4,name,subname,IconName,gossip_menu_id,minlevel,maxlevel,exp,faction_A,faction_H,npcflag,speed_walk,speed_run,scale,rank,mindmg,maxdmg,dmgschool,attackpower,dmg_multiplier,baseattacktime,rangeattacktime,unit_class,unit_flags,dynamicflags,family,trainer_type,trainer_spell,trainer_class,trainer_race,minrangedmg,maxrangedmg,rangedattackpower,type,type_flags,lootid,pickpocketloot,skinloot,resistance1,resistance2,resistance3,resistance4,resistance5,resistance6,spell1,spell2,spell3,spell4,spell5,spell6,spell7,spell8,PetSpellDataId,VehicleId,mingold,maxgold,AIName,MovementType,InhabitType,Health_mod,Mana_mod,Armor_mod,RacialLeader,questItem1,questItem2,questItem3,questItem4,questItem5,questItem6,movementId,RegenHealth,mechanic_immune_mask,flags_extra,ScriptName,WDBVerified) VALUES 
(@NPC_PRINCSAND_13219,0,0,0,0,0,27555,0,0,0,'Prince Sandoval','',NULL,0,80,80,2,16,16,0,1.2,1.14286,1,1,417,582,0,608,7.5,2000,0,2,0,8,0,0,0,0,0,341,506,80,6,32,0,0,0,0,0,0,0,0,0,40602,37662,15087,7964,0,0,0,0,0,0,0,0,'SmartAI',0,1,20,10,1,0,0,0,0,0,0,0,191,1,8388624,0,'',12340),
(@NPC_FAKEPRINCSAND_13219,0,0,0,0,0,27555,0,0,0,'Prince Sandoval','',NULL,0,80,80,2,7,7,0,1.2,1.14286,1,1,417,582,0,608,7.5,2000,0,2,2,8,0,0,0,0,0,341,506,80,6,32,0,0,0,0,0,0,0,0,0,40602,37662,15087,7964,0,0,0,0,0,0,0,0,'SmartAI',0,1,20,10,1,0,0,0,0,0,0,0,191,1,8388624,0,'',12340);
DELETE FROM creature_text WHERE entry IN (@NPC_PRINCSAND_13219,@NPC_FAKEPRINCSAND_13219);
INSERT INTO creature_text VALUES
(@NPC_FAKEPRINCSAND_13219,0,0,'Hardly a fitting introduction,Spear-Wife. Now,who is this outsider that Ive been hearing so much about?',14,0,0,0,0,0,'Prince Sandoval say 1'),
(@NPC_FAKEPRINCSAND_13219,1,1,'I will make this as easy as possible for you. Simply come here and die. That is all that I ask for your many trespasses. For your sullying this exlated place of battle. ',14,0,0,0,0,0,'Prince Sandoval say 2'),
(@NPC_PRINCSAND_13219,2,2,'FOR YOUR EFFRONTERY TO THE LICH KING!',14,0,0,0,0,0,'Prince Sandoval say 3');
DELETE FROM smart_scripts WHERE entryorguid IN (@NPC_PRINCSAND_13219,@NPC_FAKEPRINCSAND_13219*100,@NPC_FAKEPRINCSAND_13219);
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES 
(@NPC_PRINCSAND_13219,0,0,0,0,0,80,0,0,0,10000,20000,11,61162,0,0,0,0,0,2,0,0,0,0,0,0,0,'Prince Sandoval - IC - cast Engulfing Strike'),
(@NPC_PRINCSAND_13219,0,1,0,0,0,80,0,15000,20000,30000,30000,11,61163,0,0,0,0,0,2,0,0,0,0,0,0,0,'Prince Sandoval - IC - cast Fire Nova'),
(@NPC_PRINCSAND_13219,0,2,0,0,0,100,0,30000,30000,30000,30000,11,61144,1,0,0,0,0,1,0,0,0,0,0,0,0,'Prince Sandoval - IC - cast Fire Shield'),
(@NPC_PRINCSAND_13219,0,3,0,0,0,100,0,31100,31100,30000,30000,11,61145,1,0,0,0,0,1,0,0,0,0,0,0,0,'Prince Sandoval - IC - cast Ember Shower'),
(@NPC_PRINCSAND_13219,0,4,0,0,0,100,0,31100,31100,30000,30000,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Prince Sandoval - IC - change state'),
(@NPC_PRINCSAND_13219,0,5,0,0,0,100,0,31200,31200,30000,30000,18,131077,0,0,0,0,0,1,0,0,0,0,0,0,0,'Prince Sandoval - IC - change unit flag'),
(@NPC_PRINCSAND_13219,0,6,0,0,0,100,0,45100,45100,30000,30000,19,131077,0,0,0,0,0,1,0,0,0,0,0,0,0,'Prince Sandoval - IC - change unit flag'),
(@NPC_PRINCSAND_13219,0,7,0,0,0,100,0,45100,45100,30000,30000,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Prince Sandoval - IC - change state'),
(@NPC_PRINCSAND_13219,0,8,0,0,0,100,0,45500,45500,30000,30000,28,61144,0,0,0,0,0,1,0,0,0,0,0,0,0,'Prince Sandoval - IC - remove Fire Shield'),
(@NPC_PRINCSAND_13219,0,9,0,0,0,100,0,46000,46000,30000,30000,28,61145,0,0,0,0,0,1,0,0,0,0,0,0,0,'Prince Sandoval - IC - remove Ember Shower'),
(@NPC_FAKEPRINCSAND_13219,0,10,0,54,0,100,0,0,0,0,0,80,@NPC_FAKEPRINCSAND_13219*100,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fake Prince Sandoval - on summon - call script 1'),
(@NPC_FAKEPRINCSAND_13219*100,9,0,0,1,0,100,1,0,0,0,0,1,0,10,0,0,0,0,1,0,0,0,0,0,0,0,'Fake Prince Sandoval - OOC script 1 - Say 1'),
(@NPC_FAKEPRINCSAND_13219*100,9,1,0,1,0,100,1,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,8197.6045,3502.557,625.108032,0.585,'Fake Prince Sandoval - OOC script 1 - move to position'),
(@NPC_FAKEPRINCSAND_13219*100,9,2,0,1,0,100,1,10000,10000,0,0,1,1,10,0,0,0,0,1,0,0,0,0,0,0,0,'Fake Prince Sandoval - OOC script 1 - Say 2'),
(@NPC_FAKEPRINCSAND_13219*100,9,3,0,1,0,100,1,4000,4000,0,0,12,@NPC_PRINCSAND_13219,4,10000,0,1,0,1,0,0,0,0,0,0,0,'Fake Prince Sandoval - OOC script 1 - summon real Prince'),
(@NPC_FAKEPRINCSAND_13219*100,9,4,0,1,0,100,1,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fake Prince Sandoval - OOC script 1 - despawn self'),
(@NPC_PRINCSAND_13219,0,11,0,54,0,100,1,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Prince Sandoval - OOC script 1 - say 3'),
(@NPC_PRINCSAND_13219,0,12,0,1,0,100,0,500,500,0,0,49,0,0,0,0,0,0,21,70,0,0,0,0,0,0,'Prince Sandoval - OOC - Start Attack'),
(@NPC_PRINCSAND_13219,0,13,0,5,0,100,0,0,0,0,0,45,@KILL_13214,@KILL_13214,0,0,0,0,11,@NPC_GEIRRVIF,100,0,0,0,0,0,'Prince Sandoval - on kill target - set data'),
(@NPC_PRINCSAND_13219,0,14,0,6,0,100,0,0,0,1,0,45,@CREDIT_13219,@CREDIT_13219,0,0,0,0,11,@NPC_GEIRRVIF,100,0,0,0,0,0,'Prince Sandoval - on death - set data'),
(@NPC_PRINCSAND_13219,0,15,0,1,0,100,1,9000,9000,0,0,45,@WIPE_13214,@WIPE_13214,0,0,0,0,11,@NPC_GEIRRVIF,100,0,0,0,0,0,'Prince Sandoval - OOC - Set Data');
UPDATE creature_template SET AIName='SmartAI' WHERE entry=@NPC_GEIRRVIF;
DELETE FROM smart_scripts WHERE entryorguid IN (@NPC_GEIRRVIF,@NPC_GEIRRVIF*100,@NPC_GEIRRVIF*100+1,@NPC_GEIRRVIF*100+2,@NPC_GEIRRVIF*100+3,@NPC_GEIRRVIF*100+4,@NPC_GEIRRVIF*100+5,@NPC_GEIRRVIF*100+6);
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES 
(@NPC_GEIRRVIF,0,0,0,19,0,100,0,@QUEST_FALLENHEROES,0,0,0,80,@NPC_GEIRRVIF*100,0,0,0,0,0,1,0,0,0,0,0,0,0,'Grieff - on accept quest 1 - call script 1'),
(@NPC_GEIRRVIF*100,9,0,0,1,0,100,1,1000,1000,0,0,69,8216,3516,653,0,0,0,8,0,0,0,8215.81,3515.88,652.885,3.83972,'Grieff - OOC script 1 - move to position'),
(@NPC_GEIRRVIF*100,9,1,0,1,0,100,1,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Grieff - OOC script 1 - change npc flag'),
(@NPC_GEIRRVIF*100,9,2,0,1,0,100,1,0,0,0,0,45,@DESPAWN_13214,@DESPAWN_13214,0,0,0,0,1,0,0,0,0,0,0,0,'Grieff - OOC script 1 - despawn corpse'),
(@NPC_GEIRRVIF*100,9,3,0,1,0,100,1,1000,1000,0,0,1,0,10,0,0,0,0,7,0,0,0,0,0,0,0,'Grieff - OOC script 1 - say 1'),
(@NPC_GEIRRVIF*100,9,4,0,1,0,100,1,4000,4000,0,0,1,1,10,0,0,0,0,7,0,0,0,0,0,0,0,'Grieff - OOC script 1 - say 2'),
(@NPC_GEIRRVIF*100,9,5,0,1,0,100,1,6000,6000,0,0,1,2,10,0,0,0,0,7,0,0,0,0,0,0,0,'Grieff - OOC script 1 - say 3'),
(@NPC_GEIRRVIF*100,9,6,0,1,0,100,1,5000,5000,0,0,1,3,10,0,0,0,0,7,0,0,0,0,0,0,0,'Grieff - OOC script 1 - say 4'),
(@NPC_GEIRRVIF*100,9,7,0,1,0,100,1,0,0,0,0,12,@NPC_JHADRAS_13214,7,0,0,1,0,8,0,0,0,8222,3518,625.162,3.559,'Grieff - OOC script 1 - summon Father Jhadras'),
(@NPC_GEIRRVIF*100,9,8,0,1,0,100,1,0,0,0,0,12,@NPC_MASUD_13214,7,0,0,1,0,8,0,0,0,8217,3523,624.908,5.236,'Grieff - OOC script 1 - summon Masud'),
(@NPC_GEIRRVIF*100,9,9,0,1,0,100,1,0,0,0,0,12,@NPC_GENESS_13214,7,0,0,1,0,8,0,0,0,8210,3517,624.6,6.143,'Grieff - OOC script 1 - summon Geness Half-Soul'),
(@NPC_GEIRRVIF*100,9,10,0,1,0,100,1,0,0,0,0,12,@NPC_TALLA_13214,7,0,0,1,0,8,0,0,0,8209,3511,625.117,0.571,'Grieff - OOC script 1 - summon Talla'),
(@NPC_GEIRRVIF*100,9,11,0,1,0,100,1,0,0,0,0,12,@NPC_ELDRETH_13214,7,0,0,1,0,8,0,0,0,8198,3517,625.838,0.089,'Grieff - OOC script 1 - summon Eldreth'),
(@NPC_GEIRRVIF*100,9,12,0,1,0,100,1,0,0,0,0,12,@NPC_RITH_13214,7,0,0,1,0,8,0,0,0,8200,3507,625.339,0.514,'Grieff - OOC script 1 - summon Rith'),
(@NPC_GEIRRVIF*100,9,13,0,1,0,100,1,0,0,0,0,12,@NPC_KILLTRIG_13214,8,0,0,1,0,8,0,0,0,8216,3517,642,4.8,'Grieff - OOC script 1 - summon Kill Triger'),
(@NPC_GEIRRVIF,0,1,2,38,0,100,0,@CREDIT_13214,@CREDIT_13214,0,0,1,4,10,0,0,1,0,7,0,0,0,0,0,0,0,'Grieff - on data set - say 5'),
(@NPC_GEIRRVIF,0,2,3,61,0,100,0,0,0,0,0,69,8216,3516,629,0,1,0,8,0,0,0,8216.25,3516.23,629.357,3.83972,'Grieff - on linked - move to position'),
(@NPC_GEIRRVIF,0,3,4,61,0,100,0,0,0,0,0,81,3,0,0,0,1,0,1,0,0,0,0,0,0,0,'Grieff - on linked - change npc flag'),
(@NPC_GEIRRVIF,0,4,5,61,0,100,0,0,0,0,0,51,0,0,0,0,0,0,11,@NPC_KILLTRIG_13214,100,0,0,0,0,0,'Grieff - on linked - kill trigger'),
(@NPC_GEIRRVIF,0,5,0,61,0,100,0,0,0,0,0,15,@QUEST_FALLENHEROES,0,0,0,0,0,18,80,0,0,0,0,0,0,'Grieff - on linked - kill credit'),
(@NPC_GEIRRVIF,0,6,0,19,0,100,0,@QUEST_KDARKMASTER,0,0,0,80,@NPC_GEIRRVIF*100+1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Grieff - on accept quest 2 - call script 2'),
(@NPC_GEIRRVIF*100+1,9,0,0,1,0,100,1,1000,1000,0,0,69,8216,3516,653,0,0,0,8,0,0,0,8215.81,3515.88,652.885,3.83972,'Grieff - OOC script 2 - move to position'),
(@NPC_GEIRRVIF*100+1,9,1,0,1,0,100,1,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Grieff - OOC script 2 - change npc flag'),
(@NPC_GEIRRVIF*100+1,9,2,0,1,0,100,1,0,0,0,0,45,@DESPAWN_13214,@DESPAWN_13214,0,0,0,0,1,0,0,0,0,0,0,0,'Grieff - OOC script 2 - despawn corpse'),
(@NPC_GEIRRVIF*100+1,9,3,0,1,0,100,1,1000,1000,0,0,1,5,10,0,0,0,0,7,0,0,0,0,0,0,0,'Grieff - OOC script 2 - say 6'),
(@NPC_GEIRRVIF*100+1,9,4,0,1,0,100,1,4000,4000,0,0,1,6,10,0,0,0,0,7,0,0,0,0,0,0,0,'Grieff - OOC script 2 - say 7'),
(@NPC_GEIRRVIF*100+1,9,5,0,1,0,100,1,6000,6000,0,0,1,7,10,0,0,0,0,7,0,0,0,0,0,0,0,'Grieff - OOC script 2 - say 8'),
(@NPC_GEIRRVIF*100+1,9,6,0,1,0,100,1,0,0,0,0,12,@NPC_FAKEKHITRIX_13215,7,0,0,1,0,8,0,0,0,8165,3451,627.199,1.935,'Grieff - OOC script 2 - summon Fake Khitrix the Dark Master'),
(@NPC_GEIRRVIF,0,7,8,38,0,100,0,@CREDIT_13215,@CREDIT_13215,0,0,1,8,10,0,0,1,0,7,0,0,0,0,0,0,0,'Grieff - on data set - say 9'),
(@NPC_GEIRRVIF,0,8,9,61,0,100,0,0,0,0,0,69,8216,3516,629,0,0,0,8,0,0,0,8216.25,3516.23,629.357,3.83972,'Grieff - on linked - move to position'),
(@NPC_GEIRRVIF,0,9,10,61,0,100,0,0,0,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Grieff - on linked - change npc flag'),
(@NPC_GEIRRVIF,0,10,0,61,0,100,0,0,0,0,0,15,@QUEST_KDARKMASTER,0,0,0,0,0,18,80,0,0,0,0,0,0,'Grieff - on linked - kill credit'),
(@NPC_GEIRRVIF,0,11,0,19,0,100,0,@QUEST_SIGRIDICEBORN,0,0,0,80,@NPC_GEIRRVIF*100+2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Grieff - on accept quest 3 - call script 3'),
(@NPC_GEIRRVIF*100+2,9,0,0,1,0,100,1,1000,1000,0,0,69,8216,3516,653,0,0,0,8,0,0,0,8215.81,3515.88,652.885,3.83972,'Grieff - OOC script 3 - move to position'),
(@NPC_GEIRRVIF*100+2,9,1,0,1,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Grieff - OOC script 3 - change npc flag'),
(@NPC_GEIRRVIF*100+2,9,2,0,1,0,100,1,0,0,0,0,45,@DESPAWN_13214,@DESPAWN_13214,0,0,0,0,1,0,0,0,0,0,0,0,'Grieff - OOC script 3 - despawn corpse'),
(@NPC_GEIRRVIF*100+2,9,3,0,1,0,100,1,0,0,0,0,1,9,10,0,0,0,0,7,0,0,0,0,0,0,0,'Grieff - OOC script 3 - say 10'),
(@NPC_GEIRRVIF*100+2,9,4,0,1,0,100,1,9000,9000,0,0,1,10,10,0,0,0,0,7,0,0,0,0,0,0,0,'Grieff - OOC script 3 - say 11'),
(@NPC_GEIRRVIF*100+2,9,5,0,1,0,100,1,0,0,0,0,12,@NPC_FAKESIGRID_13216,7,0,0,1,0,8,0,0,0,8174,3435,674.691,0.383,'Grieff - OOC script 3 - summon Fake Sigrid Iceborn'),
(@NPC_GEIRRVIF,0,12,13,38,0,100,0,@CREDIT_13216,@CREDIT_13216,0,0,1,11,10,0,0,1,0,7,0,0,0,0,0,0,0,'Grieff - on data set - say 12'),
(@NPC_GEIRRVIF,0,13,14,61,0,100,0,0,0,0,0,69,8216,3516,629,0,0,0,8,0,0,0,8216.25,3516.23,629.357,3.83972,'Grieff - on linked - move to position'),
(@NPC_GEIRRVIF,0,14,15,61,0,100,0,0,0,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Grieff - on linked - change npc flag'),
(@NPC_GEIRRVIF,0,15,0,61,0,100,0,0,0,0,0,15,@QUEST_SIGRIDICEBORN,0,0,0,0,0,18,80,0,0,0,0,0,0,'Grieff - on linked - kill credit'),
(@NPC_GEIRRVIF,0,16,0,19,0,100,0,@QUEST_CARNAGE,0,0,0,80,@NPC_GEIRRVIF*100+3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Grieff - on accept quest 4 - call script 4'),
(@NPC_GEIRRVIF*100+3,9,0,0,1,0,100,1,1000,1000,0,0,69,8216,3516,653,0,0,0,8,0,0,0,8215.81,3515.88,652.885,3.83972,'Grieff - OOC script 4 - move to position'),
(@NPC_GEIRRVIF*100+3,9,1,0,1,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Grieff - OOC script 4 - change npc flag'),
(@NPC_GEIRRVIF*100+3,9,2,0,1,0,100,1,0,0,0,0,45,@DESPAWN_13214,@DESPAWN_13214,0,0,0,0,1,0,0,0,0,0,0,0,'Grieff - OOC script 4 - despawn corpse'),
(@NPC_GEIRRVIF*100+3,9,3,0,1,0,100,1,0,0,0,0,1,12,10,0,0,0,0,7,0,0,0,0,0,0,0,'Grieff - OOC script 4 - say 13'),
(@NPC_GEIRRVIF*100+3,9,4,0,1,0,100,1,4000,4000,0,0,1,13,10,0,0,0,0,7,0,0,0,0,0,0,0,'Grieff - OOC script 4 - say 14'),
(@NPC_GEIRRVIF*100+3,9,5,0,1,0,100,1,6000,6000,0,0,1,14,10,0,0,0,0,7,0,0,0,0,0,0,0,'Grieff - OOC script 4 - say 15'),
(@NPC_GEIRRVIF*100+3,9,6,0,1,0,100,1,0,0,0,0,12,@NPC_FAKECARNAGE_13217,7,0,0,1,0,8,0,0,0,8141.532715,3488.100342,626.986084,3.662119,'Grieff - OOC script 4 - summon Fake Carnage'),
(@NPC_GEIRRVIF,0,17,18,38,0,100,0,@CREDIT_13217,@CREDIT_13217,0,0,1,15,10,0,0,1,0,7,0,0,0,0,0,0,0,'Grieff - on data set - say 16'),
(@NPC_GEIRRVIF,0,18,19,61,0,100,0,0,0,0,0,69,8216,3516,629,0,0,0,8,0,0,0,8216.25,3516.23,629.357,3.83972,'Grieff - on linked - move to position'),
(@NPC_GEIRRVIF,0,19,20,61,0,100,0,0,0,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Grieff - on linked - change npc flag'),
(@NPC_GEIRRVIF,0,20,0,61,0,100,0,0,0,0,0,15,@QUEST_CARNAGE,0,0,0,0,0,18,80,0,0,0,0,0,0,'Grieff - on linked - kill credit'),
(@NPC_GEIRRVIF,0,21,0,19,0,100,0,@QUEST_THANE,0,0,0,80,@NPC_GEIRRVIF*100+4,0,0,0,0,0,1,0,0,0,0,0,0,0,'Grieff - on accept quest 5 - call script 5'),
(@NPC_GEIRRVIF*100+4,9,0,0,1,0,100,1,1000,1000,0,0,69,8216,3516,653,0,0,0,8,0,0,0,8215.81,3515.88,652.885,3.83972,'Grieff - OOC script 5 - move to position'),
(@NPC_GEIRRVIF*100+4,9,1,0,1,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Grieff - OOC script 5 - change npc flag'),
(@NPC_GEIRRVIF*100+4,9,2,0,1,0,100,1,0,0,0,0,45,@DESPAWN_13214,@DESPAWN_13214,0,0,0,0,1,0,0,0,0,0,0,0,'Grieff - OOC script 5 - despawn corpse'),
(@NPC_GEIRRVIF*100+4,9,3,0,1,0,100,1,0,0,0,0,1,16,10,0,0,0,0,7,0,0,0,0,0,0,0,'Grieff - OOC script 5 - say 17'),
(@NPC_GEIRRVIF*100+4,9,4,0,1,0,100,1,4000,4000,0,0,1,17,10,0,0,0,0,7,0,0,0,0,0,0,0,'Grieff - OOC script 5 - say 18'),
(@NPC_GEIRRVIF*100+4,9,5,0,1,0,100,1,6000,6000,0,0,1,18,10,0,0,0,0,7,0,0,0,0,0,0,0,'Grieff - OOC script 5 - say 19'),
(@NPC_GEIRRVIF*100+4,9,6,0,1,0,100,1,0,0,0,0,12,@NPC_FAKETHANE_13218,7,0,0,1,0,8,0,0,0,8151.247559,3462.894043,672.115662,0.6877,'Grieff - OOC script 5 - summon Fake Thane Banahogg'),
(@NPC_GEIRRVIF,0,22,23,38,0,100,0,@CREDIT_13218,@CREDIT_13218,0,0,1,19,10,0,0,1,0,7,0,0,0,0,0,0,0,'Grieff - on data set - say 20'),
(@NPC_GEIRRVIF,0,23,24,61,0,100,0,0,0,0,0,69,8216,3516,629,0,0,0,8,0,0,0,8216.25,3516.23,629.357,3.83972,'Grieff - on linked - move to position'),
(@NPC_GEIRRVIF,0,24,25,61,0,100,0,0,0,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Grieff - on linked - change npc flag'),
(@NPC_GEIRRVIF,0,25,0,61,0,100,0,0,0,0,0,15,@QUEST_THANE,0,0,0,0,0,18,80,0,0,0,0,0,0,'Grieff - on linked - kill credit'),
(@NPC_GEIRRVIF,0,26,0,19,0,100,0,@QUEST_FINCHAL,0,0,0,80,@NPC_GEIRRVIF*100+5,0,0,0,0,0,1,0,0,0,0,0,0,0,'Grieff - on accept quest 6 - call script 6'),
(@NPC_GEIRRVIF*100+5,9,0,0,1,0,100,1,1000,1000,0,0,69,8216,3516,653,0,0,0,8,0,0,0,8215.81,3515.88,652.885,3.83972,'Grieff - OOC script 6 - move to position'),
(@NPC_GEIRRVIF*100+5,9,1,0,1,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Grieff - OOC script 6 - change npc flag'),
(@NPC_GEIRRVIF*100+5,9,2,0,1,0,100,1,0,0,0,0,45,@DESPAWN_13214,@DESPAWN_13214,0,0,0,0,1,0,0,0,0,0,0,0,'Grieff - OOC script 6 - despawn corpse'),
(@NPC_GEIRRVIF*100+5,9,3,0,1,0,100,1,0,0,0,0,1,20,10,0,0,0,0,7,0,0,0,0,0,0,0,'Grieff - OOC script 6 - say 21'),
(@NPC_GEIRRVIF*100+5,9,4,0,1,0,100,1,4000,4000,0,0,1,21,10,0,0,0,0,7,0,0,0,0,0,0,0,'Grieff - OOC script 6 - say 22'),
(@NPC_GEIRRVIF*100+5,9,5,0,1,0,100,1,6000,6000,0,0,1,22,10,0,0,0,0,7,0,0,0,0,0,0,0,'Grieff - OOC script 6 - say 23'),
(@NPC_GEIRRVIF*100+5,9,6,0,1,0,100,1,4000,4000,0,0,1,23,10,0,0,0,0,7,0,0,0,0,0,0,0,'Grieff - OOC script 6 - say 24'),
(@NPC_GEIRRVIF*100+5,9,7,0,1,0,100,1,0,0,0,0,12,@NPC_FAKEPRINCSAND_13219,7,0,0,1,0,8,0,0,0,8182.54,3489.78,625.50519,0.63625,'Grieff - OOC script 6 - summon Fake Prince Sandoval'),
(@NPC_GEIRRVIF,0,27,28,38,0,100,0,@CREDIT_13219,@CREDIT_13219,0,0,80,@NPC_GEIRRVIF*100+6,0,0,0,0,0,1,0,0,0,0,0,0,0,'Grieff - on data set - call script 7'),
(@NPC_GEIRRVIF*100+6,9,0,0,1,0,100,1,0,0,0,0,1,24,10,0,0,1,0,7,0,0,0,0,0,0,0,'Grieff - on data set - say 25'),
(@NPC_GEIRRVIF*100+6,9,1,0,1,0,100,0,0,0,0,0,15,@QUEST_FINCHAL,0,0,0,0,0,18,80,0,0,0,0,0,0,'Grieff - OOC script 7 - kill credit'),
(@NPC_GEIRRVIF*100+6,9,2,0,1,0,100,1,0,0,0,0,69,8216,3516,629,0,0,0,8,0,0,0,8216.25,3516.23,629.357,3.83972,'Grieff - on linked - move to position'),
(@NPC_GEIRRVIF*100+6,9,3,0,1,0,100,1,5000,5000,0,0,1,25,10,0,0,1,0,7,0,0,0,0,0,0,0,'Grieff - OOC script 7 - say 26'),
(@NPC_GEIRRVIF*100+6,9,4,0,1,0,100,1,6000,6000,0,0,1,26,10,0,0,1,0,7,0,0,0,0,0,0,0,'Grieff - OOC script 7 - say 27'),
(@NPC_GEIRRVIF*100+6,9,5,0,1,0,100,1,0,0,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Grieff - OOC script 7 - change npc flag'),
(@NPC_GEIRRVIF,0,50,0,38,0,100,0,@KILL_13214,@KILL_13214,0,0,1,27,10,0,0,0,0,1,0,0,0,0,0,0,0,'Greiff - on data set - say kill'),
(@NPC_GEIRRVIF,0,51,0,38,0,100,0,@WIPE_13214,@WIPE_13214,0,0,69,8216,3516,629,0,1,0,8,0,0,0,8216.25,3516.23,629.357,3.83972,'Grieff - on data set - move to position'),
(@NPC_GEIRRVIF,0,52,0,38,0,100,0,@WIPE_13214,@WIPE_13214,0,0,51,0,0,0,0,0,0,11,@NPC_KILLTRIG_13214,100,0,0,0,0,0,'Grieff - on data set - kill triger'),
(@NPC_GEIRRVIF,0,53,0,38,0,100,0,@WIPE_13214,@WIPE_13214,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Grieff - on data set - change npc flag'),
(@NPC_GEIRRVIF,0,54,0,38,0,100,0,@WIPE_13214,@WIPE_13214,0,0,78,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Grieff - on data set - script reset'),
(@NPC_GEIRRVIF,0,55,0,38,0,100,0,@DESPAWN_13219,@DESPAWN_13219,0,0,255,0,0,0,0,0,0,11,@NPC_ELDRETH_13214,200,0,0,0,0,0,'Grieff - on data set - despawn corpse'),
(@NPC_GEIRRVIF,0,56,0,38,0,100,0,@DESPAWN_13219,@DESPAWN_13219,0,0,255,0,0,0,0,0,0,11,@NPC_GENESS_13214,200,0,0,0,0,0,'Grieff - on data set - despawn corpse'),
(@NPC_GEIRRVIF,0,57,0,38,0,100,0,@DESPAWN_13219,@DESPAWN_13219,0,0,255,0,0,0,0,0,0,11,@NPC_JHADRAS_13214,200,0,0,0,0,0,'Grieff - on data set - despawn corpse'),
(@NPC_GEIRRVIF,0,58,0,38,0,100,0,@DESPAWN_13219,@DESPAWN_13219,0,0,255,0,0,0,0,0,0,11,@NPC_MASUD_13214,200,0,0,0,0,0,'Grieff - on data set - despawn corpse'),
(@NPC_GEIRRVIF,0,59,0,38,0,100,0,@DESPAWN_13219,@DESPAWN_13219,0,0,255,0,0,0,0,0,0,11,@NPC_RITH_13214,200,0,0,0,0,0,'Grieff - on data set - despawn corpse'),
(@NPC_GEIRRVIF,0,60,0,38,0,100,0,@DESPAWN_13219,@DESPAWN_13219,0,0,255,0,0,0,0,0,0,11,@NPC_TALLA_13214,200,0,0,0,0,0,'Grieff - on data set - despawn corpse'),
(@NPC_GEIRRVIF,0,61,0,38,0,100,0,@DESPAWN_13219,@DESPAWN_13219,0,0,255,0,0,0,0,0,0,11,@NPC_KHITRIX_13215,200,0,0,0,0,0,'Grieff - on data set - despawn corpse'),
(@NPC_GEIRRVIF,0,62,0,38,0,100,0,@DESPAWN_13219,@DESPAWN_13219,0,0,255,0,0,0,0,0,0,11,@NPC_SIGRID_13216,200,0,0,0,0,0,'Grieff - on data set - despawn corpse'),
(@NPC_GEIRRVIF,0,63,0,38,0,100,0,@DESPAWN_13219,@DESPAWN_13219,0,0,255,0,0,0,0,0,0,11,@NPC_CARNAGE_13217,200,0,0,0,0,0,'Grieff - on data set - despawn corpse'),
(@NPC_GEIRRVIF,0,64,0,38,0,100,0,@DESPAWN_13219,@DESPAWN_13219,0,0,255,0,0,0,0,0,0,11,@NPC_THANE_13218,200,0,0,0,0,0,'Grieff - on data set - despawn corpse'),
(@NPC_GEIRRVIF,0,65,0,38,0,100,0,@DESPAWN_13219,@DESPAWN_13219,0,0,255,0,0,0,0,0,0,11,@NPC_PRINCSAND_13219,200,0,0,0,0,0,'Grieff - on data set - despawn corpse');
DELETE FROM creature_text WHERE entry=@NPC_GEIRRVIF;
INSERT INTO creature_text VALUES
(@NPC_GEIRRVIF,0,0,'Valhalas is yours to win or die in,$N. But whatever you do,stay within the bounds of the arena. To flee is to lose and be dishonored.',12,0,0,0,0,0,'Greiff quest 1 say 1'),
(@NPC_GEIRRVIF,1,1,'$N and her comrades in arms have chosen to accept honorable combat within the sacred confines of Valhalas.',14,0,0,0,0,0,'Greiff quest 1 say 2'),
(@NPC_GEIRRVIF,2,2,'There can only be one outcome to such a battle: death for one side or the other. Let $N prove her self upon the bones of these outsiders who have fallen before!',14,0,0,0,0,0,'Greiff quest 1 say 3'),
(@NPC_GEIRRVIF,3,3,'The fallen heroes of Valhalas emerge from the ground to do battle once more!',41,0,0,0,0,0,'Greiff quest 1 say 4'),
(@NPC_GEIRRVIF,4,4,'$N has defeated the fallen heroes of Valhalas battles past. This is only a beginning,but it will suffice.',14,0,0,0,0,0,'Greiff quest 1 say 5'),
(@NPC_GEIRRVIF,5,5,'Prepare yourself. Khitrix will be entering Valhalas from the southeast. Remember,do not leave the ring or you will lose the battle.',12,0,0,0,0,0,'Greiff quest 2 say 1'),
(@NPC_GEIRRVIF,6,6,'$N has accepted the challenge of Khit-rix the Dark Master. May the gods show mercy upon her for Khitrix surely will not.',14,0,0,0,0,0,'Greiff quest 2 say 2'),
(@NPC_GEIRRVIF,7,7,'Khitrix the Dark Master skitters into Valhalas from the southeast!',41,0,0,0,0,0,'Greiff quest 2 say 3'),
(@NPC_GEIRRVIF,8,8,'Khitrix the Dark Master has been defeated by $N and her band of companions. Let the next challenge be issued!',14,0,0,0,0,0,'Greiff quest 2 sasy 4'),
(@NPC_GEIRRVIF,9,9,'Sigrid Iceborn has returned to the heights of Jotunheim to prove herself against $N. When last they met,$N bester her in personal combat. Let us see the outcome of this match.',14,0,0,0,0,0,'Greiff quest 3 say 1'),
(@NPC_GEIRRVIF,10,10,'Circling Valhalas,Sigrid Iceborn approaches to seek her revenge! ',41,0,0,0,0,0,'Greiff quest 3 say 2'),
(@NPC_GEIRRVIF,11,11,'$N has defeated Sigrid Iceborn for a second time. Well,this time he did it with the help of his friends,but a win is a win!',14,0,0,0,0,0,'Greiff quest 3 say 3'),
(@NPC_GEIRRVIF,12,12,'Carnage is coming! Remember,no matter what you do,do NOT leave the battle ring or I will disqualify you and your group.',12,0,0,0,0,0,'Greiff quest 4 say 1'),
(@NPC_GEIRRVIF,13,13,'From the bowels of the Underhalls comes Carnage. Brave and foolish $N has accepted the challenge. $N and her group stand ready to face the monstrosity.',14,0,0,0,0,0,'Greiff quest 4 say 2'),
(@NPC_GEIRRVIF,14,14,'Lumbering in from the south,the smell of Carnage precedes him!',41,0,0,0,0,0,'Greiff quest 4 say 3'),
(@NPC_GEIRRVIF,15,15,'The horror known as Carnage is no more. Could it be that $N is truly worthy of battle in Valhalas? We shall see.',14,0,0,0,0,0,'Greiff quest 4 say 4'),
(@NPC_GEIRRVIF,16,16,'Look to the southeast and you will see the thane upon the platform near Gjonner the Merciless when he shows himself. Let him come down. Stay within the ring of Valhalas.',12,0,0,0,0,0,'Greiff quest 5 say 1'),
(@NPC_GEIRRVIF,17,17,'Thane Banahogg returns to Valhalas for the first time in ages to prove that the vrykul are the only beings worthy to fight within its sacred ring. Will $N prove him wrong?',14,0,0,0,0,0,'Greiff quest 5 say 2'),
(@NPC_GEIRRVIF,18,18,'Thane Banahogg appears upon the overlook to the southeast!',41,0,0,0,0,0,'Greiff quest 5 say 3'),
(@NPC_GEIRRVIF,19,19,'Thane Banahogg the Deathblow has fallen to $N and his fighting companions. He has but one challenge ahead of him. Who will it be?',14,0,0,0,0,0,'Greiff quest 5 say 4'),
(@NPC_GEIRRVIF,20,20,'Its too late to run now. Do not leave the ring. Die bravely,$N!',12,0,0,0,0,0,'Greiff quest 6 say 1'),
(@NPC_GEIRRVIF,21,21,'From the depths of Icecrown Citadel,one of the Lich Kings chosen comes to put an end to the existence of $N and her friends.',14,0,0,0,0,0,'Greiff quest 6 say 2'),
(@NPC_GEIRRVIF,22,22,'Warriors of Jotunheim,I present to you,Blood Prince Sandoval!',14,0,0,0,0,0,'Greiff quest 6 say 3'),
(@NPC_GEIRRVIF,23,23,'Without warning,Prince Sandoval magically appears within Valhalas! ',41,0,0,0,0,0,'Greiff quest 6 say 4'),
(@NPC_GEIRRVIF,24,24,'The unthinkable has happened... $N has slain Prince Sandoval!',14,0,0,0,0,0,'Greiff quest 6 say 5'),
(@NPC_GEIRRVIF,25,25,'In defeating him,he and his fighting companions have proven themselves worthy of battle in this most sacred place of vrykul honor.',14,0,0,0,0,0,'Greiff quest 6 say 6'),
(@NPC_GEIRRVIF,26,26,'ALL HAIL $N,CHAMPION OF VALHALAS!',14,0,0,0,0,0,'Greiff quest 6 say 7'),
(@NPC_GEIRRVIF,27,27,'You were not prepared!',14,0,0,0,0,0,'Greiff kill');

-- Into The Wild Green Yonder
DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceEntry IN (56683,56684);
INSERT INTO conditions (SourceTypeOrReferenceId,SourceGroup,SourceEntry,SourceId,ElseGroup,ConditionTypeOrReference,ConditionTarget,ConditionValue1,ConditionValue2,ConditionValue3,NegativeCondition,ErrorType,ErrorTextId,ScriptName,Comment) VALUES 
(17,0,56683,0,0,29,0,30407,10,0,0,0,11130,'','Grab Captured Crusader - near Captured Crusader only'),
(17,0,56684,0,0,29,0,30407,5,0,0,0,11131,'','Drop Off Captured Crusader - near Captured Crusader'),
(17,0,56684,0,0,29,0,30227,15,0,0,0,11132,'','Drop Off Captured Crusader - near Penumbrius');
DELETE FROM trinity_string WHERE entry IN (11130,11131,11132);
INSERT INTO trinity_string (entry,content_default,content_loc1,content_loc2,content_loc3,content_loc4,content_loc5,content_loc6,content_loc7,content_loc8)VALUES
(11130,'Out of range.',NULL ,NULL ,NULL ,NULL ,NULL ,NULL ,NULL ,NULL),
(11131,'You are not carrying a passenger. There is nobody to drop off.',NULL ,NULL ,NULL ,NULL ,NULL ,NULL ,NULL ,NULL),
(11132,'Requires Vanguard Infirmary',NULL ,NULL ,NULL ,NULL ,NULL ,NULL ,NULL ,NULL);

-- The Last Line Of Defense(hacked)
DELETE FROM creature WHERE id IN (30575,30593);
INSERT INTO creature (guid,id,map,spawnMask,phaseMask,modelid,equipment_id,position_x,position_y,position_z,orientation,spawntimesecs,spawndist,currentwaypoint,curhealth,curmana,MovementType,npcflag,unit_flags,dynamicflags) VALUES
(400001,30575,571,1,2,0,0,6331.4,88.8509,390.937,3.12386,300,0,0,133550,0,0,0,0,0),
(400002,30575,571,1,2,0,0,6283.49,124.636,387.324,4.25876,90,0,0,133550,0,0,0,0,0),
(400003,30575,571,1,2,0,0,6215.11,110.319,378.377,4.68602,90,0,0,133550,0,0,0,0,0),
(400004,30575,571,1,2,0,0,6184.78,107.358,377.91,4.89415,90,0,0,133550,0,0,0,0,0),
(400005,30575,571,1,2,0,0,6153.81,89.0671,372.086,5.7738,90,0,0,133550,0,0,0,0,0),
(400006,30593,571,1,2,0,0,6320.77,71.0191,387.851,3.26444,300,0,0,11379,3725,0,0,0,0),
(400007,30593,571,1,2,0,0,6318,87.9225,390.493,3.56839,60,0,0,11379,3725,0,0,0,0),
(400008,30593,571,1,2,0,0,6304.8,96.4371,390.965,3.56839,60,0,0,11770,3809,0,0,0,0),
(400009,30593,571,1,2,0,0,6305.65,102.874,390.911,3.56839,300,0,0,11379,3725,0,0,0,0),
(400010,30593,571,1,2,0,0,6298.11,111.942,390.97,4.41504,300,0,0,11770,3809,0,0,0,0),
(400011,30593,571,1,2,0,0,6282.16,112.804,387.948,4.41504,60,0,0,11379,3725,0,0,0,0),
(400012,30593,571,1,2,0,0,6267.13,117.408,384.458,4.41504,300,0,0,11770,3809,0,0,0,0),
(400013,30593,571,1,2,0,0,6263.81,125.739,383.982,4.41504,60,0,0,11770,3809,0,0,0,0),
(400014,30593,571,1,2,0,0,6214.55,102.677,377.062,4.85801,60,0,0,11379,3725,0,0,0,0),
(400015,30593,571,1,2,0,0,6196.02,99.5433,378.738,5.27898,300,0,0,11379,3725,0,0,0,0),
(400016,30593,571,1,2,0,0,6183.21,99.6499,377.831,4.70407,300,0,0,11379,3725,0,0,0,0),
(400017,30593,571,1,2,0,0,6162.35,95.0256,372.981,4.70407,300,0,0,11770,3809,0,0,0,0),
(400018,30593,571,1,2,0,0,6313.54,71.1646,387.15,3.39953,300,0,0,11379,3725,0,0,0,0),
(400019,30593,571,1,2,0,0,6307.98,89.4228,390.457,3.99643,300,0,0,11770,3809,0,0,0,0),
(400020,30593,571,1,2,0,0,6295.91,101.322,391.027,3.99643,60,0,0,11770,3809,0,0,0,0),
(400021,30593,571,1,2,0,0,6284.61,111.154,388.627,4.28546,300,0,0,11379,3725,0,0,0,0),
(400022,30593,571,1,2,0,0,6264.15,120.458,383.93,4.5682,60,0,0,11379,3725,0,0,0,0),
(400023,30593,571,1,2,0,0,6278.15,118.426,386.818,4.5682,300,0,0,11770,3809,0,0,0,0),
(400024,30593,571,1,2,0,0,6222.88,118.478,380.041,4.80147,60,0,0,11379,3725,0,0,0,0),
(400025,30593,571,1,2,0,0,6208.01,111.628,378.222,5.02138,300,0,0,11379,3725,0,0,0,0),
(400026,30593,571,1,2,0,0,6199.47,106.545,378.001,5.39837,300,0,0,11379,3725,0,0,0,0),
(400027,30593,571,1,2,0,0,6189.27,98.9416,378.545,5.24286,300,0,0,11379,3725,0,0,0,0),
(400028,30593,571,1,2,0,0,6169.04,90.8861,372.519,5.24051,300,0,0,11770,3809,0,0,0,0),
(400029,30593,571,1,2,0,0,6299.66,82.2275,388.127,3.45294,60,0,0,11379,3725,0,0,0,0),
(400030,30593,571,1,2,0,0,6303.65,83.3883,388.668,3.45294,300,0,0,11770,3809,0,0,0,0),
(400031,30593,571,1,2,0,0,6295.81,104.921,390.971,3.79459,60,0,0,11379,3725,0,0,0,0),
(400032,30593,571,1,2,0,0,6282.08,113.643,387.877,4.03728,300,0,0,11770,3809,0,0,0,0),
(400033,30593,571,1,2,0,0,6267.84,114.05,384.574,4.38678,300,0,0,11379,3725,0,0,0,0),
(400034,30593,571,1,2,0,0,6268.04,116.358,384.663,4.84859,60,0,0,11770,3809,0,0,0,0),
(400035,30593,571,1,2,0,0,6196.61,102.512,378.372,4.88786,300,0,0,11379,3725,0,0,0,0),
(400036,30593,571,1,2,0,0,6184.55,100.373,378.033,4.88786,300,0,0,11770,3809,0,0,0,0),
(400037,30593,571,1,2,0,0,6170.76,97.9293,374.982,5.23344,300,0,0,11379,3725,0,0,0,0),
(400038,30593,571,1,2,0,0,6270.02,113.255,385.14,4.34594,300,0,0,11770,3809,0,0,0,0),
(400039,30593,571,1,2,0,0,6277.86,110.245,387.108,4.34594,300,0,0,11379,3725,0,0,0,0),
(400040,30593,571,1,2,0,0,6278.25,111.26,387.197,4.34594,60,0,0,11379,3725,0,0,0,0),
(400041,30593,571,1,2,0,0,6312.24,98.218,391.211,3.53541,300,0,0,11379,3725,0,0,0,0),
(400042,30593,571,1,2,0,0,6307.08,110.629,390.985,3.53541,60,0,0,11379,3725,0,0,0,0),
(400043,30593,571,1,2,0,0,6297.4,100.035,391.02,3.97209,300,0,0,11379,3725,0,0,0,0),
(400044,30593,571,1,2,0,0,6326.81,73.1693,388.79,3.04532,300,0,0,11770,3809,0,0,0,0),
(400045,30593,571,1,2,0,0,6326.87,76.6933,389.288,3.04532,300,0,0,11770,3809,0,0,0,0),
(400046,30593,571,1,2,0,0,6384.74,184.095,393.253,5.01903,60,0,0,11770,3809,0,0,0,0),
(400047,30593,571,1,2,0,0,6378.93,182.257,393.02,5.01903,300,0,0,11379,3725,0,0,0,0),
(400048,30593,571,1,2,0,0,6378.93,182.257,393.02,5.47142,60,0,0,11770,3809,0,0,0,0),
(400049,30593,571,1,2,0,0,6306.33,170.027,385.64,3.57311,60,0,0,11770,3809,0,0,0,0),
(400050,30593,571,1,2,0,0,6301.27,157.653,385.51,2.75315,300,0,0,11379,3725,0,0,0,0),
(400051,30593,571,1,2,0,0,6298.18,163.7,384.79,2.04315,60,0,0,11379,3725,0,0,0,0),
(400052,30593,571,1,2,0,0,6254.09,164.131,381.543,2.04315,300,0,0,11379,3725,0,0,0,0),
(400053,30593,571,1,2,0,0,6235.74,172.668,380.761,0.497487,300,0,0,11770,3809,0,0,0,0),
(400054,30593,571,1,2,0,0,6255.47,180.365,381.927,4.5847,300,0,0,11379,3725,0,0,0,0),
(400055,30593,571,1,2,0,0,6340.54,203.268,390.783,4.41977,60,0,0,11379,3725,0,0,0,0),
(400056,30593,571,1,2,0,0,6345.91,201.06,391.256,3.49221,300,0,0,11379,3725,0,0,0,0),
(400057,30593,571,1,2,0,0,6339.84,191.426,389.88,1.71171,60,0,0,11379,3725,0,0,0,0),
(400058,30593,571,1,2,0,0,6298.28,226.988,391.22,0.494344,60,0,0,11379,3725,0,0,0,0),
(400059,30593,571,1,2,0,0,6303.2,217.868,391.327,0.855628,300,0,0,11770,3809,0,0,0,0),
(400060,30593,571,1,2,0,0,6315.51,74.1584,387.321,3.26681,300,0,0,11379,3725,0,0,0,0),
(400061,30593,571,1,2,0,0,6313.65,87.9609,390.324,3.76789,300,0,0,11770,3809,0,0,0,0),
(400062,30593,571,1,2,0,0,6310.58,82.5035,388.796,3.78988,60,0,0,11770,3809,0,0,0,0),
(400063,30593,571,1,2,0,0,6294.26,105.373,390.879,4.26426,60,0,0,11770,3809,0,0,0,0),
(400064,30593,571,1,2,0,0,6275.9,114.199,386.612,4.26426,60,0,0,11770,3809,0,0,0,0),
(400065,30593,571,1,2,0,0,6264.5,116.245,383.942,5.00568,300,0,0,11379,3725,0,0,0,0),
(400066,30593,571,1,2,0,0,6216.12,95.7466,376.99,3.97052,300,0,0,11379,3725,0,0,0,0),
(400067,30593,571,1,2,0,0,6200.66,106.421,377.886,4.39307,300,0,0,11379,3725,0,0,0,0),
(400068,30593,571,1,2,0,0,6187.33,99.8284,378.374,4.63811,300,0,0,11379,3725,0,0,0,0),
(400069,30593,571,1,2,0,0,6168.03,87.6857,371.97,5.17453,300,0,0,11770,3809,0,0,0,0),
(400070,30593,571,1,2,0,0,6158.57,82.9728,370.911,6.0102,300,0,0,11770,3809,0,0,0,0),
(400071,30593,571,1,2,0,0,6189.67,92.6928,378.915,4.89493,60,0,0,11770,3809,0,0,0,0),
(400072,30593,571,1,2,0,0,6283.65,113.575,388.187,4.20693,60,0,0,11379,3725,0,0,0,0),
(400073,30593,571,1,2,0,0,6309.33,96.3138,391.161,3.86921,60,0,0,11770,3809,0,0,0,0),
(400074,30593,571,1,2,0,0,6228.81,147.797,379.92,0.890326,60,0,0,11770,3809,0,0,0,0),
(400075,30593,571,1,2,0,0,6379.98,175.943,393.006,2.16502,60,0,0,0,0,0,0,0,0),
(400076,30593,571,1,2,0,0,6378.16,173.599,392.823,1.26213,300,0,0,0,0,0,0,0,0),
(400077,30593,571,1,2,0,0,6378.25,173.028,392.841,1.32914,300,0,0,0,0,0,0,0,0),
(400078,30593,571,1,2,0,0,6375.89,145.23,392.858,4.27931,60,0,0,11379,3725,0,0,0,0);
UPDATE creature SET phaseMask=66 WHERE id IN (30593,30575);
UPDATE creature_template SET faction_A=16,
faction_H=16 WHERE entry IN (30593,30575);
UPDATE  creature_template SET  unit_flags=32772,
AIName= 'NullAI' WHERE  entry=30236;
UPDATE  creature_template SET  unit_flags=32768,
spell4=57387,
AIName= 'SmartAI' WHERE  entry=30236;
DELETE FROM smart_scripts WHERE entryorguid=30236;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
(30236,0,0,0,27,0,100,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Argent Cannon - root when passenger boarded'),
(30236,0,1,0,28,0,100,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Argent Cannon - remove root when passenger removed');

-- some quest chaining
UPDATE quest_template SET PrevQuestId=13104,
NextQuestId=0 WHERE ExclusiveGroup=-13118;
UPDATE quest_template SET PrevQuestId=13118,
NextQuestId=0 WHERE Id=13125;
UPDATE quest_template SET PrevQuestId=13104,
NextQuestId=0 WHERE Id IN (13130,13135);
UPDATE  quest_template SET  PrevQuestId=13125 WHERE  Id=13139;

-- The Restless Dead
UPDATE  quest_template SET  RequiredSpellCast1=0 WHERE  Id=13110;

-- A Tale of Valor
UPDATE  creature_template_addon SET  auras=57626 WHERE  creature_template_addon.entry=30562;
