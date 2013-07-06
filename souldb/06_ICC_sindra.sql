UPDATE `creature_template` SET `unit_flags` = '0',`unit_flags2` = '0',
`dynamicflags` = '0',
`type_flags` = '0',flags_extra = 128 WHERE `creature_template`.`entry` =37503 LIMIT 1 ;

UPDATE `creature_template` SET `faction_A` = '14',
`faction_H` = '14' WHERE `creature_template`.`entry` =37232 LIMIT 1 ;