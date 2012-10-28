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
   (10, '[PvP][Зоны]', 0, 0, 0);

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
/*Нордскол */
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
(200, '[Зимняя PvP зона][1 голд]', 5211.83, -4814.35, 700.857, 1, 0.821071, 0, 10000);

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

-- npc arena_top_team
DELETE FROM `creature_template` WHERE `entry` = 100090;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES
('100090', '0', '0', '0', '0', '0', '27164', '0', '0', '0', 'Arena TeamTop', '', '', '0', '59', '61', '0', '35', '35', '1', '1.48', '1.14286', '0.0', '0', '655.0', '663.0', '0', '158', '1.0', '1500', '1900', '1', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.0', '100', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', 'npc_arena_teamTop', '1');

-- npc actions
DELETE FROM `creature_template` WHERE `entry` = 100006;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES
('100006', '0', '0', '0', '0', '0', '19960', '0', '0', '0', 'Акционер', '', '', '0', '59', '61', '0', '35', '35', '1', '1.48', '1.14286', '0.0', '0', '655.0', '663.0', '0', '158', '1.0', '1500', '1900', '1', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.0', '100', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', 'npc_other', '1');

-- Disable TEST totems
DELETE FROM `disables` WHERE `sourceType`=0 AND `entry` IN (23789,61904);
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `comment`) VALUES
(0, 23789, 8, 'Stoneclaw Totem TEST - can crash client by spawning too many totems'),
(0, 61904, 8, 'Magma Totem TEST - can crash client by spawning too many totems');

-- Русификация конечного эвента в Пещерах Стенаний
UPDATE `script_texts` SET `content_loc8` = 'Я должен сделать необходимые приготовления перед тем, как Ритуал Пробуждения начнется. Вы должны защитить меня!' WHERE `entry` = -1043001;
UPDATE `script_texts` SET `content_loc8` = 'Эти пещеры были когда-то храмом, который подавал надежду на возобновление растительности в Степи. Теперь это залы начных кошмаров.' WHERE `entry` = -1043002;
UPDATE `script_texts` SET `content_loc8` = 'Пошлите! Мы должны продолжать. Еще нужно сделать много дел, прежде чем мы сможем вытащить Наралекса из его кошмара.' WHERE `entry` = -1043003;
UPDATE `script_texts` SET `content_loc8` = 'В этом круге огня я должен произнести заклинание, которое должно изгнать духов, убитых Повелителями Змей.' WHERE `entry` = -1043004;
UPDATE `script_texts` SET `content_loc8` = 'Пещеры были очищены. Теперь мы идем к Наралексу!' WHERE `entry` = -1043005;
UPDATE `script_texts` SET `content_loc8` = 'Помимо кошмара, Наралекс заключен в вечный сон. Нужно разбудить его пока не стало слишком поздно!' WHERE `entry` = -1043006;
UPDATE `script_texts` SET `content_loc8` = 'Защищайте меня, Смельчаки! Я буду углубляться в Изумрудный Сон, чтобы спасти Наралекса и положить конец этому!' WHERE `entry` = -1043007;
UPDATE `script_texts` SET `content_loc8` = 'Это Мутанус Пожиратель является главной преградой пробуждения Наралекса! Без сомнений.' WHERE `entry` = -10430012;
UPDATE `script_texts` SET `content_loc8` = 'Ах, я вырвался из страшного кошмара! Я благодарю тебя, мой верный ученик, вместе с храбрым товарищами.' WHERE `entry` = -10430015;
UPDATE `script_texts` SET `content_loc8` = 'Мы должны идти и встретиться с другими учениками. Предстоит сделать много работы, прежде чем я могу сделать еще одну попытку восстановить Степи. Прощайте, Смельчаки!' WHERE `entry` = -10430016;
UPDATE `script_texts` SET `content_loc8` = 'Наконец-то! Наралекса можно пробудить! Ну помогите мне, смелые искатели приключений!' WHERE `entry` = -1043000;
UPDATE `script_texts` SET `content_loc8` = 'Наконец-то! Я пробудился!' WHERE `entry` = -1043013;
UPDATE `script_texts` SET `content_loc8` = '%S начал выполнять Ритуал по пробуждению Наралекса' WHERE `entry` = -1043008;
UPDATE `script_texts` SET `content_loc8` = '%S судорожно метается в кошмарном сне.' WHERE `entry` = -1043009;
UPDATE `script_texts` SET `content_loc8` = '%S корчится в муках. Ученик пытается ему помочь!' WHERE `entry` = -1043010;
UPDATE `script_texts` SET `content_loc8` = '%S увидел ужастное видение. Что-то шевелится под мутной воде.' WHERE `entry` = -1043011;

-- Перевод по квесту 898
UPDATE `script_texts` SET `content_loc8` = 'Будь рядом, $n. Мне понадобится твоя помощь. Возможно мне удастся вырваться отсюда. Пошли!' WHERE `entry` = -1000370;
UPDATE `script_texts` SET `content_loc8` = 'Наконец-то! Северная часовня не охраняется! Мне нужно время, чтобы отдышаться!' WHERE `entry` = -1000371;
UPDATE `script_texts` SET `content_loc8` = 'Теперь я чувствую себя лучше. Давайте вернемся к побегу. Пошли, $n.' WHERE `entry` = -1000372;
UPDATE `script_texts` SET `content_loc8` = 'Похоже, что Флибустьеры Южных морей сильно закрепились на побережье. Это может стать проблемой.' WHERE `entry` = -1000373;
UPDATE `script_texts` SET `content_loc8` = 'Помогай! $C атакуют!' WHERE `entry` = -1000374;
UPDATE `script_texts` SET `content_loc8` = 'Пришло время для мести!' WHERE `entry` = -1000375;
UPDATE `script_texts` SET `content_loc8` = '$C идет прямо на нас!' WHERE `entry` = -1000376;
UPDATE `script_texts` SET `content_loc8` = 'Получай, $C' WHERE `entry` = -1000377;
UPDATE `script_texts` SET `content_loc8` = 'Мы почти добрались! Давай ускоримся...' WHERE `entry` = -1000378;
UPDATE `script_texts` SET `content_loc8` = 'Ах, сладкий воздух побега.' WHERE `entry` = -1000379;
UPDATE `script_texts` SET `content_loc8` = 'Капитан Тало`тас Сияющий, $N помог мне сбежать! $N, я уверен, капитан вознаградит ваше мужество.' WHERE `entry` = -1000380;

-- Фикс квеста 4921 "Пропавшая без вести"
UPDATE `creature_template` SET `npcflag` = 3 WHERE `entry` = 10668;

-- Русификация начальной зоны Рыцарей смерти.
UPDATE `script_texts` SET `content_loc8` = 'Ты сделал большую ошибку, злодей!' WHERE `entry` = -1609000;
UPDATE `script_texts` SET `content_loc8` = 'Когда-то я был воином Света... Посмотрите, чем я стал...' WHERE `entry` = -1609001;
UPDATE `script_texts` SET `content_loc8` = 'Смерть это единственное лекарство!' WHERE `entry` = -1609016;
UPDATE `script_texts` SET `content_loc8` = 'В бой!' WHERE `entry` IN (1609012, 1609008);
UPDATE `script_texts` SET `content_loc8` = 'Я выиграю свою свободу и оставлю это проклятое место!' WHERE `entry` = -1609005;
UPDATE `script_texts` SET `content_loc8` = 'Нет спасения' WHERE `entry` = -1609080;
UPDATE `script_texts` SET `content_loc8` = 'Запомни этот день, $n, ибо это тот день, когда ты будешь повержен!' WHERE `entry` = -1609081;
UPDATE `script_texts` SET `content_loc8` = 'Не смеши меня.' WHERE `entry` = -1609083;

-- the ICC-wise buffs
INSERT IGNORE INTO `spell_area` VALUES ('73822', '4812', '0', '0', '0', '690', '2', '1', '64', '11');
INSERT IGNORE INTO `spell_area` VALUES ('73828', '4812', '0', '0', '0', '1101', '2', '1', '64', '11');

-- Лут Склеп Аркавона
-- Аркавон
REPLACE INTO `creature_loot_template` VALUES ('31125', '40801', '3.33', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '47241', '100', '1', '0', '2', '2');
REPLACE INTO `creature_loot_template` VALUES ('31125', '41031', '1.11', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '42003', '3.33', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '40783', '3.33', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '40989', '1.11', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '41135', '1.11', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39588', '1.11', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39497', '3.33', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39603', '1.11', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39638', '1.11', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39597', '1.11', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39639', '1.11', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39546', '1.11', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39618', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39606', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39498', '3.33', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '41771', '1.11', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '41969', '3.33', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '41957', '3.33', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39593', '1.11', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39592', '1.11', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39589', '1.11', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '41162', '1.11', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39612', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '40803', '3.33', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39500', '3.33', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '41291', '1.11', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '41296', '1.11', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '40904', '1.66', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '41857', '1.66', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '41302', '1.11', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '41314', '1.11', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '41085', '3.33', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '41862', '1.66', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '42015', '3.33', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '40988', '1.11', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '41005', '1.11', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '40840', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '41079', '1.11', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39620', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39623', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39641', '1.11', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39630', '1.11', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39523', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '40842', '1.66', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '40802', '1.66', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '41648', '3.33', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '41938', '1.66', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '41925', '1.66', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '40781', '3.33', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '41025', '1.11', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '40925', '1.66', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '40782', '1.66', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '41765', '3.33', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '41665', '1.11', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '41659', '1.11', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '41308', '1.11', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '41284', '1.11', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '40841', '3.33', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '41872', '1.66', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '41919', '1.66', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39607', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39609', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39611', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '41653', '3.33', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '40937', '1.66', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '42001', '3.33', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '40999', '1.11', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39622', '0', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39634', '1.11', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39555', '1.11', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39544', '1.11', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39632', '1.11', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39538', '1.11', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39547', '1.11', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39629', '1.11', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39557', '1.11', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39564', '3.33', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39560', '3.33', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39601', '1.11', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39558', '3.33', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39517', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39530', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39636', '1.11', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39493', '3.33', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39617', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39492', '3.33', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39582', '3.33', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39543', '1.11', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39591', '1.11', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39595', '1.11', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39495', '3.33', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39554', '1.11', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39626', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39624', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39580', '3.33', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39579', '3.33', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39539', '1.11', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39519', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39515', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39528', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '39633', '1.11', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('16905', '31125', '0.044', '1', '0', '-31125', '1');
REPLACE INTO `creature_loot_template` VALUES ('31125', '41950', '3.33', '1', '2', '1', '1');

-- Коралон
REPLACE INTO `creature_loot_template` VALUES ('35013', '41060', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41927', '1.25', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41864', '1.25', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41293', '0.83', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41655', '2.5', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41199', '0.83', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48276', '5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48097', '2.5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48067', '2.5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48653', '1.66', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48596', '1.66', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '40847', '2.5', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41971', '2.5', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '40927', '1.25', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41137', '0.83', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '40849', '1.25', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48314', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48153', '1.66', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48155', '1.66', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48069', '2.5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48459', '2.5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48130', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48342', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '47802', '5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '47800', '5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48298', '1.66', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48369', '1.66', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48312', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '47980', '2.5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48074', '2.5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '40848', '2.5', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41143', '2.5', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48533', '2.5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48476', '2.5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48254', '5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48603', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48574', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48635', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48605', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48337', '1.66', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48367', '1.66', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48480', '2.5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '40808', '1.25', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41874', '1.25', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41033', '0.83', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41001', '0.83', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41767', '2.5', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48559', '2.5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48502', '2.5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48282', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48344', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48185', '1.66', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48630', '1.66', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48504', '2.5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48561', '2.5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48568', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48633', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48445', '2.5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '47785', '5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '47783', '5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41007', '0.83', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41027', '0.83', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '47775', '5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '47773', '5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48628', '1.66', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48099', '2.5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48457', '2.5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48387', '2.5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48213', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48162', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48296', '1.66', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48339', '1.66', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48192', '1.66', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48183', '1.66', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48389', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41959', '2.5', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41298', '0.83', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '47982', '2.5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41225', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '42005', '2.5', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48537', '2.5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48215', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48284', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48373', '0', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '40939', '1.25', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '40809', '2.5', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48132', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48252', '5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41287', '0.83', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41940', '1.25', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41773', '0.83', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48072', '2.5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48222', '5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48220', '5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48598', '1.66', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48655', '1.66', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41304', '0.83', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41667', '0.83', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41205', '2.5', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '40807', '2.5', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '42017', '2.5', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48278', '5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48190', '1.66', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48246', '5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48244', '5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48375', '2.5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48449', '2.5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '47750', '5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '47752', '5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '48160', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41065', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41235', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41051', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41070', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41885', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41903', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41230', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41055', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41075', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '42035', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '42034', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '46373', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '42038', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '42040', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '42036', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '42039', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '42037', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '40882', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '40977', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '40881', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '40976', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41893', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41909', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41881', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41898', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '42075', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '42074', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '42070', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '42072', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '42069', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '42073', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '42071', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '40889', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '40983', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41836', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41621', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41635', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41832', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41617', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41630', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '42117', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '42116', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41840', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41625', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '41640', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '44083', '2', '1', '0', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '43959', '2', '1', '0', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('35013', '47241', '100', '1', '0', '2', '2');

-- Торавон
REPLACE INTO `creature_loot_template` VALUES ('38433', '50844', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '50836', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '50831', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '50842', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '50849', '2.5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '50079', '2.5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '50090', '5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '50088', '5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '50391', '2.5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '50242', '5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '50081', '0', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '50847', '2.5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '50325', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '50861', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '50766', '2.5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '50833', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '50327', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '50769', '2.5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '50856', '2.5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41774', '0.83', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '42078', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41631', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41052', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '42047', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '50107', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '50822', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '50240', '5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '50827', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '50825', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41071', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41618', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41875', '1.25', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '50109', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '50114', '5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '42018', '2.5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41076', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '50116', '5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '50838', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41299', '0.83', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '44083', '2', '1', '0', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41636', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '42118', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '42082', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '46374', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41138', '0.83', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '50866', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '50097', '2.5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41886', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41904', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '42006', '2.5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41656', '2.5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41622', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41056', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '40978', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '49426', '100', '1', '0', '2', '2');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41882', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '43959', '2', '1', '0', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41641', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41841', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '50868', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '50095', '2.5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '50393', '2.5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '42076', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '42042', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41833', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '42045', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41626', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41008', '0.83', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '40984', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '50277', '5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '50275', '5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '50863', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41231', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '40883', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '42080', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41294', '0.83', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41236', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41899', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '40890', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41226', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41200', '0.83', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41061', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '50820', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '50854', '2.5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '40810', '2.5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41034', '0.83', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41028', '0.83', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41002', '0.83', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '42041', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41837', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41305', '0.83', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41668', '0.83', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41288', '0.83', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41865', '1.25', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '42043', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '40850', '2.5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41066', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41206', '2.5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41941', '1.25', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '42081', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '42119', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41894', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '40940', '1.25', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41768', '2.5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '42077', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '42044', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '40979', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '42079', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '40884', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '40812', '1.25', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41910', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41144', '2.5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41960', '2.5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41928', '1.25', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '40928', '1.25', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '42046', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '40811', '2.5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '41972', '2.5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '40852', '1.25', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('38433', '40851', '2.5', '1', '2', '1', '1');

-- Эмалон
REPLACE INTO `creature_loot_template` VALUES ('33993', '45419', '5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '45403', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '42114', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '45347', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '45376', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '45379', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '45355', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '45357', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '45370', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '45406', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '45416', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '45338', '2.5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '45337', '2.5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '45371', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '45383', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '45384', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '45420', '5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '45430', '2.5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '45345', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '45362', '5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '45360', '5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '46131', '5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '45367', '5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '45401', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '45343', '2.5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '45414', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '45351', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '45353', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '45397', '5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '45426', '2.5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '45432', '2.5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '40806', '2.5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '45427', '0', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '45341', '2.5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '40938', '1.25', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '40846', '1.25', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41136', '0.83', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41926', '1.25', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41286', '0.83', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '40845', '2.5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41142', '2.5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41303', '0.83', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41654', '2.5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '42004', '2.5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '40804', '2.5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '42016', '2.5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '40880', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '45387', '2.5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41006', '0.83', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41026', '0.83', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '40844', '2.5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41958', '2.5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '45392', '2.5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '45409', '1.66', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41970', '2.5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41204', '2.5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41198', '0.83', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41766', '2.5', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '40926', '1.25', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41000', '0.83', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41772', '0.83', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41292', '0.83', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41873', '1.25', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41939', '1.25', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41032', '0.83', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41863', '1.25', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '40805', '1.25', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41666', '0.83', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41297', '0.83', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '45394', '2.5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '45388', '2.5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '45399', '5', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '42115', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41835', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41897', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41880', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '40974', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '40879', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41902', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41234', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41831', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '40982', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '40888', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '42067', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '42068', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '40975', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '42027', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '42028', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41229', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41884', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41224', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41839', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41908', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41892', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41629', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41054', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41069', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41064', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41639', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41624', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41616', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41634', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41620', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '42029', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41074', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41048', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '41059', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '42066', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '42062', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '42065', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '42030', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '42064', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '42063', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '42032', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '42033', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '42031', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` VALUES ('33993', '47241', '100', '1', '0', '2', '2');