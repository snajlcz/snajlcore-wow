set names utf8;

-- npc tele
DROP TABLE IF EXISTS `custom_npc_tele_category`;
CREATE TABLE `custom_npc_tele_category` (
  `id` int(6) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `flag` tinyint(3) unsigned NOT NULL default '0',
  `data0` bigint(20) unsigned NOT NULL default '0',
  `data1` int(6) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `custom_npc_tele_destination`;
CREATE TABLE `custom_npc_tele_destination` (
  `id` int(6) unsigned NOT NULL auto_increment,
  `name` char(100) NOT NULL default '',
  `pos_X` float NOT NULL default '0',
  `pos_Y` float NOT NULL default '0',
  `pos_Z` float NOT NULL default '0',
  `map` smallint(5) unsigned NOT NULL default '0',
  `orientation` float NOT NULL default '0',
  `level` tinyint(3) unsigned NOT NULL default '0',
  `cost` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `custom_npc_tele_association`;
CREATE TABLE `custom_npc_tele_association` (
  `cat_id` int(6) unsigned NOT NULL default '0',
  `dest_id` int(6) unsigned NOT NULL default '0',
  PRIMARY KEY  (`cat_id`, `dest_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

TRUNCATE `custom_npc_tele_category`;
INSERT INTO `custom_npc_tele_category`
   (`id`, `name`, `flag`, `data0`, `data1`)
VALUES
   (1, 'Азерот', 0, 1, 0),
   (2, 'Калимдор', 0, 2, 0),
   (3, 'Нордскол', 0, 0, 0),
   (4, 'Запределье', 0, 0, 0),
   (5, 'Арены', 0, 0, 0),
   (6, '[Инсты для уровней 1-60]', 0, 0, 0),
   (7, '[Инсты для уровней 60+]', 5, 60, 0),
   (8, '[Инсты для уровней 70+]', 5, 70, 0),
   (10, '[PvP Zona]', 0, 0, 0);

TRUNCATE `custom_npc_tele_destination`;
INSERT INTO `custom_npc_tele_destination`
   (`id`, `name`, `pos_X`, `pos_Y`, `pos_Z`, `map`, `orientation`, `level`, `cost`)
VALUES
(1, 'Альтеракская долина-[1 голд]', 883.187, -489.375, 96.7618, 30, 3.06932, 0, 10000),
(2, 'Альтеракская долина-[1 голд]', -818.155, -623.043, 54.0884, 30, 2.1, 0, 10000),
(3, 'Низина Арати-[1 голд]', 686.053, 683.165, -12.9149, 529, 0.18, 0, 10000),
(4, 'Низина Арати-[1 голд]', 1308.68, 1306.03, -9.0107, 529, 3.91285, 0, 10000),
(5, 'Черный храм-[2 голд]', -3610.72, 324.988, 37.4, 530, 3.28298, 0, 20000),
(6, 'Непроглядная Пучина-[1 голд]', 4254.58, 664.74, -29.04, 1, 1.97, 0, 10000),
(7, 'Глубины Черной горы-[2 голд]', -7301.03, -913.19, 165.37, 0, 0.08, 0, 20000),
(8, 'Вершина Черной горы-[2 голд]', -7535.43, -1212.04, 285.45, 0, 5.29, 0, 20000),
(9, 'Логово Крыла Тьмы-[1 голд]', -7665.55, -1102.49, 400.679, 469, 0, 0, 10000),
(10, 'Пещеры Времени-[1 голд]', -8173.66, -4746.36, 33.8423, 1, 4.93989, 0, 10000),
(11, 'Круг Крови-[1 голд]', 2839.44, 5930.17, 11.1002, 530, 3.16284, 0, 10000),
(12, 'Резервуар Кривого Клыка-[1 голд]', 517.288, 6976.28, 32.0072, 530, 0, 0, 10000),
/*Калимдор--->*/
(13, 'Дарнас-[1 голд]', 9947.52, 2482.73, 1316.21, 1, 0, 0, 10000),
(14, 'Забытый Город-[2 голд]', -3982.47, 1127.79, 161.02, 1, 0.05, 0, 20000),
(15, 'Экзодар-[1 голд]', -4073.03, -12020.4, -1.47, 530, 0, 0, 10000),
(16, 'Око Бури-[1 голд]', 2487.72, 1609.12, 1224.64, 566, 3.35671, 0, 10000),
(17, 'Око Бури-[1 голд]', 1843.73, 1529.77, 1224.43, 566, 0.297579, 0, 10000),
/* Азерот---> */
(18, 'Златоземье-[1 голд]', -9464, 62, 56, 0, 0, 0, 10000),
(19, 'Логово Груула-[1 голд]', 3539.01, 5082.36, 1.69107, 530, 0, 0, 10000),
(20, 'Арена Гурубаши-[1 голд]', -13261.3, 168.294, 35.0792, 0, 1.00688, 0, 10000),
(21, 'Цитадель Адского пламени-[1 голд]', -305.816, 3056.4, -2.47318, 530, 2.01, 0, 10000),
/* Азерот---> */
(22, 'Стальгорн-[1 голд]', -4924.07, -951.95, 501.55, 0, 5.4, 0, 10000),
/* Азерот---> */
(23, 'Остров Кель-Данас-[2 голд]', 12947.4, -6893.31, 5.68398, 530, 3.09154, 0, 20000),
(24, 'Каражан-[1 голд]', -11118.8, -2010.84, 47.0807, 0, 0, 0, 10000),
(25, 'Мародон-[1 голд]', -1433.33, 2955.34, 96.21, 1, 4.82, 0, 10000),
(26, 'Огненные Недра-[1 голд]', 1121.45, -454.317, -101.33, 230, 3.5, 0, 10000),
(27, 'Проклятый лес-[1 голд]', 3125.18, -3748.02, 136.049, 0, 0, 0, 10000),
(28, 'Логово Ониксии-[1 голд]', -4707.44, -3726.82, 54.6723, 1, 3.8, 0, 10000),
/*Калимдор--->*/
(29, 'Оргриммар-[1 голд]', 1552.5, -4420.66, 8.94802, 1, 0, 0, 10000),
/*Калимдор--->*/
(30, 'Колючий холм-[1 голд]', 315.721, -4743.4, 10.4867, 1, 0, 0, 10000),
(31, 'Курганы Иглошкурых-[1 голд]', -4645.08, -2470.85, 85.53, 1, 4.39, 0, 10000),
(32, 'Лабиринты Иглошкурых-[1 голд]', -4484.04, -1739.4, 86.47, 1, 1.23, 0, 10000),
(33, 'Круг испытаний-[1 голд]', -1999.94, 6581.71, 11.32, 530, 2.3, 0, 10000),
(34, 'Врата Анкиража-[2 голд]', -8409.03, 1498.83, 27.3615, 1, 2.49757, 0, 20000),
(35, 'Некроситет-[2 голд]', 1219.01, -2604.66, 85.61, 0, 0.5, 0, 20000),
(36, 'Крепость Тёмного клыка-[1 голд]', -254.47, 1524.68, 76.89, 0, 1.56, 0, 10000),
(37, 'Шаттрат-[2 голд]', -1850.21, 5435.82, -10.9614, 530, 3.40391, 0, 20000),
/*Калимдор--->*/
(38, 'Луносвет-[1 голд]', 9338.74, -7277.27, 13.7895, 530, 0, 0, 10000),
/* Азерот---> */
(39, 'Штормград-[1 голд]', -8960.14, 516.266, 96.3568, 0, 0, 0, 10000),
(40, 'Стратхольм-[1 голд]', 3263.54, -3379.46, 143.59, 0, 0, 0, 10000),
(41, 'Крепость Бурь-[1 голд]', 3089.58, 1399.05, 187.653, 530, 4.79407, 0, 10000),
(42, 'Храм Анкиража-[2 голд]', -8245.84, 1983.74, 129.072, 1, 0.936195, 0, 20000),
(43, 'Мёртвые копи-[1 голд]', -11212, 1658.58, 25.67, 0, 1.45, 0, 10000),
(44, 'Забытый город (Ристалище)-[2 голд]', -3761.49, 1133.43, 132.083, 1, 4.57259, 0, 20000),
(45, 'Монастырь Алого Ордена-[2 голд]', 2843.89, -693.74, 139.32, 0, 5.11, 0, 20000),
(46, 'Затонувший храм-[2 голд]', -10346.9, -3851.9, -43.41, 0, 6.09, 0, 20000),
(47, 'Пещеры стенаний-[2 голд]', -722.53, -2226.3, 16.94, 1, 2.71, 0, 20000),
/*Калимдор--->*/
(48, 'Громовой утёс-[1 голд]', -1290, 147.034, 129.682, 1, 4.919, 0, 10000),
(49, 'Ульдаман-[1 голд]', -6119.7, -2957.3, 204.11, 0, 0.03, 0, 10000),
/*Калимдор--->*/
(50, 'Подгород-[2 голд]', 1819.71, 238.79, 60.5321, 0, 0, 0, 20000),
(51, 'Ущелье песни войны-[1 голд]', 930.851, 1431.57, 345.537, 489, 0.015704, 0, 10000),
(52, 'Ущелье песни войны-[1 голд]', 1525.95, 1481.66, 352.001, 489, 3.20756, 0, 10000),
(53, 'Зул-Аман-[2 голд]', 6846.95, -7954.5, 170.028, 530, 4.61501, 0, 20000),
(54, 'Зул-Фаррак-[2 голд]', -6839.39, -2911.03, 8.87, 1, 0.41, 0, 20000),
(55, 'Зул-Гуруб-[2 голд]', -11916.7, -1212.82, 92.2868, 0, 4.6095, 0, 20000),
/*Нордскоп */
(56, 'Борейская тундра-[5 голд]',2232.93, 5135.5, 5.344, 571, 0, 58, 50000),
(57, 'Ревущий Фьорд-[5 голд]',592.33,-5095.5,6,571, 0 ,58, 50000),
(58, 'Драконий погост-[5 голд]',2994,-431,124,571, 0 , 58, 50000),
(59, 'Седые холмы-[5 голд]',3264,-4587.4,305,571, 0 , 58, 50000),
(60, 'Зул-Драк-[5 голд]',5443.19,-1244.50,249,571, 0 , 58, 50000),
(61, 'Низина Шолазар-[5 голд]',4679.54,5534.24,30,571, 0 , 58, 50000),
(62, 'Лес Хрустальной песни-[5 голд]',5626.613770,692.057495,155.459274,571, 0 , 58, 50000),
(63, 'Грозовая гряда-[5 голд]',6950.2,-1639.9,811,571, 0 ,58, 50000),
(64, 'Ледяная корона-[5 голд]',5816.269043,2219.722900,636.041260,571 , 0, 58, 50000),
(65, 'Даларан-[5 голд]',5780.27,700.56,650,571,0,58, 50000), 
(66, 'ОЛО-[5 голд]',4928.43,3341.9,377,571, 0, 58, 50000),
/*Запределье*/
(67, 'п-ов. Адского Пламени-[2 голд]',-690.621765,2688.105957,94.167122, 530, 2.34, 0, 20000),
(68, 'Долина призрачной луны-[2 голд]', -3532.437744,500.730988,23.343836, 530, 0, 0, 20000),
(69, 'Лес Террокар-[2 голд]', -2000.469971,4451.540039,8.379170 , 530, 0, 0, 20000),
(70, 'Шаттрат-[2 голд]', -1850.21, 5435.82, -10.9614, 530, 3.40391, 0, 20000),
(71, 'Зангартопь-[2 голд]',-54.862099,5813.439941,20.605860 , 530, 0, 0, 20000),
(72, 'Награнд-[2 голд]',-1145.949951,8182.350098,3.602490, 530, 0, 0, 20000),
(73, 'Пустоверть-[2 голд]',3830.229980,3426.50000,88.614502, 530, 0, 0, 20000),
(74, 'Острогорье-[2 голд]',2960.623291,5467.751953,143.896393, 530, 0, 0, 20000),
/* Азерот */
(75, 'Тернистая долина-[2 голд]',-12644.299805,-377.411011,10.102100, 0, 0, 0, 20000),
(76, 'Выженные земли-[2 голд]',-11182.500000,-3016.669922,7.422350, 0, 0, 0, 20000),
(77, 'Красногорье-[2 голд]',-9283.380859,-2238.212891,63.524048, 0, 0, 0, 20000),
(78, 'Нагорье Арати-[2 голд]',-1240.679077,-2510.138184,21.612902 , 0, 0, 0, 20000),
(79, 'Тирисфальские Леса-[2 голд]',2036.642822,163.509277,33.869953, 0, 0, 0, 20000),
/*Калимдор*/
(80, 'Силитус-[2 голд]',-7426.870117,1005.309998,1.133590, 1, 0, 0, 20000),
(81, 'Когтиcтые горы-[2 голд]',1570.920044,1031.520020,137.959000, 1, 0, 0, 20000),
(82, 'Танарис-[2 голд]',-7113.228027,-3768.110352,8.453617, 1, 0, 0, 20000),
(83, 'Фералас-[2 голд]',-4841.1899441,1309.439941,81.393700, 1, 0, 0, 20000),
(84, 'Зимние ключи-[2 голд]',6762.071777,-4422.065918,763.285522 , 1, 0, 0, 20000),
/*PvP Зоны*/
(200, '[Astranaar PvP]', 2719.135010, -359.703308, 109.644691, 1, 5.614521, 0, 0);

TRUNCATE `custom_npc_tele_association`;
INSERT INTO `custom_npc_tele_association`
  (`cat_id`, `dest_id`)
VALUES
  (1, 18), (1, 22), (1, 23),(1, 39),(1, 75),(1, 76),(1, 77),(1, 78),(1, 79),(2, 23),(2, 15),(2, 13), (2, 29), (2, 30), (2, 38), (2, 48), (2, 50), /*(3, 1), (3, 4), (3, 16), (3, 52),*/(2, 80), (2, 81),(2, 82),(2, 83),(2, 84), (3, 56), (3, 57), (3, 58), (3, 59), (3, 60), (3, 61), (3, 62), (3, 63), (3, 64), (3, 65),(3, 66),(4, 67), (4, 68), (4, 69), (4, 70), (4, 71), (4, 72), (4, 73), (4, 74), (5, 11), (5, 20), (5, 33), (5, 44), (6, 6), (6, 7), (6, 8), (6, 14), (6, 25), (6, 31), (6, 32), (6, 35), (6, 36), (6, 40), (6, 43), (6, 45), (6, 46), (6, 47), (6, 49), (6, 54), (7, 9), (7, 26), (7, 27), (7, 28), (7, 34), (7, 42), (7, 55), (8, 5), (8, 10), (8, 12), (8, 19), (8, 21), (8, 24), (8, 41), (8, 53), (9, 100), (10, 200);

-- `npc_tele_text`
REPLACE INTO `npc_text` (`ID`, `text0_0`) VALUES
   (100000, 'Choose your Category.'),
   (100001, 'Choose your Destination.');

-- `creature_template_npc_tele`
DELETE FROM `creature_template` WHERE `entry` = 100000;
INSERT INTO `creature_template` VALUES (100000, 0, 0, 0, 0, 0, 19645, 0, 0, 0, 'Маршрутка', '', '', 0, 83, 83, 0, 35, 35, 1, 1, 1.14286, 2, 1, 509, 683, 0, 805, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 371, 535, 135, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 2, 'npc_teleport', 1);

-- Фикс пропажи арены из тк :D 
INSERT IGNORE INTO battleground_template (id, MinPlayersPerTeam, MaxPlayersPerTeam, MinLvl, MaxLvl, AllianceStartLoc, AllianceStartO, HordeStartLoc, HordeStartO, StartMaxDist, Weight, ScriptName, Comment) VALUES
(6, 0, 2, 10, 80, 0, 0, 0, 0, 0, 1, '', 'All Arena');

-- Запрос к моду "Возможность писать в чат, исходя из проведенного онлайна"
DELETE FROM `trinity_string` WHERE `entry` = 11019;
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc8`) VALUES
(11019, 'Your chat is disabled. So you can write to chat, draw in the game for another %s seconds', 'Ваш чат отключен. Чтобы вы смогли написать в чат, проведите в игре еще %s секунд');

-- npc actions
DELETE FROM `creature_template` WHERE `entry` = 100006;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES
('100006', '0', '0', '0', '0', '0', '19960', '0', '0', '0', 'Акционер', '', '', '0', '59', '61', '0', '35', '35', '1', '1.48', '1.14286', '0.0', '0', '655.0', '663.0', '0', '158', '1.0', '1500', '1900', '1', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.0', '100', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', 'npc_other', '1');

-- Disable TEST totems
DELETE FROM `disables` WHERE `sourceType`=0 AND `entry` IN (23789,61904);
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `comment`) VALUES
(0, 23789, 8, 'Stoneclaw Totem TEST - can crash client by spawning too many totems'),
(0, 61904, 8, 'Magma Totem TEST - can crash client by spawning too many totems');

-- the ICC-wise buffs
INSERT IGNORE INTO `spell_area` VALUES ('73822', '4812', '0', '0', '0', '690', '2', '1', '64', '11');
INSERT IGNORE INTO `spell_area` VALUES ('73828', '4812', '0', '0', '0', '1101', '2', '1', '64', '11');

-- Лут АМК: Книга познания символов
-- http://ru.wowhead.com/item=45912#dropped-by:0+3-9-8+1 
REPLACE INTO `creature_loot_template` VALUES ('30666', '45912', '1', '1', '0', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('30660', '45912', '1', '1', '0', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('30667', '45912', '1', '1', '0', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('30668', '45912', '1', '1', '0', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('32191', '45912', '1', '1', '0', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('30695', '45912', '1', '1', '0', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('30893', '45912', '1', '1', '0', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('30892', '45912', '1', '1', '0', '1', '1');

-- Npc GC
DELETE FROM `creature_template` WHERE `entry` = 100500;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES
('100500', '0', '0', '0', '0', '0', '21572', '0', '0', '0', 'GC', '', '', '0', '59', '61', '0', '35', '35', '1', '1.48', '1.14286', '0.0', '0', '655.0', '663.0', '0', '158', '1.0', '1500', '1900', '1', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.0', '100', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', 'npc_gc_vendor', '1');

-- Npc crypt_run
DELETE FROM `creature_template` WHERE `entry` IN (100600, 100601, 100602, 100603, 100604, 100605);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES
('100600', '0', '0', '0', '0', '0', '12917', '0', '0', '0', 'soulstone_altar', '', '', '0', '59', '61', '0', '35', '35', '1', '1.48', '1.14286', '0.0', '0', '655.0', '663.0', '0', '158', '1.0', '1500', '1900', '1', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.0', '100', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', 'npc_soulstone_altar', '1'),
('100601', '0', '0', '0', '0', '0', '12917', '0', '0', '0', 'door_checker', '', '', '0', '59', '61', '0', '35', '35', '1', '1.48', '1.14286', '0.0', '0', '655.0', '663.0', '0', '158', '1.0', '1500', '1900', '1', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.0', '100', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', 'npc_door_checker', '1'),
('100602', '0', '0', '0', '0', '0', '12917', '0', '0', '0', 'crypt_bomb', '', '', '0', '59', '61', '0', '35', '35', '1', '1.48', '1.14286', '0.0', '0', '655.0', '663.0', '0', '158', '1.0', '1500', '1900', '1', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.0', '100', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', 'npc_crypt_bomb', '1'),
('100602', '0', '0', '0', '0', '0', '12917', '0', '0', '0', 'trap_trigger', '', '', '0', '59', '61', '0', '35', '35', '1', '1.48', '1.14286', '0.0', '0', '655.0', '663.0', '0', '158', '1.0', '1500', '1900', '1', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.0', '100', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', 'npc_trap_trigger', '1'),
('100604', '0', '0', '0', '0', '0', '12917', '0', '0', '0', 'race_announcer', '', '', '0', '59', '61', '0', '35', '35', '1', '1.48', '1.14286', '0.0', '0', '655.0', '663.0', '0', '158', '1.0', '1500', '1900', '1', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.0', '100', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', 'npc_race_announcer', '1'),

-- fix metro (штормград - стальгорн)
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(5865, 176080, 369, 1, 1, 4.58065, 28.2097, 7.01107, 1.5708, 0, 0, 1, 0, 120, 0, 1),
(5866, 176081, 369, 1, 1, 4.52807, 8.43529, 7.01107, 1.5708, 0, 0, 1, 0, 120, 0, 1),
(5863, 176082, 369, 1, 1, -45.4005, 2492.79, 6.9886, 1.5708, 0, 0, 1, 0, 120, 0, 1),
(16394, 176083, 369, 1, 1, -45.4007, 2512.15, 6.9886, 1.5708, 0, 0, 1, 0, 120, 0, 1),
(5864, 176084, 369, 1, 1, -45.3934, 2472.93, 6.9886, -1.5708, 0, 0, 1, 0, 120, 0, 1),
(15363, 176085, 369, 1, 1, 4.49883, -11.3475, 7.01107, 1.5708, 0, 0, 1, 0, 120, 0, 1);

-- Количество соединений
UPDATE `trinity_string` SET `content_loc8`='Всего соединений: %u (максимум: %u). Игроков в очереди: %u (максимум: %u).' WHERE `entry`='12';

-- fix bug kills and honor (spell_priest)
-- Spell script assignment
SET @ENTRY := 27827;
DELETE FROM spell_script_names WHERE spell_id = @ENTRY;
INSERT INTO spell_script_names (spell_id, ScriptName) VALUES
(@ENTRY, 'spell_priest_spirit_of_redemption');

-- Npc vendor start items
REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES (190011, 0, 0, 0, 0, 0, 22931, 0, 22931, 0, '��������� ����', 'RuWoW.net', '', 0, 83, 83, 0, 35, 35, 4224, 2, 2, 1, 2, 50, 150, 0, 1000, 100, 2000, 1500, 1, 2, 0, 0, 0, 0, 0, 0, 100, 200, 1000, 7, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 1000, '', 0, 3, 100, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '', 12340);   

DELETE FROM `npc_vendor` WHERE (`entry`=190011);   
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES   
(190011, 0, 44100, 0, 0, 0),   
(190011, 0, 44094, 0, 0, 0),  
(190011, 0, 44095, 0, 0, 0),  
(190011, 0, 42947, 0, 0, 0),  
(190011, 0, 48687, 0, 0, 0),  
(190011, 0, 42984, 0, 0, 0),  
(190011, 0, 44105, 0, 0, 0),  
(190011, 0, 48716, 0, 0, 0),  
(190011, 0, 42945, 0, 0, 0),  
(190011, 0, 42946, 0, 0, 0),  
(190011, 0, 48691, 0, 0, 0),  
(190011, 0, 42985, 0, 0, 0),  
(190011, 0, 44107, 0, 0, 0),  
(190011, 0, 44103, 0, 0, 0),  
(190011, 0, 48689, 0, 0, 0),  
(190011, 0, 42952, 0, 0, 0),  
(190011, 0, 44096, 0, 0, 0),  
(190011, 0, 42948, 0, 0, 0),  
(190011, 0, 48677, 0, 0, 0),  
(190011, 0, 48683, 0, 0, 0),  
(190011, 0, 42950, 0, 0, 0),  
(190011, 0, 42943, 0, 0, 0),  
(190011, 0, 44091, 0, 0, 0),  
(190011, 0, 44092, 0, 0, 0),  
(190011, 0, 48685, 0, 0, 0),  
(190011, 0, 42949, 0, 0, 0),  
(190011, 0, 42992, 0, 0, 0),  
(190011, 0, 48718, 0, 0, 0),  
(190011, 0, 50255, 0, 0, 0),  
(190011, 0, 42944, 0, 0, 0),  
(190011, 0, 44102, 0, 0, 0),  
(190011, 0, 42991, 0, 0, 0),  
(190011, 0, 42951, 0, 0, 0),  
(190011, 0, 44099, 0, 0, 0),  
(190011, 0, 44093, 0, 0, 0),  
(190011, 0, 44098, 0, 0, 0),  
(190011, 0, 44097, 0, 0, 0),  
(190011, 0, 44101, 0, 0, 0); 

--Start items vendor world position
delete from `creature` where id='190011';
INSERT INTO `creature` VALUES (2041698, 190010, 1, 1, 1, 0, 0, 16225.4, 16263, 13.2664, 3.39211, 300, 0, 0, 6300, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (2041699, 190010, 0, 1, 1, 0, 0, -8845.71, 625.332, 94.3701, 0.527352, 300, 0, 0, 6300, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (2041700, 190010, 1, 1, 1, 0, 0, 1578.86, -4416.98, 8.05379, 3.37953, 300, 0, 0, 6300, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (2042126, 190011, 0, 1, 1, 0, 0, -8946.95, -130.54, 83.5782, 3.35365, 300, 0, 0, 290400, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (2042140, 190011, 0, 1, 1, 0, 0, -6234.88, 334.657, 383.157, 3.4911, 300, 0, 0, 290400, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (2042143, 190011, 530, 1, 1, 0, 0, -3973.69, -13921.4, 100.225, 5.50405, 300, 0, 0, 290400, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (2042144, 190011, 1, 1, 1, 0, 0, 10329.9, 829.408, 1326.34, 3.18305, 300, 0, 0, 290400, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (2042145, 190011, 1, 1, 1, 0, 0, -605.898, -4252.05, 38.9562, 3.23192, 300, 0, 0, 290400, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (2042146, 190011, 0, 1, 1, 0, 0, 1656.77, 1682.65, 120.719, 0.0796728, 300, 0, 0, 290400, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (2042147, 190011, 1, 1, 1, 0, 0, -2909.44, -254.251, 52.9413, 3.23977, 300, 0, 0, 290400, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (2042148, 190011, 530, 1, 1, 0, 0, 10353, -6357.92, 33.6385, 2.7478, 300, 0, 0, 290400, 0, 0, 0, 0, 0);

-- Proc de Limpieza sagrada
UPDATE `spell_proc_event` SET `Cooldown`= 16 WHERE `entry`= 53553;