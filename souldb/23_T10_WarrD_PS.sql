INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES 

('-71072', '-70849', '0', 'Item - Warrior melee T10 4P bonus (Slam)'),

('-71069', '-70849', '0', 'Item - Warrior melee T10 4P bonus (Execute)');


DELETE FROM `spell_script_names` WHERE `spell_id` = 46916 AND `ScriptName` = 'spell_warr_slam' LIMIT 1;
