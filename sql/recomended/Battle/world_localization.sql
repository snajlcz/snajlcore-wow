set names utf8;

-- Offlike rusification
DELETE FROM `locales_creature_text` WHERE `entry` IN (36855,36612,36948,36939,37030,37033,37032,37003,37026,36998,37813,37187,37181,37183,37187,37200,37119);
INSERT INTO `locales_creature_text`(`entry`,`textGroup`,`id`,`text_loc1`,`text_loc2`,`text_loc3`,`text_loc4`,`text_loc5`,`text_loc6`,`text_loc7`,`text_loc8`) VALUES
(36855,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вы здесь потому, что наделены особым знанием: вы понимаете, что на мир пало проклятье слепоты!'),
(36855,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вам удалось сквозь пелену лжи разглядеть источник истиной силы!'),
(36855,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Посмотрите на свои руки, задумайтесь над нелепостью их строения!'),
(36855,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Кожа, мускулы, кровь, что пульсирует в жилах, все это говорит о вашем несовершенстве, вашей слабости. Создатели жестоко пошутили над вами!'),
(36855,4,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Чем раньше вы осознаете собственную ущербность, тем скорее выберете иной путь!'),
(36855,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Для нашего господина нет ничего невозможного, его сила не знает границ, ничто не может сломить его волю!'),
(36855,6,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Тот, кто откажется повиноваться будет уничтожен. Тот же, кто будет служить ему верой и правдой, достигнет таких высот, о которых вы не в силах даже помыслить!'),
(36855,7,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Как вы смеете ступать в эти священные покои, это место станет вашей могилой!'),
(36855,8,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Довольно! Пришла пора взять все в свои руки!'),
(36855,10,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ты не в силах противится моей воле!'),
(36855,11,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Прими это благословение и покажи чужакам мощь нашего господина!'),
(36855,12,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Я освобождаю тебя от проклятья плоти, мой верный слуга!'),
(36855,13,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Восстань и обрети истинную форму!'),
(36855,14,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вы осознали бессмысленность своих действий?'),
(36855,14,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ступай во тьму... Вечную тьму!'),
(36855,15,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Мне надоел этот фарс!'),
(36855,16,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'На все воля господина...Ваша смерть неизбежна...'),

(36612,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Смертные! Ваш путь закончится, так и не начавшись. Никто не смеет входить в обитель господина!'),
(36612,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Плеть накроет этот мир волной смерти и разрушения!'),
(36612,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ВИХРЬ КОСТЕЙ!'),
(36612,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Костяная хватка!'),
(36612,3,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Постой-ка тут!'),
(36612,3,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Единственный выход – это смерть!'),
(36612,4,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Кости для жертвоприношений!'),
(36612,4,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Сгинь в вечных муках!'),
(36612,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Я вижу... лишь тьму.'),

(36948,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Запускайте двигатели! Летим навстречу судьбе.'),
(36948,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Держите шлемы крепче!'),
(36948,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Это еще что?! Дайте мне подзорную трубу!'),
(36948,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Клянусь бородой! Корабль Орды несется на нас на всех парах!'),
(36948,4,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Маневрируем! Пушки – заррряжай!'),
(36948,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ах вы псы трусливые! Напали исподтишка!'),
(36948,6,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Не моя битва? Я не знаю, кем ты там себя возомнил, господин хороший, но у меня с Артасом особые счеты! ПАЛИ ИЗО ВСЕХ ОРУДИЙ! ОГОНЬ! ОГОНЬ!'),
(36948,7,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Двигай свою калошу, не то мы ее прямо в небе взорвем! Орде тут делать нечего!'),
(36948,8,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Да что ж такое! Не сдадим мы без боя дитя Стальгорна!'),
(36948,9,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пехота, сержанты, в бой!'),
(36948,10,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ружейники, ОГОНЬ!'),
(36948,11,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Мортирщики, заряжай!'),
(36948,12,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Корабль под обстрелом! Заклинателя сюда, пусть заткнет эти пушки!'),
(36948,13,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ну не говорите потом, что я не предупреждал. В атаку, братья и сестры!'),
(36948,14,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Капитан Бартлетт, уводите корабль! Он слишком поврежден и долго не протянет.'),

(36939,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Воспряньте, сыны и дочери Орды! Сегодня мы будем биться со смертельным врагом! ЛОК\'ТАР ОГАР!'),
(36939,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Кор\'крон, взлетаем!'),
(36939,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вы видите? Что это там вдалеке?'),
(36939,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'БОЕВОЙ КОРАБЛЬ АЛЬЯНСА! ВСЕ НА ПАЛУБУ!'),
(36939,4,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ты скоро поймешь, какие у нас тут дела! Кор\'крон, уничтожить их!'),
(36939,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Разрушители, сержанты, в бой!'),
(36939,6,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Как ты СМЕЕШЬ ступать на мой корабль? Сейчас ты умрешь.'),
(36939,7,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Метатели топоров, поживее!'),
(36939,8,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ракетчики, заряжай!'),
(36939,9,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Корабль под обстрелом! Боевого мага сюда, пусть заткнет эти пушки!'),
(36939,10,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Альянс повержен. Вперед, к Королю-личу!'),
(36939,11,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Оценить повреждения! Потушить огонь! Орда так просто не отступится!'),
(36939,12,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Это не твоя битва, дворф. Отступи, иначе нам придется разнести твой корабль.'),

(37030,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Благодарю духов, что они послали нам вас. \"Усмиритель небес\" уже улетел. Быстрее, на борт \"Молота Оргрима\". Если вы поспешите, то еще сможете его нагнать.'),

(37033,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вот это поможет!'),

(37032,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Капитан Саурфанг будет рад видеть вас на борту \"Молота Оргрима\". Мы будем сдерживать Альянс, пока вы не будете готовы к взлету.'),
(37032,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ака\'Магош, храбрые воины. Солдат Альянса тут очень много.'),

(37003,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Как хорошо, что вы прибыли именно сейчас, герои. \"Молот Оргрима\" уже улетел. Быстрее, на борт \"Усмирителя небес\". Если вы поспешите, то еще сможете его нагнать.'),

(37026,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Это должно помочь!'),

(36998,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Благодарю вас. Пока вы не прибыли, силы были не равны.'),
(36998,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Капитан Мурадин ждет вас на борту \"Усмирителя небес\". Мы будем сдерживать Орду, пока вы не подготовитесь к взлету.'),
(36998,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пехота \"Усмирителя\", занять позицию!'),

(37813,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Все павшие воины Орды, все дохлые псы Альянса – все пополнят армию Короля-лича. Даже сейчас валь\'киры воскрешают ваших покойников, чтобы те стали частью Плети!'),
(37813,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Сейчас все будет еще хуже! Идите сюда, я покажу вам, какой силой меня наделил Король-лич!'),
(37813,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Дворфы…'),
(37813,4,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Присоединись ко мне, отец. Перейди на мою сторону, и вместе мы разрушим этот мир во имя Плети и во славу Короля-лича!'),
(37813,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Старый упрямец. У тебя нет шансов. Я сильнее и могущественнее, чем ты можешь представить.'),
(37813,6,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Жалкий старик! Ну что ж, герои. Хотите узнать, сколь могущественна Плеть?'),
(37813,7,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ВО ИМЯ КОРОЛЯ-ЛИЧА!'),(37813,8,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Земля обагрится вашей кровью!'),
(37813,9,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Веселитесь, слуги мои!'),(37813,10,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ты ничтожество!'),
(37813,10,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Твоя душа не обретет покоя!'),(37813,13,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Я… освободился…'),

(37187,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Мой мальчик погиб у Врат Гнева. Я здесь, чтобы забрать его тело.'),
(37187,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Мы назвали его Дранош – на орочьем это значит \"Сердце Дренора\". Я бы не позволил чернокнижникам забрать его. Он был бы в безопасности в Гарадаре под защитой старейшин.'),
(37187,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Я пообещал его матери, когда она умирала, что пройду через Темный портал один. Не важно, умер бы я или выжил – мой сын остался бы цел. И чист…'),
(37187,4,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Сегодня я исполняю это обещание.'),
(37187,6,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'У тебя за спиной лежит тело моего сына. Ничто не помешает мне его забрать.'),
(37187,10,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Я не забуду вашей доброты… благодарю, Ваше Величество.'),
(37187,13,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Мы похороним тебя как подобает, в Награнде, рядом с матерью и предками…'),
(37187,14,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Помните о чести, герои… какой бы жестокой ни была битва… никогда не отрекайтесь от нее.'),
(37187,15,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Паладин еще жив? Верховный лорд, возможно ли это?'),
(37187,16,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Мы должны спасти его! Если мы спасем Болвара Фордрагона, напряжение между Ордой и Альянсом спадет.'),
(37187,17,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Теперь наша задача ясна: мы заставим Короля-лича ответить за все злодеяния и спасем паладина.'),
(37187,18,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Кор\'крон, готовьте \"Молот Оргрима\" к последнему полету! Герои, мы попробуем подлететь к стене цитадели и будем ждать вас там!'),

(37181,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вы находитесь в самом сердце земель плети. Здесь вас не защитит свет. Ничто вас не защитит...'),
(37181,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ты бы мог стать величайшим из моих рыцарей, Фордринг: Той силой тьмы, которая прокатилась бы по этому миру и перевернула страницу истории.'),
(37181,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Сломить его было очень трудно. И я подверг его душу ужасным мучениям. Он так долго сопротивлялся, но скоро он склонится перед своим королем.'),
(37181,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'В конце-концов все вы будете служить мне.'),
(37181,4,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Но тебе уже не суждено им стать. Скоро у меня будет другой рыцарь.'),

(37183,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Никогда... Я никогда... Не буду служить тебе...'),

(37200,13,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Что же это? Если Болвар жив, то, может, есть еще надежда на мир между Альянсом и Ордой? Нам нужно попасть на верхушку этой проклятой башни и освободить паладина!'),
(37200,14,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Подготовить \"Усмиритель небес\" к воздушной атаке на цитадель!'),
(37200,15,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Герои, попытайтесь выбраться на бастион! Попробуем встретиться с вами там!'),

(37119,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вот мы и на месте. То, что произойдет здесь, войдет в легенды. Не важно, каким будет исход: для истории мы будем героями, сражавшимися за свободу и покой своего народа.'),
(37119,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Помните, герои: страх – ваш самый опасный противник в этих проклятых залах. Скрепите свои сердца, и ваши души воссияют ярче тысячи солнц. Завидев вас, враг отступит. Враг падет, когда Свет праведности коснется его!'),
(37119,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Наш поход на Цитадель Ледяной Короны начинается!'),
(37119,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'АРТАС! Я поклялся, что ты умрешь, а Плеть будет разбита! Я закончу то, что начал у Часовни Последней Надежды.'),
(37119,4,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Сила Света не ведает преград, Саурфанг. Его душа безмерно страдает, и все же пока он жив.'),
(37119,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Да будет так, во имя Света.');

REPLACE INTO `locales_creature_text`(`entry`,`textGroup`,`text_loc8`) VALUES
(37129,0,'Обнажите клинки, соратники. Врайкулы насмерть будут стоять за Королеву Льда.'),
(37129,1,'Довольно пустой болтовни! Прибыли наши герои – с их помощью мы пробьемся через зал!'),
(37129,2,'Выманите их сюда, и мы вам поможем.'),
(37129,3,'Скорей, вперед!'),
(37129,4,'Сейчас прибудет ее подкрепление! Нужно с ней быстро покончить!'),
(37129,5,'Я отвлеку ее на себя. Верните наших братьев обратно в могилы, а потом мы покончим с ней!');

/* locales_quest */
REPLACE INTO `locales_quest` VALUES ('236', null, null, null, null, null, null, null, 'Горючее для разрушителей', null, null, null, null, null, null, null, '$n! Ты как раз вовремя. Хотя эта битва закончилась, мы должны подготовиться к новым сражениям. Отправляйся в Огненную котловину, который находится в на юго-востоке Озера Ледяных Оков, и принеси оттуда несколько неугасимых угольков.$B$BСмешав их с обычным углем, мы получим топливо для наших разрушителей и осадных машин.$B$BКстати, если по пути тебе встретятся солдаты Орды – не стесняйся, убей их и забери угольки. Нельзя допустить, чтобы в следующей битве преимущество оказалось на их стороне.', null, null, null, null, null, null, null, 'Осадный кузнец Крепкохват из Крепости Ледяных Оков попросил вас собрать 10 неугасимых угольков с тел воинов Орды в Огненной котловине.', null, null, null, null, null, null, null, 'Превосходно! Теперь огонь войны никогда не угаснет.', null, null, null, null, null, null, null, 'Итак, тебе удалось достать угли? Или злые ордынцы отшлепали тебя по пути к Котлу?', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Вернитесь к осадному кузнецу Крепкохвату на Озеро Ледяных Оков.', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
REPLACE INTO `locales_quest` VALUES ('11945', null, null, null, null, null, null, null, 'Подготовка к самому худшему', null, null, null, null, null, null, null, 'Темные времена для нас настали. Дух Каркута ходит по земле, собирая духи мертвых клыкарров.$B$BСыновья тумана забрали многих наших братьев. Скоро наша любимая Каскала превратится в пепелище.$B$BНо есть еще надежда. Быть может, не для нас – но ведь мы отослали наши семьи в Уну\'пе. Мы сражаемся здесь за то, чтобы у тех, кто там, было будущее.$B$BИм понадобятся съестные припасы, или они умрут с голода. В Уну\'пе еды маловато. Собери что-нибудь, пока для наших родных еще не слишком поздно.', null, null, null, null, null, null, null, 'По просьбе Утайка соберите в Каскале 8 ящиков припасов Каскала.', null, null, null, null, null, null, null, 'Благодарю тебя, $N. Эти припасы утолят голод наших родных и детей. Даже если Каскала падет, племя должно жить дальше.', null, null, null, null, null, null, null, 'Тебе все удалось, $N? Наши родные в Уну\'пе зависят от успеха твоих усилий.', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Вернитесь к Утайку в Каскалу, что в Борейской тундре.', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
REPLACE INTO `locales_quest` VALUES ('11960', null, null, null, null, null, null, null, 'Планы на будущее', null, null, null, null, null, null, null, 'Если мы хотим выжить, нам следует бороться с волчерами. Я только боюсь, как бы мы в своем рвении не истребили слишком многих.$b$bВолчеры Поляны Снегопада имеют такое же право на жизнь, как и мы сами. И мы с тобой позаботимся о том, чтобы они получили свой шанс.$b$bЕсли старейшина Ко\'нани не просил тебя с ними разобраться, значит, еще попросит. Когда будешь на севере, на их поляне, собери, пожалуйста, щенков и принеси их мне.', null, null, null, null, null, null, null, 'Соберите 12 щенков Поляны Снегопада. Принесите их зверолову Мау\'и в гавани Моа\'ки.', null, null, null, null, null, null, null, 'О, тебе удалось спасти многих! Спасибо тебе, $c.$B$BТеперь волчеры получат шанс выжить среди нас. Если, конечно, мы сами вообще выживем.$B$BКак думаешь, будет ли у тебя завтра время, чтобы спасти и других лохматиков?', null, null, null, null, null, null, null, 'Ну, сколько щенков можно было спасти за такое короткое время?', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Вернитесь к зверолову Мау\'и в гавань Моа\'ки, что в Драконьем Погосте.', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
REPLACE INTO `locales_quest` VALUES ('12702', null, null, null, null, null, null, null, 'Куриная вечеринка', null, null, null, null, null, null, null, 'Бьюсь об заклад, никогда не догадаешься, что опять случилось!$B$BНет, это не связано с Горегеком и курами.$B$BЛадно, я вру. Из-за Горегека все куры опять разбежались. Глупый Горегек, бурчащее брюхо. $B$BДай мне знать, если тебе понадобится помощь охотников… они все где-то поблизости.', null, null, null, null, null, null, null, 'Поймайте 12 сбежавших кур для старейшины Харкека с холма Бешеного Сердца.', null, null, null, null, null, null, null, 'А ты неплохо их ловишь!$B$BМожет, однажды мы просто утопим Горегека в реке, чтобы тебе больше не приходилось ловить кур.', null, null, null, null, null, null, null, 'Обычно куры далеко не убегают... конечно, если их осы не съедят. Может, в следующий раз нас стоит оставить их на улице...', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Вернитесь к старейшине Харкеку на Холм Бешеного Сердца, что в Низине Шолазар.', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
REPLACE INTO `locales_quest` VALUES ('12703', null, null, null, null, null, null, null, 'Буйство Картака', null, null, null, null, null, null, null, 'Что, ты и есть великий охотник на личей? Хорошо, что в бою у племени Бешеного Сердца будет такой союзник. Может, У тебя достаточно сил, чтобы призвать самого Картака.$B$BБольшая битва на юго-западе, в Форте Картака. Иди, убивай сверкающих длинноязыких, пока не наберешь достаточно крови Оракулов. Принеси кровь к алтарю в форте Картака и позови Картака на пир.$B$BЕсли Картак решит, что ты $gдостоин:достойна;, он возьмет твое тело... могущество Картака поможет убить много длинноязыких, очень много.$B$BИди, охотник, иди и убивай!', null, null, null, null, null, null, null, 'Принесите чистый образчик Крови Оракула к алтарю Картака, чтобы призвать Картака. Используя его силу, уничтожьте 50 горлоков из племени Заиндевелых по просьбе шамана Джакжека в форте Картака.', null, null, null, null, null, null, null, 'Как легко прошел для тебя ритуал!$B$BНадеюсь, ты еще вернешься: тут осталось, кого убить.', null, null, null, null, null, null, null, '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Вернитесь к шаману Якжеку в Форт Картака, что в Низине Шолазар.', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
REPLACE INTO `locales_quest` VALUES ('12732', null, null, null, null, null, null, null, 'Сила озаренной крови', null, null, null, null, null, null, null, 'Однажды Реджек станет могучим воином. Кровь и небесный огонь сделают Реджека сильным. Скоро увидишь.$B$BРеджек даст тебе фиал, а ты пойдешь далеко на запад, на самую вершину Колонны Солнечного Благословления. Наполни фиал водой.$B$BПотом иди к северному краю долины: там есть гряда к северу от Полей Костей. Там найдешь матриарха кровокрылов, убьешь ее и наберешь ее крови.$B$BСмешай кровь с водой, принеси Реджеку. Реджек выпьет, станет сильным.', null, null, null, null, null, null, null, 'Принесите фиал озаренной крови матриарха Реджеку на холм Бешеного Сердца.', null, null, null, null, null, null, null, 'Реджек благодарит. Реджек пьет, обретает силу; Реджек будет помнить твой подарок, $N.', null, null, null, null, null, null, null, 'У тебя подарок для Реджека?', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Вернитесь к Реджеку на Холм Бешеного Сердца, что в Низине Шолазар.', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
REPLACE INTO `locales_quest` VALUES ('12734', null, null, null, null, null, null, null, 'Реджек: первая кровь', null, null, null, null, null, null, null, 'Реджек стал самым юным воином племени Бешеного Сердца. Отец дал Реджеку могучий меч, чтобы побеждать врагов Бешеного Сердца – но древний обычай гласит, что сперва меч должен вкусить крови. Старшие воины обычно делают это. Ты окажешь Реджеку эту честь?$B$BБери меч, омой его в крови всех врагов Бешеного Сердца: ос, барабанчей, которые живут на юго-западе, и длинноязыких. Может, еще в крови шептунов: они далеко на северо-западе, возле озера Горьких Волн.', null, null, null, null, null, null, null, 'Омойте меч Реджека в крови осы Сапфирного улья, лютого барабанча и трех воинов или оракулов Шепота Тумана. Вернитесь на холм Бешеного Сердца к Реджеку.', null, null, null, null, null, null, null, 'Реджек видит пятна крови врагов на своем мече. Теперь у Реджека есть могучее оружие, и сам он станет могучим воином!', null, null, null, null, null, null, null, 'Меч Реджека омыт в крови врагов, да?', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Вернитесь к Реджеку на Холм Бешеного Сердца, что в Низине Шолазар.', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
REPLACE INTO `locales_quest` VALUES ('12741', null, null, null, null, null, null, null, 'Сила Бури', null, null, null, null, null, null, null, 'Глупые длинноязыкие! Думают, если они станут петь облакам, это даст им силу. Реджек покажет длинноязыким, как обрести силу!$B$BДалеко-далеко на северо-западе есть большое ровное поле, которое длинноязыкие называют \"уступ Ваятеля Бурь\". Реджек уверен: туда можно добраться, только если летать, как птица.$B$BНа этом уступе – так слышал Реджек – обитают могучие духи воды и ветра. Убей их, забери их силу и принеси в храм длинноязыких – они называют его \"Святилищем бурь\". Как только ты обретешь абсолютную силу, Реджек будет ждать твоего возвращения.', null, null, null, null, null, null, null, 'Соберите 3 субстанции грозы и 3 субстанции бури и отнесите их в Святилище бурь. Вернитесь на холм Бешеного Сердца к Реджеку и принесите ему истинную силу бури.', null, null, null, null, null, null, null, 'Теперь Реджек покажет трусливым длинноязыким, как нужно использовать силу стихий!', null, null, null, null, null, null, null, 'Ты принес Реджеку истинную силу стихий?', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Вернитесь к Реджеку на Холм Бешеного Сердца, что в Низине Шолазар.', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
REPLACE INTO `locales_quest` VALUES ('12758', null, null, null, null, null, null, null, 'Шлем героя', null, null, null, null, null, null, null, 'Реджек слышал рассказы об огромных людях из железа с уступа Ваятеля Бурь. Этот уступ находится далеко на северо-западе, за краем низины.$B$BХорошо было бы, если бы Реджек получил одну такую железную голову! Реджек сделал бы из нее шлем. Реджек могучий! Реджек неукротимый!..$B$BТы это принеси Реджеку, хорошо? Только вот, может, железную голову от железного тела просто так не оторвешь. Можно стащить бомбы у маленького зеленого народца и их друзей из Раскопа Хитрохмыла у Колонны Солнечного Благословения. Бомба оторвет голову от железного тела, а ты принесешь голову Реджеку.', null, null, null, null, null, null, null, 'Заполучите взрывчатку у любого члена Торговой Компании возле Раскопа Хитрохмыла и используйте ее, чтобы заполучить голову наблюдателя бурь. Принесите голову на холм Бешеного Сердца и отдайте Реджеку.', null, null, null, null, null, null, null, 'Где новый шлем для Реджека?', null, null, null, null, null, null, null, '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Вернитесь к Реджеку на Холм Бешеного Сердца, что в Низине Шолазар.', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
REPLACE INTO `locales_quest` VALUES ('13101', null, null, null, null, null, null, null, 'Сбор в Приюте фокусника', null, null, null, null, null, null, null, 'Арилль Лазурный Взгляд из "Приюта фокусника" ожидает наплыва гостей, ему предстоит приготовить море угощений, чтобы хватило на всех, и очень быстро! $B$BПринеси-ка мне северной похлебки и кувшин с вином из сырной лавки \"Еще по сто\", она находится прямо в центре Даларана. Хозяин лавки как раз задолжал мне винишко. Оно должно быть где-то там, у него в магазине.$B$BОтнеси вино и мясо Ариллю.', null, null, null, null, null, null, null, 'Приготовьте 4 порции северной похлебки, возьмите кувшин с вином из сырной лавки в Даларане и отнесите все Ариллю Лазурному Взгляду в \"Приют фокусника\" на площади Руноплета.', null, null, null, null, null, null, null, 'О, да тут на всех с лиховой хватит! Думаю, гости будут довольны.', null, null, null, null, null, null, null, 'Где же еда? Я жду гостей! Они должны прибыть с минуты на минуту!', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Поговорите с Ариллем Лазурным Взглядом в Приюте фокусника, что в Даларане.', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
REPLACE INTO `locales_quest` VALUES ('13102', null, null, null, null, null, null, null, 'Рагу для завсегдатаев Стоков', null, null, null, null, null, null, null, 'Аджаю Грину, хозяину таверны из Стоков Даларана, срочно понадобилось овощное рагу. Припасы подходят к концу, и скоро ему будет нечем кормить клиентов.$B$BСобери 4 морковки из леса Хрустальной Песни и потуши их с 4 кусками охлажденного мяса.$B$BВ лес Хрустальной Песни можно попасть через портал в восточном углу площади Руноплета.$B$BКогда рагу будет готово, отнесите его Аджаю.', null, null, null, null, null, null, null, 'Потушите 4 морковки из леса Хрустальной Песни с 4 кусками охлажденного мяса в кухонном горшке.$B$BКогда овощное рагу будет готово, отнесите его хозяину таверны Аджаю Грину в Стоки Даларана.', null, null, null, null, null, null, null, 'Его съедят в две секунды! Большое спасибо!', null, null, null, null, null, null, null, 'Мои постояльцы голодны! Мне срочно нужно рагу.', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Поговорите с Аджаем Грином в \"Ведьме и вороне\", что в Даларане.', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
REPLACE INTO `locales_quest` VALUES ('13103', null, null, null, null, null, null, null, 'Сыр для Златоплава', null, null, null, null, null, null, null, 'Ранид Златоплав из кожевенной лавки вдруг возжелал вина с сыром.$B$BВозьми сыра с полки в сырной лавке под названием \"Еще по сто\" в центре Даларана, а потом пройдись по кабакам и слей остатки вина из всех недопитых стаканов в одну бутылку. Отнеси вино с сыром Раниду.$B$BЕсть предположение, что он ничего и не заметит.', null, null, null, null, null, null, null, 'Купите в сырной лавке \"Еще по сто\" зрелый даларанский камамбер, потом пройдитесь по Даларану и слейте в бутылку остатки вина из 6 полупустых бокалов, стоящих на столах. Поставьте то, и другое на пустую сырную тарелку.$B$BОтнесите вино и сыр Раниду Златоплаву в кожевенную лавку в Торговой палате волшебников.', null, null, null, null, null, null, null, 'А что?! Неплохой букет!', null, null, null, null, null, null, null, 'Ты не $gвидел:видела; слугу с моим вином и сыром? Я голоден!', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Поговорите с Ранидом Златоплавом в \"Шикарных шкурках\", что в Даларане.', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
REPLACE INTO `locales_quest` VALUES ('13107', null, null, null, null, null, null, null, 'Сосиски с горчицей!', null, null, null, null, null, null, null, 'Верховный маг Пентарус любит смотреть битбол и сейчас собирается на матч, но ему нужно взять с собой что-нибудь перекусить.$B$BТебе нужно собрать ему корзинку для пикника. Положить туда 4 сосиски из мяса люторога и 4 побега полевой горчицы, она растет прямо в городе, на зеленых участках.$B$BСобранную корзинку надо отдать верховному магу, чтобы у него было чем перекусить, пока он будет смотреть игру.', null, null, null, null, null, null, null, 'Заполните пустую корзинку для пикника. Положите туда 4 сосиски из мяса люторога, которые вы приготовите сами, и 4 побега полевой горчицы, которая растет на зеленых участках в черте Даларана.$B$BОтнесите корзинку для пикника верховному магу Пентарусу на площадку Краса в Даларане.', null, null, null, null, null, null, null, 'Замечательно! Надеюсь, \"Даларанские крушители\" сегодня вырвутся вперед!', null, null, null, null, null, null, null, 'Я почти готов. Осталось только дождаться, когда мне принесут еду и когда подойдут мои подру... э... мои коллеги-маги.', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Поговорите с верховным магом Пентарусом на Площадке Краса, что в Даларане.', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
REPLACE INTO `locales_quest` VALUES ('13830', null, null, null, null, null, null, null, 'Рыба-призрак', null, null, null, null, null, null, null, 'Всякий стоящий рыболов в Нордсколе знает о карликовой рыбе-прилипале, называемой среди знатоков \"сосокунем\". Она несъедобна, но алхимики часто используют ее для приготовления зелий.$B$BНо речь не об этом. Если ты внимательно присмотришься к косяку прилипал в водах Слияния рек в низине Шолазар, то заметишь затесавшуюся среди них рыбу-призрака. На воздухе она становится прозрачной и в конце концов попросу исчезает. Многие считают, что она возвращается в Шолазар, но есть и те, кто сочиняют о ней всякие небылицы.$B$BВылови эту рыбу и раскрой ее секрет!', null, null, null, null, null, null, null, 'Раскройте тайну рыбы-призрака по просьбе Марсии Чейз из даларана.', null, null, null, null, null, null, null, 'Значит, съевший ее становится невидимым... чудны бывают творения природы.$B$BНадо бы съесть парочку. Ох, извини, $N, ничего личного! Правда! Заходи завтра, поболтаем.', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Загадка рыбы-призрака раскрыта.', null, null, null, null, null, null, null, 'Вернитесь к Марсии Чейз в Даларан.', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
REPLACE INTO `locales_quest` VALUES ('13832', null, null, null, null, null, null, null, 'Звезда сточных вод', null, null, null, null, null, null, null, 'Представляешь, некоторые граждане ловят в Стоках Даларана гигантских крыс и рыб-мутантов. А ведь в здешних водах можно найти столько ценного! Обманутые любовники, пойманные с поличным воры, неосторожные пьяницы – каждый сбрасывает или роняет сюда какую-нибудь приятную мелочь.$B$BДостаточно просто достать крючком до дна и не дергать леску слишком резко, когда что-нибудь попадется. Попробуй, $N. Что поймаешь – тащи ко мне. Будем торговаться!', null, null, null, null, null, null, null, 'Принесите Марсии Чейз в Даларан ржавое украшение.', null, null, null, null, null, null, null, 'Похоже, это что-то ценное. Трудно сказать наверняка, нужно счистить грязь и показать эту штучку оценщику. Но я все равно куплю ее у тебя - на всякий случай.', null, null, null, null, null, null, null, 'Как рыбалка?', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Вернитесь к Марсии Чейз в Даларан.', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
REPLACE INTO `locales_quest` VALUES ('13833', null, null, null, null, null, null, null, 'Густая кровь', null, null, null, null, null, null, null, 'Как можно понять из названия, ужорь - это весьма прожорливая рыбешка. Лекари используют ее для варки исцеляющих составов, поэтому если хочешь заработать - иди за ужрем-кровопийцей.$B$BОни падки на кровь, поэтому проще всего убить какую-нибудь зверушку в Борейской тундре, намазаться ее кровью, затем искупаться в озерной воде и начать рыбачить.', null, null, null, null, null, null, null, 'Принесите Марсии Чейз в Даларан 5 ужрей-кровопийц.', null, null, null, null, null, null, null, 'Храбрости тебе не занимать, $N. Надеюсь, ты не $gперегнул:перегнула; палку, добывая кровь для рыбалки. Если тебе понравилось ловить ужрей, приходи завтра.', null, null, null, null, null, null, null, 'Ну что - удалось поймать хоть одного ужорька? Не забывай - их проще всего приманить на кровь!', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Вернитесь к Марсии Чейз в Даларан.', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
REPLACE INTO `locales_quest` VALUES ('13834', null, null, null, null, null, null, null, 'Опасный деликатес', null, null, null, null, null, null, null, 'Чем ценнее улов, тем опаснее рыбалка. В озере Ледяных Оков водится редкая рыба, но ловить ее примется лишь безрассудный.$B$BЯ толкую о террорели. Она страшно ядовита и ужасно вкусна. Вот принесешь мне ее – тогда пойдет другой разговор.', null, null, null, null, null, null, null, 'Принесите Марсии Чейз в Даларан 10 террорелей.', null, null, null, null, null, null, null, 'Утопи меня кальмар! Это же террорель! Эхе-хе, помню, были времена...', null, null, null, null, null, null, null, 'Запомни - с террорелями переговоры не ведут!', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Вернитесь к Марсии Чейз в Даларан.', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
REPLACE INTO `locales_quest` VALUES ('13836', null, null, null, null, null, null, null, 'Обезручен!', null, null, null, null, null, null, null, 'До меня дошли слухи о трагедии в даларанской тюрьме – особо опасный заключенный отгрыз руку одному из охранников и выбросил ее в воду.$b$bДоктора из больницы скорой помощи говорят, что ее еще можно пришить.$B$BДостаточно порыбачить хорошенько возле тюрьмы и, ставлю свой любимый гарпун, рука непременно всплывет на поверхность. Найди руку и принеси ее Олисарре Доброй в Даларан. Остальное она сделает сама.', null, null, null, null, null, null, null, 'Принесите откушенную руку Олисарре Доброй в Даларан.', null, null, null, null, null, null, null, 'Здравствуй, $N. Марсия предупредила меня, что ты нашел руку этого бедняги.$B$BОна также сказала, что в благодарность за помощь ты можешь взять эту сумку. Если честно, из сумки чем-то отвратительно воняет – так что забери ее скорее!', null, null, null, null, null, null, null, 'Приветствую. У вас лишней руки не найдется?', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Вернитесь к Олисарре Доброй в центр неотложной помощи в Даларане.', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
REPLACE INTO `locales_quest` VALUES ('14096', null, null, null, null, null, null, null, 'На этот раз ты нарвался, Кул', null, null, null, null, null, null, null, 'Рыцарь Кул опять угодил в беду, но на этот раз увлек за собой других. Как только он увидел, что приспешники культа Проклятых разбили лагерь на Заставе Вестника Смерти, что на западе от Ристалища, то собрал группу претендентов и повел их на бой с захватчиками.$B$BРазумеется, не имея должного подкрепления, они были разбиты и захвачены в плен. Я не сомневаюсь, что злодеи принесут их в жертву, дабы подпитать этой силой свою зловещую магию. Ключи от черных клеток, в которых держат пленников, могут хранится у любого из служителей культа. Прошу тебя, найди ключи, спаси Кула и несчастных претендентов от ужасной участи!', null, null, null, null, null, null, null, 'Спасите Кула Безрассудного и 4 пленных претендентов с Заставы Вестника Смерти и вернитесь к Нараси Снежной Заре в шатер Альянса на ристалище Серебряного турнира.', null, null, null, null, null, null, null, 'Благодаря тебе Кул и другие претенденты снова вернулись в строй, чтобы сражаться с Плетью. К несчатью, нам не впервой спасать этого доблестного мужа от самого себя. Надеюсь, претенденты выберут себе другой пример для подражания.', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Вернитесь к Нараси Снежной Заре на Ристалище Серебряного турнира, что в Ледяной Короне.', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

/* locales_gossip_menu_option */
REPLACE INTO `locales_gossip_menu_option` VALUES ('9687', '1', null, null, null, null, null, null, null, 'Великая и могущественная Хар\'коа, пожалуйста, призови одного из своих детей, чтобы он мог тайно отнести меня к алтарю Кетц\'лун.', null, null, null, null, null, null, null, null);
REPLACE INTO `locales_gossip_menu_option` VALUES ('9728', '0', null, null, null, null, null, null, null, '<Проверить пульс...>', null, null, null, null, null, null, null, null);
REPLACE INTO `locales_gossip_menu_option` VALUES ('54000', '0', null, null, null, null, null, null, null, 'Если хочешь узнать, самец это или самка, загляни леопарду под хвост.', null, null, null, null, null, null, null, null);

/* locales_npc_text */
REPLACE INTO `locales_npc_text` VALUES ('13139', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Ты станешь моим спасением.$B$BА может быть, моей кончиной.', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,  null, null, null, null, null, null, null, null, null);
REPLACE INTO `locales_npc_text` VALUES ('13318', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Мохоброд, похоже, тяжело ранен.', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,  null, null, null, null, null, null, null, null, null);
REPLACE INTO `locales_npc_text` VALUES ('13368', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Я – твой вечный должник, $N.', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,  null, null, null, null, null, null, null, null, null);
REPLACE INTO `locales_npc_text` VALUES ('14266', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Северный леопард лежит неподвижно.', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,  null, null, null, null, null, null, null, null, null);

REPLACE INTO `locales_npc_text` (`entry`, `Text0_0_loc1`, `Text0_0_loc2`, `Text0_0_loc3`, `Text0_0_loc4`, `Text0_0_loc5`, `Text0_0_loc6`, `Text0_0_loc7`, `Text0_0_loc8`, `Text0_1_loc1`, `Text0_1_loc2`, `Text0_1_loc3`, `Text0_1_loc4`, `Text0_1_loc5`, `Text0_1_loc6`, `Text0_1_loc7`, `Text0_1_loc8`, `Text1_0_loc1`, `Text1_0_loc2`, `Text1_0_loc3`, `Text1_0_loc4`, `Text1_0_loc5`, `Text1_0_loc6`, `Text1_0_loc7`, `Text1_0_loc8`, `Text1_1_loc1`, `Text1_1_loc2`, `Text1_1_loc3`, `Text1_1_loc4`, `Text1_1_loc5`, `Text1_1_loc6`, `Text1_1_loc7`, `Text1_1_loc8`, `Text2_0_loc1`,  `Text2_0_loc2`,  `Text2_0_loc3`,  `Text2_0_loc4`,  `Text2_0_loc5`,  `Text2_0_loc6`,  `Text2_0_loc7`,  `Text2_0_loc8`,  `Text2_1_loc1`, `Text2_1_loc2`, `Text2_1_loc3`, `Text2_1_loc4`, `Text2_1_loc5`, `Text2_1_loc6`, `Text2_1_loc7`, `Text2_1_loc8`, `Text3_0_loc1`,  `Text3_0_loc2`,  `Text3_0_loc3`,  `Text3_0_loc4`,  `Text3_0_loc5`,  `Text3_0_loc6`,  `Text3_0_loc7`,  `Text3_0_loc8`,  `Text3_1_loc1`, `Text3_1_loc2`, `Text3_1_loc3`, `Text3_1_loc4`, `Text3_1_loc5`, `Text3_1_loc6`, `Text3_1_loc7`, `Text3_1_loc8`, `Text4_0_loc1`,  `Text4_0_loc2`,  `Text4_0_loc3`,  `Text4_0_loc4`,  `Text4_0_loc5`,  `Text4_0_loc6`,  `Text4_0_loc7`,  `Text4_0_loc8`,  `Text4_1_loc1`, `Text4_1_loc2`, `Text4_1_loc3`, `Text4_1_loc4`, `Text4_1_loc5`, `Text4_1_loc6`, `Text4_1_loc7`, `Text4_1_loc8`, `Text5_0_loc1`,  `Text5_0_loc2`,  `Text5_0_loc3`,  `Text5_0_loc4`,  `Text5_0_loc5`,  `Text5_0_loc6`,  `Text5_0_loc7`,  `Text5_0_loc8`,  `Text5_1_loc1`, `Text5_1_loc2`, `Text5_1_loc3`, `Text5_1_loc4`, `Text5_1_loc5`, `Text5_1_loc6`, `Text5_1_loc7`, `Text5_1_loc8`, `Text6_0_loc1`,  `Text6_0_loc2`,  `Text6_0_loc3`,  `Text6_0_loc4`,  `Text6_0_loc5`,  `Text6_0_loc6`,  `Text6_0_loc7`,  `Text6_0_loc8`,  `Text6_1_loc1`, `Text6_1_loc2`, `Text6_1_loc3`, `Text6_1_loc4`, `Text6_1_loc5`, `Text6_1_loc6`, `Text6_1_loc7`, `Text6_1_loc8`, `Text7_0_loc1`,  `Text7_0_loc2`,  `Text7_0_loc3`,  `Text7_0_loc4`,  `Text7_0_loc5`,  `Text7_0_loc6`,  `Text7_0_loc7`,  `Text7_0_loc8`,  `Text7_1_loc1`, `Text7_1_loc2`, `Text7_1_loc3`, `Text7_1_loc4`, `Text7_1_loc5`, `Text7_1_loc6`, `Text7_1_loc7`, `Text7_1_loc8`) VALUES
(7789, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Добро пожаловать! Подходи, не стесняйся. Вот это моя гордость и радость... Ультрапушка 5000 Покрышкинс! Разве не прелесть? Ты немного широват в области живота, но я думаю, что подойдешь. Летать так весело, хотите попробывать?', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,  null, null, null, null, null, null, null, null, null);

UPDATE `creature_ai_texts` SET `content_loc8`='ТОРГОВЕЦ ФРУКТАМИ!!! Твоя повозка все еще не прибыла к нам! Мы даем тебе один час, чтобы доставил ее к нам. Не проверяй больше наше терпение!' WHERE `entry`='-267';

UPDATE `locales_quest` SET `RequestItemsText_loc8`='Надеюсь вы понимаете, что я не могу просто впустить вас в Солнечный Колодец, $n. Это самое священное место известное Син\'дорай и мы только не давно восстановили контроль над ним.$b$b Можете ли вы поднять надежды нашего народа, рассказами о Кель\'Делар? Без истинного доказательства вашего визита, я невижу причины, чтобы верить вам на слове.' WHERE `entry`='24562';

UPDATE `locales_quest` SET `RequestItemsText_loc8`='Значит зло завладело этим мечом, я не думал, что это возможно, но судя по всему я был слишком наивен. Если величайшая творительница драконидов была повержена злом держа в руках этот меч, то почему бы и простому мечу не овладеть злыми чарами?$B$BВерить или не верить Утеру ваше право. Но я думаю, что вам стоит прислушаться к его совету, $N.' WHERE `entry`='24480';

UPDATE `locales_quest` SET `RequestItemsText_loc8`='Значит зло завладело этим мечом, я не думал, что это возможно, но судя по всему я был слишком наивен. Если величайшая творительница драконидов была повержена злом держа в руках этот меч, то почему бы и простому мечу не овладеть злыми чарами?$B$BВерить или не верить Утеру ваше право. Но я думаю, что вам стоит прислушаться к его совету, $N.' WHERE `entry`='24561';

UPDATE `locales_quest` SET `RequestItemsText_loc8`='Калу\'ак имеют давнюю традицию оттачивая свои навыки рыбалки, поставив их на испытание раз в неделю.$b$bПервый человек, который поймает, и принесет мне Черную Акулу, будет знатно вознагражден, и известен как величайший рыбалов севера... в течении нескольких дней по крайней мере.$b$bЛюбимой едой Черных Акул является Карликовый Сосокунь. Поэтому ловите Черную Акулу там, где как правило водится Карликовый Сосокунь.' WHERE `entry`='24803';

REPLACE INTO `locales_gossip_menu_option` (`menu_id`, `id`, `option_text_loc1`, `option_text_loc2`, `option_text_loc3`, `option_text_loc4`, `option_text_loc5`, `option_text_loc6`, `option_text_loc7`, `option_text_loc8`, `box_text_loc1`, `box_text_loc2`, `box_text_loc3`, `box_text_loc4`, `box_text_loc5`, `box_text_loc6`, `box_text_loc7`, `box_text_loc8`) VALUES
(10668, 0, null, null, null, null, null, null, null, 'Борейская тундра', null, null, null, null, null, null, null, null),
(10668, 1, null, null, null, null, null, null, null, 'Ревущий фьорд', null, null, null, null, null, null, null, null),
(10668, 2, null, null, null, null, null, null, null, 'Низина Шолазар', null, null, null, null, null, null, null, null),
(10668, 3, null, null, null, null, null, null, null, 'Ледяная Корона', null, null, null, null, null, null, null, null),
(10668, 4, null, null, null, null, null, null, null, 'Грозовая Гряда', null, null, null, null, null, null, null, null);

REPLACE INTO `locales_creature_text` VALUES ('17711', '0', '0', null, null, null, null, null, null, null, 'Не приближайтесь. Вы будете уничтожены.');
REPLACE INTO `locales_creature_text` VALUES ('17711', '1', '0', null, null, null, null, null, null, null, 'Начинаю тектоническую дестабилизацию.');
REPLACE INTO `locales_creature_text` VALUES ('17711', '1', '1', null, null, null, null, null, null, null, 'Магнитуда установлена. Запуск.');
REPLACE INTO `locales_creature_text` VALUES ('17711', '2', '0', null, null, null, null, null, null, null, 'Траектория задана.');
REPLACE INTO `locales_creature_text` VALUES ('17711', '2', '1', null, null, null, null, null, null, null, 'Включаю максимальную скорость.');
REPLACE INTO `locales_creature_text` VALUES ('17711', '3', '0', null, null, null, null, null, null, null, 'Угроза устранена.');
REPLACE INTO `locales_creature_text` VALUES ('17711', '3', '1', null, null, null, null, null, null, null, 'Задача выполнена.');
REPLACE INTO `locales_creature_text` VALUES ('17711', '3', '2', null, null, null, null, null, null, null, 'Цель уничтожена.');
REPLACE INTO `locales_creature_text` VALUES ('17711', '4', '0', null, null, null, null, null, null, null, 'Отказ системы через пять… Че… ты… р… е…');

UPDATE `locales_quest` SET `RequestItemsText_loc8`='Какие вести ты принес с юга?' WHERE `entry`='13538';

UPDATE `locales_quest` SET `RequestItemsText_loc8`='Ну как охота? Ходят слухи, что то место неспокойное, хотя я сам туда никогда не ходил.' WHERE `entry`='13154';

UPDATE `locales_quest` SET `RequestItemsText_loc8`='Ну, что? Удалось ли тебе добыть угольков, или же борьба с Ордой заставила тебя по плакать?' WHERE `entry`='236';

UPDATE `locales_quest` SET `RequestItemsText_loc8`='Сколько щенков тебе удалось сохранить за столь короткое время?' WHERE `entry`='11960';

UPDATE `locales_quest` SET `OfferRewardText_loc8`='Ты показал себя достойным бойцом, $n и ты будешь служить примером для остольных претендентов, которые будут бороться во имя Орды.' WHERE `entry`='13676';

UPDATE `locales_npc_text` SET `Text3_0_loc8`='На моих первых занятиях всегда полно юношей с горящим взором. Но мало кто из них проходит первое испытание.$B$BЯ уже устал ругаться на них: \"Если я говорю – исчезни, надо исчезнуть!\". Все равно ведь не слушают. Теперь непригодные просто погибают при испытании.' WHERE `entry`='10686';

REPLACE INTO `locales_creature_text` (`entry`, `textGroup`, `id`, `text_loc1`, `text_loc2`, `text_loc3`, `text_loc4`, `text_loc5`, `text_loc6`, `text_loc7`, `text_loc8`) VALUES 
(28566, 0, 0, null, null, null, null, null, null, null, 'Начинаю дистилляцию через 5 секунд.'),
(28566, 1, 0, null, null, null, null, null, null, null, 'Добавь еще один апельсин! Быстрее!'),
(28566, 2, 0, null, null, null, null, null, null, null, 'Брось папайю в дистиллятор!'),
(28566, 3, 0, null, null, null, null, null, null, null, 'Добавь бананов!'),
(28566, 4, 0, null, null, null, null, null, null, null, 'Давление слишком высокое! Открой клапан давления!'),
(28566, 5, 0, null, null, null, null, null, null, null, 'Дестиллятор необходимо подогреть! Зажги жаровню!'),
(28566, 6, 0, null, null, null, null, null, null, null, 'Хорошо! Теперь внимательно смотрим.'),
(28566, 6, 1, null, null, null, null, null, null, null, 'Ага, отлично. Никогда не знаешь, что может понадобиться в следующий момент…'),
(28566, 6, 2, null, null, null, null, null, null, null, 'Отлично! Продолжаем в том же духе!'),
(28566, 6, 3, null, null, null, null, null, null, null, 'Хорошо! Приготовься делать то, что я скажу!'),
(28566, 7, 0, null, null, null, null, null, null, null, 'Ай-яй-яй, плохо! Я отключаю его…'),
(28566, 8, 0, null, null, null, null, null, null, null, 'У нас получилось! Тащи бочонок.');

REPLACE INTO `locales_gossip_menu_option` (`menu_id`, `id`, `option_text_loc1`, `option_text_loc2`, `option_text_loc3`, `option_text_loc4`, `option_text_loc5`, `option_text_loc6`, `option_text_loc7`, `option_text_loc8`, `box_text_loc1`, `box_text_loc2`, `box_text_loc3`, `box_text_loc4`, `box_text_loc5`, `box_text_loc6`, `box_text_loc7`, `box_text_loc8`) VALUES
(9713, 0, null, null, null, null, null, null, null, 'Ну, Поддатый. Я готов начать дистилляцию.', null, null, null, null, null, null, null, null);

UPDATE `db_script_string` SET `content_loc8`='Сегодня и только сейчас в Шаттрате: \"Вожди тауренов\" в рамках турне по Азероту и Запределью зададут жару в таверне \"На краю света\"!' WHERE `entry`='2000000460';
UPDATE `db_script_string` SET `content_loc8`='Кто? Вожди тауренов! Что? В живом исполнении! Где? В таверне \"На краю света\"! Когда? В полдень! ВСЕМ БЫТЬ ТАМ!' WHERE `entry`='2000000461';

REPLACE INTO `locales_creature_text` (`entry`, `textGroup`, `id`, `text_loc1`, `text_loc2`, `text_loc3`, `text_loc4`, `text_loc5`, `text_loc6`, `text_loc7`, `text_loc8`) VALUES 
(3627, 0, 0, null, null, null, null, null, null, null, 'Голова раскалывается от магии? Отдохните в \"Печальном отшельнике\"!'),
(3627, 0, 1, null, null, null, null, null, null, null, 'Лучшие напитки в Штормграде!'),
(3627, 0, 2, null, null, null, null, null, null, null, 'Наше пиво – просто диво!'),
(3627, 0, 3, null, null, null, null, null, null, null, 'Посетите \"Печальный отшельник\", почувствуйте пьянящий дух магии!'),
(3627, 0, 4, null, null, null, null, null, null, null, 'Бесплатные напитки в \"Печальном отшельнике\"!'),
(3627, 0, 5, null, null, null, null, null, null, null, 'Вас снедает печаль? В \"Печальном отшельнике\" вы найдете, с кем ее разделить!'),
(3627, 0, 6, null, null, null, null, null, null, null, 'В \"Печальном отшельнике\" вы всегда будете чувствовать себя в своей тарелке!');

UPDATE `locales_quest` SET `OfferRewardText_loc8`='Благодаря тебе Кул и другие претенденты снова вернулись в строй, чтобы сражаться с Плетью. К несчатью, нам не впервой спасать этого доблестного мужа от самого себя. Надеюсь, претенденты выберут себе другой пример для подражания.' WHERE `entry`='14096';

UPDATE `locales_quest` SET `OfferRewardText_loc8`='Похоже, это что-то ценное. Трудно сказать наверняка, нужно счистить грязь и показать эту штучку оценщику. Но я все равно куплю ее у тебя - на всякий случай.' WHERE `entry`='13832';
UPDATE `locales_quest` SET `RequestItemsText_loc8`='Как рыбалка?' WHERE `entry`='13832';
UPDATE `locales_quest` SET `OfferRewardText_loc8`='Замечательно! Надеюсь, \"Даларанские крушители\" сегодня вырвутся вперед!' WHERE `entry`='13107';
UPDATE `locales_quest` SET `RequestItemsText_loc8`='Я почти готов. Осталось только дождаться, когда мне принесут еду и когда подойдут мои подру... э... мои коллеги-маги.' WHERE `entry`='13107';

UPDATE `locales_quest` SET `OfferRewardText_loc8`='Значит, съевший ее становится невидимым... чудны бывают творения природы.$B$BНадо бы съесть парочку. Ох, извини, $N, ничего личного! Правда! Заходи завтра, поболтаем.' WHERE `entry`='13830';

REPLACE INTO `locales_gossip_menu_option` VALUES ('9728', '0', null, null, null, null, null, null, null, '<Проверить пульс...>', null, null, null, null, null, null, null, null);

UPDATE `locales_quest` SET `OfferRewardText_loc8`='О, тебе удалось спасти многих! Спасибо тебе, $c.$B$BТеперь волчеры получат шанс выжить среди нас. Если, конечно, мы сами вообще выживем.$B$BКак думаешь, будет ли у тебя завтра время, чтобы спасти и других лохматиков?' WHERE `entry`='11960';
UPDATE `locales_quest` SET `Objectives_loc8`='Купите в сырной лавке \"Еще по сто\" зрелый даларанский камамбер, потом пройдитесь по Даларану и слейте в бутылку остатки вина из 6 полупустых бокалов, стоящих на столах. Поставьте то, и другое на пустую сырную тарелку.$B$BОтнесите вино и сыр Раниду Златоплаву в кожевенную лавку в Торговой палате волшебников.' WHERE `entry`='13103';
UPDATE `locales_quest` SET `Title_loc8`='Куриная вечеринка' WHERE `entry`='12702';
UPDATE `locales_quest` SET `RequestItemsText_loc8`='Обычно куры далеко не убегают... конечно, если их осы не съедят. Может, в следующий раз нас стоит оставить их на улице...' WHERE `entry`='12702';
UPDATE `locales_quest` SET `RequestItemsText_loc8`='У тебя подарок для Реджека?' WHERE `entry`='12732';
UPDATE `locales_quest` SET `OfferRewardText_loc8`='О, да тут на всех с лиховой хватит! Думаю, гости будут довольны.' WHERE `entry`='13101';
UPDATE `locales_quest` SET `RequestItemsText_loc8`='Где же еда? Я жду гостей! Они должны прибыть с минуты на минуту!' WHERE `entry`='13101';
UPDATE `locales_quest` SET `OfferRewardText_loc8`='Великолепно! Ты - один из величайших воинов Альянса!' WHERE `entry`='13177';
UPDATE `locales_quest` SET `RequestItemsText_loc8`='Меч Реджека омыт в крови врагов, да?' WHERE `entry`='12734';

REPLACE INTO `locales_gossip_menu_option` VALUES ('54000', '0', null, null, null, null, null, null, null, 'Если хочешь узнать, самец это или самка, загляни леопарду под хвост.', null, null, null, null, null, null, null, null);

UPDATE `locales_quest` SET `RequestItemsText_loc8`='Итак, тебе удалось достать угли? Или злые ордынцы отшлепали тебя по пути к Котлу?' WHERE `entry`='236';
UPDATE `locales_quest` SET `OfferRewardText_loc8`='Превосходно! Теперь огонь войны никогда не угаснет.' WHERE `entry`='236';
UPDATE `locales_quest` SET `RequestItemsText_loc8`='Запомни - с террорелями переговоры не ведут!' WHERE `entry`='13834';
UPDATE `locales_quest` SET `OfferRewardText_loc8`='Утопи меня кальмар! Это же террорель! Эхе-хе, помню, были времена...' WHERE `entry`='13834';
UPDATE `locales_quest` SET `RequestItemsText_loc8`='Где новый шлем для Реджека?' WHERE `entry`='12758';
UPDATE `locales_quest` SET `RequestItemsText_loc8`='Итак, тебе удалось достать угли? Или злые ордынцы отшлепали тебя по пути к Котлу?' WHERE `entry`='13197';
UPDATE `locales_quest` SET `OfferRewardText_loc8`='Превосходно! Теперь огонь войны никогда не угаснет.' WHERE `entry`='13197';

REPLACE INTO `locales_gossip_menu_option` VALUES ('9859', '0', null, null, null, null, null, null, null, 'Я готов - давай выбираться от сюда.', null, null, null, null, null, null, null, null);

UPDATE `locales_quest` SET `OfferRewardText_loc8`='Сыны Ходира принимают твое подношение кроха. Ты не перестаешь показывать свою ценность как нашего союзника.' WHERE `entry`='13559';
UPDATE `locales_quest` SET `RequestItemsText_loc8`='Простые подношения не были достойны Ходира, когда он еще обретался среди снежных великанов.$B$BИ пусть с нами его уже нет, мы никогда не оставим традицию подношения даров и всегда будем почитать его силу и мудрость. Ты поддерживаешь наши традиции, и это о многом говорит, крохотный $c.' WHERE `entry`='13559';
UPDATE `locales_quest` SET `CompletedText_loc8`='Вернитесь к Лиллехоффу в Грозовую гряду.' WHERE `entry`='13559';
UPDATE `locales_quest` SET `RequestItemsText_loc8`='Яркое синие сияние окружает наковальню.' WHERE `entry`='12981';

REPLACE INTO `locales_gossip_menu_option` VALUES ('9928', '0', null, null, null, null, null, null, null, 'Я с тобой, Торим!', null, null, null, null, null, null, null, null);

REPLACE INTO `locales_creature_text` VALUES ('29775', '1', '0', null, null, null, null, null, null, null, 'Обнаружено использование диска изобретателя. Предприняты меры безопасности, режим гамма.');
REPLACE INTO `locales_creature_text` VALUES ('29775', '2', '0', null, null, null, null, null, null, null, 'Проверка состояния оболочки Норганнона.');
REPLACE INTO `locales_creature_text` VALUES ('29775', '3', '0', null, null, null, null, null, null, null, 'Оболочка Норганнона инициализирована и безопасна. Она будет доступна для трансфера, как только будет подтверждена личность пользователя..');
REPLACE INTO `locales_creature_text` VALUES ('29775', '4', '0', null, null, null, null, null, null, null, 'Ожидание подтверждения личности Хранителя Мимира.');
REPLACE INTO `locales_creature_text` VALUES ('29775', '5', '0', null, null, null, null, null, null, null, '%s сканирует вас, чтобы определить вашу личность.');
REPLACE INTO `locales_creature_text` VALUES ('29775', '6', '0', null, null, null, null, null, null, null, 'Ошибка подтверждения личности. Пользователь не является хранителем Мимиром.');
REPLACE INTO `locales_creature_text` VALUES ('29775', '7', '0', null, null, null, null, null, null, null, 'Диск изобретателя попал в руки неавторизованного пользователя. Активация защитного протокола.');
REPLACE INTO `locales_creature_text` VALUES ('29775', '8', '0', null, null, null, null, null, null, null, 'С самозванцем необходимо разделаться. А диск изобретателя – вернуть.');

-- World locales
REPLACE INTO `locales_creature_text` (`entry`, `textGroup`, `id`, `text_loc1`, `text_loc2`, `text_loc3`, `text_loc4`, `text_loc5`, `text_loc6`, `text_loc7`, `text_loc8`) VALUES 
(36669, 0, 0, null, null, null, null, null, null, null, 'Наконец-то ты $gприбыл:прибыла;. Крас доверил нам одну из немногих сохранившихся копий Древних клинков драконьей ковки.'),
(36669, 1, 0, null, null, null, null, null, null, null, 'Вот эта книга. Ты $gдолжен:должна; во что бы то ни стало доставить ее Каладису Сияющему Копью в Ледяную Корону, пока Похитители Солнца не узнали, что книга у нас.'),
(36669, 2, 0, null, null, null, null, null, null, null, 'Отправляйся немедля и не останавливайся по пути! Когда Похитители Солнца узнают, что ты везешь, они не станут терять время даром.'),
(36670, 0, 0, null, null, null, null, null, null, null, 'Ты $gопоздал:опоздала;, $gпосланник:посланница;. Нет, мне не нужны твои извинения. Это слишком важное задание.'),
(36670, 1, 0, null, null, null, null, null, null, null, 'Наш представитель привез эту книгу из Храма Драконьего Покоя. Немедленно доставь ее Миралию Блеску Солнца.'),
(36670, 2, 0, null, null, null, null, null, null, null, 'Будь $gосторожен:осторожна;, $gпосланник:посланница;. Не стоит лишний раз напоминать тебе о ценности книги, равно как и о том, что Серебряный союз не остановится ни перед чем, чтобы заполучить ее.');
REPLACE INTO `locales_creature_text` (`entry`, `textGroup`, `id`, `text_loc1`, `text_loc2`, `text_loc3`, `text_loc4`, `text_loc5`, `text_loc6`, `text_loc7`, `text_loc8`) VALUES
(26917, 0, 0, null, null, null, null, null, null, null, 'Это оружие издревле служило героям, сражавшимся со злом. Я не вижу причины скрывать его от них сейчас'),
(27990, 0, 0, null, null, null, null, null, null, null, 'Ты слишком поздно, $n. Другой гость из Даларана пришел за книгой, с информацией о этих же Радужных клинках драконей ковки.'),
(27990, 1, 0, null, null, null, null, null, null, null, 'Исходя из твоего описания, я могу предположить, что книга, одолженная мной предыдущему посетителю, помогла бы тебе понять, что это за оружие.'),
(27990, 2, 0, null, null, null, null, null, null, null, 'Думаю, тебе стоит спросить... возможно, Калесгос тебе поможет.'),
(27990, 3, 0, null, null, null, null, null, null, null, 'Калесгос, $n возможно нашел остатки радужного клинка. Ты сможешь помочь нашему гостю?'),
(27990, 4, 0, null, null, null, null, null, null, null, 'Думаешь, наши союзники не совладают с мощью клинков?'),
(27990, 5, 0, null, null, null, null, null, null, null, 'И не только ты.'),
(27990, 6, 0, null, null, null, null, null, null, null, '$gСмертный:Смертная;, поговори с чародеем Тибалином в Даларане. Может быть, он договорится с Похитителями Солнца и получит доступ к книге.'),
(27990, 7, 0, null, null, null, null, null, null, null, '$gСмертный:Смертная;, поговори с магистром Хаторелем в Даларане. Может быть, он договорится с Серебряным союзом и получит доступ к книге.'),
(38017, 0, 0, null, null, null, null, null, null, null, 'Ты уверен, что стоит помогать этим смертным в поисках меча?'),
(38017, 1, 0, null, null, null, null, null, null, null, 'Эти клинки, Крас... их создали давным-давно, и тогда все было... по-другому.'),
(38017, 2, 0, null, null, null, null, null, null, null, 'Враги однажды обратили силу созданного нами сильнейшего оружия против нас. Почему ты решил, что с радужными клинками выйдет иначе?'),
(38017, 3, 0, null, null, null, null, null, null, null, 'Как пожелаете, королева. Я не стану мешать им, но буду внимательно наблюдать за происходящим.');
REPLACE INTO `locales_creature_text` (`entry`, `textGroup`, `id`, `text_loc1`, `text_loc2`, `text_loc3`, `text_loc4`, `text_loc5`, `text_loc6`, `text_loc7`, `text_loc8`) VALUES 
(34716, 0, 0, null, null, null, null, null, null, null, 'Спасибо тебе, $c.'),
(34716, 0, 1, null, null, null, null, null, null, null, 'Они убивают пленных! Быстрее, спасай остальных.'),
(34716, 0, 2, null, null, null, null, null, null, null, 'Я так и знал, что мне не следовало ехать на этот турнир.'),
(34716, 0, 3, null, null, null, null, null, null, null, 'А я думал, что мне суждено здесь погибнуть.'),
(34956, 0, 0, null, null, null, null, null, null, null, 'Еще секунда – и меня бы привязали к одному из этих алтарей, чтобы вытянуть из меня душу. Давай побыстрее уберемся отсюда!');
REPLACE INTO `locales_creature_text` (`entry`, `textGroup`, `id`, `text_loc1`, `text_loc2`, `text_loc3`, `text_loc4`, `text_loc5`, `text_loc6`, `text_loc7`, `text_loc8`) VALUES 
(18210, 0, 0, null, null, null, null, null, null, null, 'Осторожно!'),
(18210, 1, 0, null, null, null, null, null, null, null, 'Не дай им уйти! Сначала убей самого сильного!'),
(18210, 2, 0, null, null, null, null, null, null, null, 'Снова они! Берегись!'),
(18210, 3, 0, null, null, null, null, null, null, null, 'Ты куда это собрался? Убей всех!'),
(18210, 4, 0, null, null, null, null, null, null, null, 'Гори же, мерзость!'),
(18210, 5, 0, null, null, null, null, null, null, null, 'ЛЕДЯНОЙ ШОК!'),
(18210, 6, 0, null, null, null, null, null, null, null, 'Сейчас нам лучше разделиться – на случай если за нами пошлют еще врагов. Надеюсь, хоть один из нас вернется к Гаррошу! Прощай, странник.'),
(18209, 0, 0, null, null, null, null, null, null, null, 'Нас окружили!'),
(18209, 1, 0, null, null, null, null, null, null, null, 'Не дай им уйти! Сначала убей самого сильного!'),
(18209, 2, 0, null, null, null, null, null, null, null, 'Засада! Защищайтесь!'),
(18209, 3, 0, null, null, null, null, null, null, null, 'Ты куда это собрался? Убей всех!'),
(18209, 4, 0, null, null, null, null, null, null, null, 'Гори же, мерзость!'),
(18209, 5, 0, null, null, null, null, null, null, null, 'ЛЕДЯНОЙ ШОК!'),
(18209, 6, 0, null, null, null, null, null, null, null, 'Впереди – дорога к Телаару. Мы разделимся, когда дойдем до развилки, так как они наверняка пошлют за нами еще Темную Кровь. Надеюсь, один из нас сможет вернуться в Телаар живым.');
REPLACE INTO `locales_creature_text` (`entry`, `textGroup`, `id`, `text_loc1`, `text_loc2`, `text_loc3`, `text_loc4`, `text_loc5`, `text_loc6`, `text_loc7`, `text_loc8`) VALUES 
(18471, 0, 0, null, null, null, null, null, null, null, 'Добро пожаловать в Кольцо Крови, $N. Бой вот-вот начнется!'),
(18471, 1, 0, null, null, null, null, null, null, null, 'Битва вот-вот начнется! $N против свирепого копытня, Хромонога!'),
(18471, 2, 0, null, null, null, null, null, null, null, '$N $gпобедил:победила; Хромонога!'),
(18471, 4, 0, null, null, null, null, null, null, null, 'Невероятно! $N $gпобедил:победила; близнецов Темной Крови!'),
(18471, 6, 0, null, null, null, null, null, null, null, '$N снова $gпобедил:победила;!'),
(18471, 3, 0, null, null, null, null, null, null, null, 'Битва вот-вот начнется! Безпощадные близнецы Темной Крови против $N!'),
(18471, 5, 0, null, null, null, null, null, null, null, 'Родом из скалистых гор Острогорья на ринг выходит Камнедар Выщербленный Повелитель. $N вступает в борьбу, на кону $g его: ее; жизнь.'),
(18471, 7, 0, null, null, null, null, null, null, null, 'Следующим на бой выходит неизвестный: Скрагат! Сможет ли $N выжить после натиска энергии пустоты?'),
(18471, 8, 0, null, null, null, null, null, null, null, '$N вновь одерживает победу!'),
(18471, 9, 0, null, null, null, null, null, null, null, 'Этого момента мы все ждали! Чемпион Боевого Молота собирается сделать свой первый выход на Кольцо Крови спустя множество недель. Войдет ли $N в поражение так же легко, как и другие противники чемпиона? Мы увидим...'),
(18471, 10, 0, null, null, null, null, null, null, null, '$N побеждает героя Боевого Молота, Могора! Слава $N!'),
(18069, 0, 0, null, null, null, null, null, null, null, '%s переходит в состояние безумия!'),
(18069, 1, 0, null, null, null, null, null, null, null, 'Вот это была лажа!.. Могор мог гораздо лучше биться!'),
(18069, 2, 0, null, null, null, null, null, null, null, 'Могор не впечатлился! Скрагат был сделан из воздуха и тени! Безвредный, как мягкие орки!'),
(18069, 3, 0, null, null, null, null, null, null, null, 'Теперь с настоящим чемпионом встретишься! Даю тебе шанс убежать, малыш. Беги, пока Могор тебя не ликвир… ливкидир… Беги, а то Могор УБЬЕТ!'),
(18069, 4, 0, null, null, null, null, null, null, null, 'Хватит! Пора заплатить огру!'),
(18069, 5, 0, null, null, null, null, null, null, null, 'Больше никаких добрых огров! Ты обидел Могор!'),
(18069, 6, 0, null, null, null, null, null, null, null, 'Что? НЕ МОЖЕТ БЫТЬ! Ты биться с Могор сейчас! Могор крушить!');
REPLACE INTO `locales_creature_text` (`entry`, `textGroup`, `id`, `text_loc1`, `text_loc2`, `text_loc3`, `text_loc4`, `text_loc5`, `text_loc6`, `text_loc7`, `text_loc8`) VALUES 
(19035, 0, 0, null, null, null, null, null, null, null, 'Милые, славные пятнистые яйца – вы будете моими…'),
(19035, 1, 1, null, null, null, null, null, null, null, 'Если бы только эта проклятая машина заработала!'),
(19035, 2, 2, null, null, null, null, null, null, null, 'Как заманчиво выглядят…');
REPLACE INTO `locales_creature_text` (`entry`, `textGroup`, `id`, `text_loc1`, `text_loc2`, `text_loc3`, `text_loc4`, `text_loc5`, `text_loc6`, `text_loc7`, `text_loc8`) VALUES 
(37007, 0, 0, null, null, null, null, null, null, null, 'В покои господина проникли!'),
(37007, 0, 1, null, null, null, null, null, null, null, 'Я пробудился...'),
(37007, 0, 2, null, null, null, null, null, null, null, 'Кто... идет?'),
(33303, 0, 0, null, null, null, null, null, null, null, 'Благодарю тебя, $gсмертный:смертная;, за мое освобождение. Прошу, прими этот клинок.'),
(33303, 1, 0, null, null, null, null, null, null, null, 'Эта вещь не принесла мне ничего, кроме несчастий. Может статься, ты найдешь того, кто совладает с ее безумной мощью.');

REPLACE INTO `locales_gossip_menu_option` (`menu_id`, `id`, `option_text_loc1`, `option_text_loc2`, `option_text_loc3`, `option_text_loc4`, `option_text_loc5`, `option_text_loc6`, `option_text_loc7`, `option_text_loc8`, `box_text_loc1`, `box_text_loc2`, `box_text_loc3`, `box_text_loc4`, `box_text_loc5`, `box_text_loc6`, `box_text_loc7`, `box_text_loc8`) VALUES
(10857, 0, null, null, null, null, null, null, null, 'Я $gготов:готова; встретится с Магистром Хаторелем, и доставить книгу.', null, null, null, null, null, null, null, null),
(10857, 1, null, null, null, null, null, null, null, 'Хотите обновить свою маскировку?', null, null, null, null, null, null, null, null),
(10858, 0, null, null, null, null, null, null, null, 'Я $gготов:готова; встретится с Чародеем Тибалин, и доставить книгу. ', null, null, null, null, null, null, null, null),
(10858, 1, null, null, null, null, null, null, null, 'Хотите обновить свою маскировку?', null, null, null, null, null, null, null, null);
REPLACE INTO `locales_gossip_menu_option` (`menu_id`, `id`, `option_text_loc1`, `option_text_loc2`, `option_text_loc3`, `option_text_loc4`, `option_text_loc5`, `option_text_loc6`, `option_text_loc7`, `option_text_loc8`, `box_text_loc1`, `box_text_loc2`, `box_text_loc3`, `box_text_loc4`, `box_text_loc5`, `box_text_loc6`, `box_text_loc7`, `box_text_loc8`) VALUES
(10199, 0, null, null, null, null, null, null, null, 'Что вы знаете о древних мечах?', null, null, null, null, null, null, null, null),
(10199, 1, null, null, null, null, null, null, null, 'Что вы знаете о древних мечах?', null, null, null, null, null, null, null, null);
REPLACE INTO `locales_gossip_menu_option` (`menu_id`, `id`, `option_text_loc1`, `option_text_loc2`, `option_text_loc3`, `option_text_loc4`, `option_text_loc5`, `option_text_loc6`, `option_text_loc7`, `option_text_loc8`, `box_text_loc1`, `box_text_loc2`, `box_text_loc3`, `box_text_loc4`, `box_text_loc5`, `box_text_loc6`, `box_text_loc7`, `box_text_loc8`) VALUES
(7675, 0, null, null, null, null, null, null, null, 'Я $gубил:убила; множество ваших огров, Лантрезор. Я не имею страха!', null, null, null, null, null, null, null, null),
(7675, 1, null, null, null, null, null, null, null, 'Я $gубил:убила множество ваших огров, Лантрезор. Я не имею страха!', null, null, null, null, null, null, null, null),
(7682, 0, null, null, null, null, null, null, null, 'Я $gдолжен:должна; знать? Для меня вы все орки на одно лицо.', null, null, null, null, null, null, null, null),
(7681, 0, null, null, null, null, null, null, null, 'А другая половина?', null, null, null, null, null, null, null, null),
(7680, 0, null, null, null, null, null, null, null, 'Я $gслышал:слышала; о вашем роде, но я никогда не $gдумал:думала;, что настанет тот день, когда я встречусь с одним из вас.', null, null, null, null, null, null, null, null),
(7679, 0, null, null, null, null, null, null, null, 'Я прошу прощения. Я не $gхотел:хотела; вас обидеть. Я здесь от имено своего народа.', null, null, null, null, null, null, null, null),
(7678, 0, null, null, null, null, null, null, null, 'Мой народ хочет, чтобы вы увели ваших огров и прекратили все нападения на наших территориях. В свою очередь, мы также отзавем свои силы.', null, null, null, null, null, null, null, null),
(7677, 0, null, null, null, null, null, null, null, 'Мы будем бороться с вами до конца, Лантрезор. Мы не будем сидеть сложа руки, пока вы грабите наши города и убиваете наших людей.', null, null, null, null, null, null, null, null),
(7676, 0, null, null, null, null, null, null, null, 'Что мне нужно сделать?', null, null, null, null, null, null, null, null),
(7676, 1, null, null, null, null, null, null, null, 'Что мне нужно сделать?', null, null, null, null, null, null, null, null),
(7719, 1, null, null, null, null, null, null, null, 'Расскажите мне о полигонах охотников скверны на Руинах Карабора', null, null, null, null, null, null, null, null),
(8394, 0, null, null, null, null, null, null, null, 'Я слушаю.', null, null, null, null, null, null, null, null),
(8393, 0, null, null, null, null, null, null, null, 'Продолжайте, пожалуйста.', null, null, null, null, null, null, null, null),
(8395, 0, null, null, null, null, null, null, null, 'Интересно.', null, null, null, null, null, null, null, null),
(8396, 0, null, null, null, null, null, null, null, 'Это целая история.', null, null, null, null, null, null, null, null),
(7719, 0, null, null, null, null, null, null, null, 'Я еще $gхотел:хотела; спросить вас, Алтруис.', null, null, null, null, null, null, null, null),
(7718, 0, null, null, null, null, null, null, null, 'Легион?', null, null, null, null, null, null, null, null),
(7717, 0, null, null, null, null, null, null, null, 'А теперь?', null, null, null, null, null, null, null, null),
(7716, 0, null, null, null, null, null, null, null, 'Как вы видете сейчас?', null, null, null, null, null, null, null, null),
(7715, 0, null, null, null, null, null, null, null, 'Кузница лагеря?', null, null, null, null, null, null, null, null);

UPDATE `db_script_string` SET `content_loc8`='О, неплохой вкус! Я думаю что я позволю себе еще пару...ты можешь посмотреть за этими бочками для меня, $N?' WHERE `entry`='2000000729';
UPDATE `creature_ai_texts` SET `content_loc8`='Это было ужасно... Мне казалось, будто я сражаюсь со своими друзьями.' WHERE `entry`='-10005';

-- Очищение Стратхольма
REPLACE INTO `locales_gossip_menu_option` (`menu_id`, `id`, `option_text_loc1`, `option_text_loc2`, `option_text_loc3`, `option_text_loc4`, `option_text_loc5`, `option_text_loc6`, `option_text_loc7`, `option_text_loc8`, `box_text_loc1`, `box_text_loc2`, `box_text_loc3`, `box_text_loc4`, `box_text_loc5`, `box_text_loc6`, `box_text_loc7`, `box_text_loc8`) VALUES
(9586, 0, null, null, null, null, null, null, null, 'Почему я был отправлен обратно в это место?', null, null, null, null, null, null, null, null),
(9594, 0, null, null, null, null, null, null, null, 'Что это за решение?', null, null, null, null, null, null, null, null),
(9595, 0, null, null, null, null, null, null, null, 'Нужно вмешаться в план драконов Бесконечности?', null, null, null, null, null, null, null, null);

REPLACE INTO `locales_creature_text` (`entry`, `textGroup`, `id`, `text_loc1`, `text_loc2`, `text_loc3`, `text_loc4`, `text_loc5`, `text_loc6`, `text_loc7`, `text_loc8`) VALUES 
(27447, 0, 0, null, null, null, null, null, null, null, 'Пощады не будет!'),
(27447, 1, 1, null, null, null, null, null, null, null, 'Нанесите удар! Уничтожьте их!'),
(27447, 2, 2, null, null, null, null, null, null, null, '%s призиывает Капитана лазурного кольца.'),
(27447, 3, 3, null, null, null, null, null, null, null, 'Они... слишком сильны. Я недооценил... их мужества.'),
(28012, 0, 0, null, null, null, null, null, null, null, 'Этот плут маг-лорд Уром обороняет третий уровень. Он появится один и беззащитный, но не дайте себя обмануть! Уром – могущественный кудесник, командующий целым зверинцем ирреальных созданий. Ищите его наверху.'),
(28012, 1, 1, null, null, null, null, null, null, null, 'Самое сложное для тебя впереди. Хранитель энергии Эрегос – синий дракон колоссальной силы. Он может стать временно неуязвим к заклинаниям огня, сил природы или тайной магии, используемым твоими драконами. Он летает над самым верхним кольцом.');

REPLACE INTO `locales_creature_text` (`entry`, `textGroup`, `id`, `text_loc1`, `text_loc2`, `text_loc3`, `text_loc4`, `text_loc5`, `text_loc6`, `text_loc7`, `text_loc8`) VALUES 
(27656, 0, 0, null, null, null, null, null, null, null, 'Нахальные невежды, вы все в небесах витаете! Сейчас я вас заземлю!'),
(27656, 1, 0, null, null, null, null, null, null, null, 'Какая заносчивость… какая чванливость… Вы заслуживаете кары!'),
(27656, 2, 0, null, null, null, null, null, null, null, 'Радуйтесь этой маленькой победе, маленькие глупцы. Вы и ваши союзнички-драконы выиграли это сражение, ну, а мы… мы победим в Войне Нексуса.');

-- Крепость Утгард
REPLACE INTO `locales_creature_text` (`entry`, `textGroup`, `id`, `text_loc1`, `text_loc2`, `text_loc3`, `text_loc4`, `text_loc5`, `text_loc6`, `text_loc7`, `text_loc8`) VALUES 
(23953, 1, 0, null, null, null, null, null, null, null, 'Ваша кровь принадлежит мне!'),
(23953, 2, 0, null, null, null, null, null, null, null, 'Арана ледел! Их судьба должна быть подобна вашей!'),
(23953, 3, 0, null, null, null, null, null, null, null, 'Не так быстро.'),
(23953, 4, 0, null, null, null, null, null, null, null, '%s сбрасывает Морозную гробницу на $n.'),
(23953, 5, 0, null, null, null, null, null, null, null, 'Ночь… прими меня…');

-- Вершина Утгард
REPLACE INTO `locales_creature_text` (`entry`, `textGroup`, `id`, `text_loc1`, `text_loc2`, `text_loc3`, `text_loc4`, `text_loc5`, `text_loc6`, `text_loc7`, `text_loc8`) VALUES 
(29281, 0, 0, null, null, null, null, null, null, null, 'Мой господин! Я сделала, как вы велели, и теперь молю вас о благословении!'),
(26668, 0, 0, null, null, null, null, null, null, null, 'Эти ощущения… невозможно передать. Приказывай, мой король.'),
(26668, 1, 0, null, null, null, null, null, null, null, 'Я с радостью уничтожу их во имя тебя! Ну что ж, враги Плети! Я покажу вам всю силу Короля-лича!'),
(26668, 2, 0, null, null, null, null, null, null, null, 'Я порабощу ваши души!'),
(26668, 3, 0, null, null, null, null, null, null, null, 'Только глупец мог бросить вызов власти Короля-лича!'),
(26668, 3, 1, null, null, null, null, null, null, null, 'Твоя воля исполнена, мой король!'),
(26668, 3, 2, null, null, null, null, null, null, null, 'Еще одна душа для моего повелителя.'),
(26668, 4, 0, null, null, null, null, null, null, null, 'Я не для того столько пережила… чтобы…'),
(26668, 5, 0, null, null, null, null, null, null, null, 'Смерть близка…'),
(26668, 5, 1, null, null, null, null, null, null, null, 'Отправляйся к моему господину!'),
(26668, 5, 2, null, null, null, null, null, null, null, 'Конец неизбежен.'),
(26668, 5, 3, null, null, null, null, null, null, null, 'Йор-гуул мак!'),
(26668, 5, 4, null, null, null, null, null, null, null, 'Последнее желание?'),
(29280, 0, 0, null, null, null, null, null, null, null, 'Твоя жертва является лучшим потверждением твоей преданности. Во истину ты достойна этой ноши. Востань, отныне и во веки веков ты будешь известна как Свала Вечноскорбящая!'),
(29280, 1, 0, null, null, null, null, null, null, null, 'Твое первое испытание ждет. Уничтожь наших непрошенных гостей.');

UPDATE `locales_quest` SET `OfferRewardText_loc8`='Призраки и полное безумие? Не может быть!\n\nМы должны искать дальше, что делать.' WHERE `entry`='12028';
UPDATE `locales_quest` SET `OfferRewardText_loc8`='Возрадуемся твоему успеху, мой юный друг! В воде разлита кровь – и это кровь нашего врага!\n\nЭтот старый рыбак навечно тебе благодарен, а также тебя ждет благодарность всех калу\'аков, как только я сообщу им!\n\nВот, я настаиваю, чтобы ты хоть что-то взял себе в качестве награды. Пожалуйста!' WHERE `entry`='12017';
UPDATE `locales_quest` SET `OfferRewardText_loc8`='Я ждал тебя, |3-6($R). Я видел, как мимо пролетал твой дух, и почуял мистическое наблюдение, которое велось твоими глазами.\n\nТвоя судьба и судьба калу\'аков отныне связаны.' WHERE `entry`='12030';
UPDATE `locales_quest` SET `OfferRewardText_loc8`='Где вы это нашли? Многие из этих ожерелий были разграблены с одной из моих поставок несколько недель назад! Позвольте мне отблагодарить вас Знаком Ювелира.' WHERE `entry`='13148';

REPLACE INTO `locales_creature_text` (`entry`, `textGroup`, `id`, `text_loc1`, `text_loc2`, `text_loc3`, `text_loc4`, `text_loc5`, `text_loc6`, `text_loc7`, `text_loc8`) VALUES 
(33788, 0, 0, null, null, null, null, null, null, null, 'Этим маленьким деревцам нужна помощь, их нужно защитить от этого сильного ветра.'),
(33788, 0, 1, null, null, null, null, null, null, null, 'Вы там?'),
(33788, 0, 2, null, null, null, null, null, null, null, 'Расти, малыш.');

REPLACE INTO `locales_gossip_menu_option` (`menu_id`, `id`, `option_text_loc1`, `option_text_loc2`, `option_text_loc3`, `option_text_loc4`, `option_text_loc5`, `option_text_loc6`, `option_text_loc7`, `option_text_loc8`, `box_text_loc1`, `box_text_loc2`, `box_text_loc3`, `box_text_loc4`, `box_text_loc5`, `box_text_loc6`, `box_text_loc7`, `box_text_loc8`) VALUES
(9280, 0, null, null, null, null, null, null, null, '<Обыскать труп Ирука на предмет наличия тотема.>', null, null, null, null, null, null, null, null);

-- Добавление перевода к Даларанским дейликам Ювелирного дела, Кулинарии и Рыбалки.
UPDATE `locales_quest` SET `RequestItemsText_loc8`='Ты $gпринес:принесла; мне амулет из кровавого нефрита для отправки в Нижнюю шахту?' WHERE `entry`='12958';
UPDATE `locales_quest` SET `RequestItemsText_loc8`='Ты $gпринес:принесла; мне реликвию из сияющей брони для отправки в Нижнюю шахту?' WHERE `entry`='12962';
UPDATE `locales_quest` SET `RequestItemsText_loc8`='Есть ли у вас еще Кальцедоний?' WHERE `entry`='13041';
UPDATE `locales_quest` SET `OfferRewardText_loc8`='Вот ваш Даларанский Знак Ювелира, как и обещал. Я все время отправляю новые поставки, но время от времени мне может потребоваться что-то еще.' WHERE `entry`='13041';
UPDATE `locales_quest` SET `OfferRewardText_loc8`='Это хороший список дел, $N! Вы должны быть хорошо вознаграждены за ваши достижения.' WHERE `entry`='14160';
UPDATE `locales_quest` SET `RequestItemsText_loc8`='Ты $gпринес:принесла; мне поесть? А то сижу тут, как привязанный. Ни на секунду не выйти из лавки! А кушать-то хочется!' WHERE `entry`='13112';
UPDATE `locales_quest` SET `RequestItemsText_loc8`='Мои постояльцы голодны! Мне срочно нужно рагу.' WHERE `entry`='13114';
UPDATE `locales_quest` SET `OfferRewardText_loc8`='Замечательно! Надеюсь, "Даларанские крушители" сегодня вырвутся вперед!' WHERE `entry`='13107';
UPDATE `locales_quest` SET `RequestItemsText_loc8`='Я почти готов, мне только нужна пища и для моих товарищей тоже.' WHERE `entry`='13107';
UPDATE `locales_quest` SET `RequestItemsText_loc8`='Я почти готов, мне только нужна пища и для моих товарищей тоже.' WHERE `entry`='13116';
UPDATE `locales_quest` SET `OfferRewardText_loc8`='Думаю, гости будут довольны. Только не говори им, что я заказывал еду у Авило.' WHERE `entry`='13101';
UPDATE `locales_quest` SET `RequestItemsText_loc8`='Где моя еда, здесь собирется делигация в любую минуту!' WHERE `entry`='13101';
UPDATE `locales_quest` SET `RequestItemsText_loc8`='Где моя еда, здесь собирется делигация в любую минуту!' WHERE `entry`='13113';
UPDATE `locales_quest` SET `RequestItemsText_loc8`='Ты не $gвидел:видела; слугу с моим вином и сыром? Жрать хочу – умираю!' WHERE `entry`='13115';
UPDATE `locales_quest` SET `OfferRewardText_loc8`='Так значит она делает вас невидимым... какая странная защита у этой рыбы. Мне потребуется время чтобы все это переварить. Действительно. Почему бы вам не зайти ко мне завтра?' WHERE `entry`='13830';
UPDATE `locales_quest` SET `OfferRewardText_loc8`='Ну что, похоже это может быть ценным. Трудно оценивать пока они не очищены, но я по-прежнему готов пойти на сделку, если вы готовы.' WHERE `entry`='13832'; 

-- Око вечности
DELETE FROM `locales_creature_text` WHERE entry = 28859;
INSERT INTO `locales_creature_text` VALUES
('28859', '0', '0', null, null, null, null, null, null, null, 'Мое терпение лопнуло, пора от вас избавиться!'),
('28859', '1', '0', null, null, null, null, null, null, null, 'Ну вот ты и встретился со своей глупостью.'),
('28859', '1', '1', null, null, null, null, null, null, null, 'Еще один экспонат для моей коллекции...'),
('28859', '1', '2', null, null, null, null, null, null, null, 'Мхахахахахаха... Так... наивно...'),
('28859', '2', '0', null, null, null, null, null, null, null, 'Я надеялся быстро с вами покончить, но вы оказались более живучими, чем я ожидал. Тем не менее, все ваши попытки тщетны, это вы безрассудные, беспечные смертные, вы виноваты в этой войне! Я сделаю то, что я должен сделать... Если это потребует вашего полного... уничтожения... ДА БУДЕТ ТАК!'),
('28859', '3', '0', null, null, null, null, null, null, null, 'Немногие испытывали боль подобную той, что я сейчас причиню вам!'),
('28859', '4', '0', null, null, null, null, null, null, null, 'Я покажу вам, МАЛОГРАМОТНЫМ детям, как мало вы знаете о магии...'),
('28859', '5', '0', null, null, null, null, null, null, null, 'Смотрите беспомощно, как утекают ваши надежды...'),
('28859', '6', '0', null, null, null, null, null, null, null, 'Твою энергию используют по назначению!'),
('28859', '6', '1', null, null, null, null, null, null, null, 'Я Хранитель магии! Моя сила безгранична!'),
('28859', '6', '2', null, null, null, null, null, null, null, 'Твой дух будет вечно скитаться здесь!'),
('28859', '7', '0', null, null, null, null, null, null, null, 'ХВАТИТ! Раз вы хотите магии Азерота, то вы ее получите...'),
('28859', '8', '0', null, null, null, null, null, null, null, 'Вот и ваши благодетели появились... Но слишком поздно. Сил находящихся здесь хватит, чтобы разрушить этот мир десять раз подряд! А что вы думаете они сделают с вами?'),
('28859', '9', '0', null, null, null, null, null, null, null, 'СДАВАЙТЕСЬ!'),
('28859', '10', '0', null, null, null, null, null, null, null, 'Вам не хватит воображения, чтобы оценить мощь сил задействованных здесь!'),
('28859', '11', '0', null, null, null, null, null, null, null, 'МЕНЯ НЕ ОСТАНОВИТЬ!'),
('28859', '12', '0', null, null, null, null, null, null, null, 'Алекстраза! Еще один из твоих пал!'),
('28859', '12', '1', null, null, null, null, null, null, null, 'Чуть больше комара!'),
('28859', '12', '2', null, null, null, null, null, null, null, 'Твоих красных союзников ждет таже участь...'),
('28859', '13', '0', null, null, null, null, null, null, null, 'Еще на ногах? Не надолго...'),
('28859', '13', '1', null, null, null, null, null, null, null, 'Вы проиграли.'),
('28859', '13', '2', null, null, null, null, null, null, null, 'Ваш хрупкий разум будет сокрушен!'),
('28859', '14', '0', null, null, null, null, null, null, null, 'Невероятно! Смертные разрушат... все... сестра моя... что ты...');