set names utf8;

-- fix https://github.com/Vitasic/Battle/commit/65584a98e6b4a9fcd48664df9eaaa5295de8c031
DROP TABLE IF EXISTS `arena_logs`;
CREATE TABLE `arena_logs` (
  `team1` int(10) unsigned NOT NULL DEFAULT '0',
  `team1_members` varchar(60) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `team1_rating_change` int(11) NOT NULL DEFAULT '0',
  `team2` int(10) unsigned NOT NULL DEFAULT '0',
  `team2_members` varchar(60) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `team2_rating_change` int(11) NOT NULL DEFAULT '0',
  `winner` int(10) unsigned NOT NULL DEFAULT '0',
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`team1`,`team2`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Зарезервировал некоторые имена, присущие административному составу.
REPLACE INTO `reserved_name` (`name`) VALUES
('Разработчик'),
('Гм'),
('Gm'),
('Администратор'),
('Админ'),
('Куратор'),
('Admin'),
('Administrator'),
('Gamemaster'),
('Гейммастер'),
('Разраб'),
('Developer'),
('Модератор'),
('Moderator'),
('Moder'),
('Модер');