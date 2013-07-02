-- IoC
-- Fix recuperacion de vida de Catapult Horde
UPDATE `creature_template` SET `RegenHealth`='0' WHERE `entry`='34793';
