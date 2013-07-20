DELETE FROM spell_script_names WHERE spell_id IN (63802,63803,64466,63322,64164,64168,64555,55945,56096);
INSERT INTO spell_script_names (spell_id,ScriptName) VALUES
(63802,'spell_yogg_saron_brain_link'),
(63803,'spell_yogg_saron_brain_link_damage'),
(64466,'spell_yogg_saron_empowering_shadows_range_check'),
(63322,'spell_general_vezax_saronite_vapors'),
(64164,'spell_yogg_saron_lunatic_gaze'),
(64168,'spell_yogg_saron_lunatic_gaze'),
(64555,'spell_yogg_saron_insane_periodic'),
(55945,"spell_gen_spectator_cheer_trigger"),
(56096,"spell_gen_vendor_bark_trigger");
UPDATE creature_template SET npcflag=129,gossip_menu_id=50000,ScriptName='npc_argent_pet',IconName= 'Speak' WHERE entry=33238;
UPDATE creature_template SET npcflag=129,gossip_menu_id=50001,ScriptName='npc_argent_pet',IconName= 'Speak' WHERE entry=33239;
DELETE FROM spell_script_names WHERE spell_id=19873;
INSERT INTO spell_script_names (spell_id,ScriptName) VALUES
(19873,'spell_egg_event');
UPDATE instance_template SET script= 'instance_the_black_morass' WHERE map=269;
insert  into spell_script_names(spell_id,ScriptName) values (66515,'spell_gen_reflective_shield');
UPDATE gameobject_template SET flags=32,ScriptName='go_not_push_button' WHERE entry=194739;

/* CREATURE TeMPLATE
(35545,0,0,0,0,0,25528,0,0,0,'Risen Jaeren Sunsworn','Black Knight''s Minion','',0,80,80,2,35,35,0,1,1.14286,1,0,422,586,0,642,1,0,0,1,0,8,0,0,0,0,0,345,509,103,6,72,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,2.5,1,1,0,0,0,0,0,0,0,0,1,8388624,0,'npc_risen_announcer',12340),
*/

UPDATE spell_script_names SET ScriptName='spell_pursued' WHERE spell_id=62374;
DELETE FROM spell_script_names WHERE spell_id=62791;
UPDATE creature_template SET ScriptName='npc_observation_ring_keeper' WHERE entry IN (@FREYA_GOSSIP,@HODIR_GOSSIP,@THORIM_GOSSIP,@MIMIRON_GOSSIP);
UPDATE creature_template SET ScriptName='npc_yogg_saron_keeper' WHERE entry IN (@FREYA_YS,@HODIR_YS,@THORIM_YS,@MIMIRON_YS);

DELETE FROM spell_script_names WHERE spell_id IN (51015,51154,51157,64174,64172,62650,62670,62671,68645,62702);
INSERT INTO spell_script_names (spell_id,ScriptName) VALUES
(51015,'spell_random_ingredient_aura'),
(51154,'spell_random_ingredient_aura'),
(51157,'spell_random_ingredient_aura'),
(64174,'spell_yogg_saron_hodirs_protective_gaze'),
(64172,'spell_yogg_saron_titanic_storm'),
(62650,'spell_yogg_saron_keeper_aura'),
(62670,'spell_yogg_saron_keeper_aura'),
(62671,'spell_yogg_saron_keeper_aura'),
(68645,'spell_rocket_pack'),
(62702,'spell_yogg_saron_keeper_aura');

UPDATE creature_template SET ScriptName='npc_argent_combatant' WHERE entry IN (33448,33707);       
UPDATE creature_template SET ScriptName='npc_quest_givers_argent_tournament' WHERE entry IN (33593,33592,33225,33312,33335,33379,33373,33361,33403,33372);
UPDATE creature_template SET ScriptName='npc_crok_scourgebane_argent' WHERE entry=33762;
UPDATE gameobject_template SET ScriptName='go_finklesteins_cauldron' WHERE entry=190498;

DELETE FROM spell_script_names WHERE spell_id IN (51134,51105,51107,51046);
INSERT INTO spell_script_names (spell_id,ScriptName) VALUES
(51134,'spell_random_ingredient'),
(51105,'spell_random_ingredient'),
(51107,'spell_random_ingredient'),
(51046,'spell_pot_check');

UPDATE  creature_template SET  ScriptName= 'npc_ashtongue_channeler' WHERE  entry=23421;
UPDATE  creature_template SET  ScriptName= 'npc_creature_generator_akama' WHERE  entry=23210;
UPDATE  creature_template SET  ScriptName= 'npc_ashtongue_sorcerer' WHERE  entry=23215;
UPDATE  creature_template SET  ScriptName= 'npc_ashtongue_defender' WHERE  entry=23216;
UPDATE  creature_template SET  ScriptName= 'npc_ashtongue_rogue' WHERE  entry=23316;
UPDATE  creature_template SET  ScriptName= 'npc_ashtongue_elementalist' WHERE  entry=23523;
UPDATE  creature_template SET  ScriptName= 'npc_ashtongue_spiritbinder' WHERE  entry=23524;
UPDATE  creature_template SET  ScriptName= 'npc_parasitic_shadowfiend' WHERE  entry=23498;
UPDATE  creature_template SET  ScriptName= 'npc_doom_blossom' WHERE  entry=23123;
UPDATE  creature_template SET  ScriptName= 'npc_shadowy_construct' WHERE  entry=23111;
UPDATE  creature_template SET  ScriptName= 'npc_illidari_council' WHERE  entry=23426;
UPDATE  creature_template SET  ScriptName= 'npc_blood_elf_council_voice_trigger' WHERE  entry=23499;
UPDATE  creature_template SET  ScriptName= 'npc_rizzle_sprysprocket' WHERE  entry=23002;
UPDATE  creature_template SET  ScriptName= 'npc_depth_charge' WHERE  entry=23025;
UPDATE  creature_template SET  ScriptName= 'npc_webbed_creature' WHERE  entry=17680;
UPDATE  creature_template SET  ScriptName= 'npc_wrathbone_flayer' WHERE  entry=22953;
UPDATE  creature_template SET  ScriptName= 'npc_flame_of_azzinoth' WHERE  entry=22997;
UPDATE  creature_template SET  ScriptName= 'npc_blade_of_azzinoth' WHERE  entry=22996;
UPDATE  creature_template SET  ScriptName= 'npc_shadow_demon' WHERE  entry=23375;
UPDATE  creature_template SET  ScriptName= 'npc_enchanted_elemental' WHERE  entry=21958;
UPDATE  creature_template SET  ScriptName= 'npc_tainted_elemental' WHERE  entry=22009;
-- TODO

