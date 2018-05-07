

local M = {}

	-- characters
	M.character = {
		
		{type = 1, name = "Old Wolf", hp = 4}
	
	}
	
	--[[
	
		Карты разложены относительно типов персонажа. То есть, тут представлены всевозможные карты
		При этом у главного персонажа, ко всему прочему, еще где-то имеется массив с идами доступных ему карт, 
			остальем доступны все карты изначально
	--]]
	
	M.cards = {
		-- Ivan
		[0] = { 
			{icon = "card_icon_attack", attack = 1, defence = 0, boost = false, 
				name = {"Оплеуха", "Slap"}, description = {"Замахнуться да влепить покрепче. Будет врагу наука!", "Swing and slap him firmly. The foe will learn his lesson!"}}, 
			
			{icon = "card_icon_attack", attack = 1, defence = 0, boost = false, 
				name = {"Оплеуха", "Slap"}, description = {"Замахнуться да влепить покрепче. Будет врагу наука! ", "Swing and slap him firmly. The foe will learn his lesson!"}}, 
			
			{icon = "card_icon_attack", attack = 2, defence = 0, boost = false, 
				name = {"Удар кулаком", "Punch"}, description = {"Нет ничего кулака надежней. Раз-два и дело с концом.", "Ah, nothing straighter than good ol' fist. One-two and that will be that."}}, 
			
			{icon = "card_icon_attack", attack = 2, defence = 0, boost = false, 
				name = {"Удар кулаком", "Punch"}, description = {"Нет ничего кулака надежней. Раз-два и дело с концом.", "Ah, nothing straighter than good ol' fist. One-two and that will be that."}}, 
			
			
			{icon = "card_icon_shield", attack = 0, defence = 1, boost = false, 
				name = {"Блок", "Block"}, description = {"Как горох от стены один за другим удары отскакивают.", "The hits are bouncing one by one like peas off the wall."}}, 
			
			{icon = "card_icon_shield", attack = 0, defence = 1, boost = false, 
				name = {"Блок", "Block"}, description = {"Как горох от стены один за другим удары отскакивают.", "The hits are bouncing one by one like peas off the wall."}}, 
			
			{icon = "card_icon_shield", attack = 0, defence = 3, boost = false, 
				name = {"Уворот", "Dodge"}, description = {"Словно змея верткий. Что ни удар, то мимо.", "As agile as a snake. Each hit is a miss."}}, 
			
			{icon = "card_icon_none", attack = 0, defence = 0, boost = false, 
			name = {"Зазеваться", "Stand yawning"}, description = {"Не гоже в бою ворон считать! Так и схлопотать недолго.", "It's not right to daydream in battle! This way you can catch flack easily."}}, 
				
			{icon = "card_icon_none", attack = 0, defence = 0, boost = false, 
				name = {"Зазеваться", "Stand yawning"}, description = {"Не гоже в бою ворон считать! Так и схлопотать недолго.", "It's not right to daydream in battle! This way you can catch flack easily."}}, 
			
			
			{icon = "card_icon_none", attack = 0, defence = 0, boost = false, 
				name = {"Зазеваться", "Stand yawning"}, description = {"Не гоже в бою ворон считать! Так и схлопотать недолго.", "It's not right to daydream in battle! This way you can catch flack easily."}} 
		}, 
		
		[4] = { 
			{icon = "card_icon_attack", attack = 1, defence = 0, boost = false, 
				name = {"Тычок", "Poke"}, description = {"Тронет легонько палочка да вмиг бока синяками раскрасит!", "A stick will touch lightly but it will instantly colour the sides with bruises!"}}, 
			
			{icon = "card_icon_attack", attack = 3, defence = 0, boost = false, 
				name = {"Удар веткой", "Hit with a branch"}, description = {"Веточка тоненькая, да кости не хуже дубины ломает.", "The branch is thin but breaks bones no worse than a club."}}, 
			
			{icon = "card_icon_attack_shield", attack = 1, defence = 1, boost = false, 
				name = {"Контратака", "Counterattack"}, description = {"Одним концом отбил, другим в ответ ударил.", "You can beat off with one end and hit back with the other."}}, 
			
			{icon = "card_icon_shield", attack = 0, defence = 3, boost = false, 
				name = {"Уворот", "Dodge"}, description = {"Словно змея верткий. Что ни удар, то мимо.", "As agile as a snake. Each hit is a miss."}}, 
			
			{icon = "card_icon_none", attack = 0, defence = 0, boost = false, 
				name = {"Зазеваться", "Stand yawning"}, description = {"Не гоже в бою ворон считать! Так и схлопотать недолго.", "It's not right to daydream in battle! This way you can catch flack easily."}}, 
			{icon = "card_icon_none", attack = 0, defence = 0, boost = false, 
				name = {"Зазеваться", "Stand yawning"}, description = {"Не гоже в бою ворон считать! Так и схлопотать недолго.", "It's not right to daydream in battle! This way you can catch flack easily."}}, 
			{icon = "card_icon_none", attack = 0, defence = 0, boost = false, 
				name = {"Зазеваться", "Stand yawning"}, description = {"Не гоже в бою ворон считать! Так и схлопотать недолго.", "It's not right to daydream in battle! This way you can catch flack easily."}} 
			
		}, 
		
		-- old wolf
		[1] = { 
			{icon = "card_icon_attack", attack = 3, defence = 0, boost = false, 
				name = {"Укус", "Bite"}, description = {"Придет серенький волчок и ухватит за бочок.", "A grey wolf will come and bite you at your side."}}, 
			
			{icon = "card_icon_attack", attack = 2, defence = 0, boost = false, 
				name = {"Удар лапой", "Hit with a paw"}, description = {"Когти острые да быстрые. Такими бы да дрова рубить!", "The claws are sharp and fast. They would be suitable to hew firewood!"}}, 
			
			{icon = "card_icon_attack", attack = 2, defence = 0, boost = false, 
				name = {"Удар лапой", "Hit with a paw"}, description = {"Когти острые да быстрые. Такими бы да дрова рубить!", "The claws are sharp and fast. They would be suitable to hew firewood!"}}, 
			
			{icon = "card_icon_attack_shield", attack = 1, defence = 1, boost = false, 
				name = {"Волчья уловка", "Wolf ploy"}, description = {"Увернётся да ещё и за руку цапнет.", "It will dodge and also nip your hand."}}, 
			
			{icon = "card_icon_none", attack = 0, defence = 0, boost = false, 
				name = {"Скуление", "Whimper"}, description = {"Верно, разжалобить пытается, серый.", "The Grey must be trying to move me to pity."}}, 
			
			{icon = "card_icon_shield", attack = 0, defence = 2, boost = false, 
				name = {"Прыг-скок", "Hop-hop"}, description = {"То к земле прижмётся, то в сторону отпрыгнет.", "Now he presses his body to the ground, then he jumps aside."}}, 
			
			{icon = "card_icon_none", attack = 0, defence = 0, boost = false, 
				name = {"Скуление", "Whimper"}, description = {"Верно, разжалобить пытается, серый.", "The Grey must be trying to move me to pity."}}, 
			
			{icon = "card_icon_shield", attack = 0, defence = 2, boost = false, 
				name = {"Прыг-скок", "Hop-hop"}, description = {"То к земле прижмётся, то в сторону отпрыгнет.", "Now he presses his body to the ground, then he jumps aside."}} 
		}, 
		
		[2] = { 
			{icon = "card_icon_attack", attack = 1, defence = 0, boost = false, 
				name = {"Удар ветками", "Hit with branches"}, description = {"Ветви хлёсткие да длинные, что кнутом хлещут!", "The branches are long and cutting and lash like a whip!"}}, 
			{icon = "card_icon_attack", attack = 3, defence = 0, boost = false, 
				name = {"Размашистый удар", "Sweeping hit"}, description = {"И не ветки будто вовсе, а кочерга раскаленная!", "As if it is not branches but a red-hot poker!"}}, 
			{icon = "card_icon_shield", attack = 0, defence = 1, boost = false, 
				name = {"Прятки за ветвями", "Hide-and-seek behind branches"}, description = {"Что стеной отгородилась, никак не достать.", "As if she fenced herself, I can't reach her."}}, 
			{icon = "card_icon_none", attack = 0, defence = 0, boost = false, 
				name = {"Шуршание листвой", "Rustle of leaves"}, description = {"Шуршит листвой грозно, да лишь силы понапрасну тратит.", "It rustles with its leaves menacingly but it wastes its energy just in vain."}}, 
			{icon = "card_icon_attack", attack = 1, defence = 0, boost = false, 
				name = {"Удар ветками", "Hit with branches"}, description = {"Ветви хлёсткие да длинные, что кнутом хлещут!", "The branches are long and cutting and lash like a whip!"}}, 
			{icon = "card_icon_none", attack = 0, defence = 0, boost = false, 
				name = {"Шуршание листвой", "Rustle of leaves"}, description = {"Шуршит листвой грозно, да лишь силы понапрасну тратит.", "It rustles with its leaves menacingly but it wastes its energy just in vain."}}, 
			
			{icon = "card_icon_attack", attack = 1, defence = 0, boost = false, 
				name = {"Удар ветками", "Hit with branches"}, description = {"Ветви хлёсткие да длинные, что кнутом хлещут!", "The branches are long and cutting and lash like a whip!"}}, 
			{icon = "card_icon_shield", attack = 0, defence = 1, boost = false, 
				name = {"Прятки за ветвями", "Hide-and-seek behind branches"}, description = {"Что стеной отгородилась, никак не достать.", "As if she fenced herself, I can't reach her."}} 
		},  
		
		[3] = { 
			{icon = "card_icon_none", attack = 0, defence = 0, boost = false, 
				name = {"Назойливое жужжание", "Annoying buzz"}, description = {"То в левом ухе жужжит, то в правом.", "There's buzzing either in the left ear or in the right one."}}, 
			{icon = "card_icon_shield", attack = 0, defence = 2, boost = false, 
				name = {"Взмыть вверх", "Soar upwards"}, description = {"Высоко забрался, и не достать теперь.", "You climbed high, I can't reach you now."}}, 
			{icon = "card_icon_attack", attack = 2, defence = 0, boost = false, 
				name = {"Укус кровопийцы", "Bloodsucker's bite"}, description = {"Пьет кровь чужую да здоровее становится.", "Drinks blood and becomes healthier."}}, 
			
			{icon = "card_icon_attack", attack = 2, defence = 0, boost = false, 
				name = {"Укус кровопийцы", "Bloodsucker's bite"}, description = {"Пьет кровь чужую да здоровее становится.", "Drinks blood and becomes healthier."}}, 
			{icon = "card_icon_none", attack = 0, defence = 0, boost = false, 
				name = {"Назойливое жужжание", "Annoying buzz"}, description = {"То в левом ухе жужжит, то в правом.", "There's buzzing either in the left ear or in the right one."}}, 
			
			{icon = "card_icon_attack", attack = 1, defence = 0, boost = false, 
				name = {"Комариная атака", "Mosquito attack"}, description = {"Много ли беды от комаринного укуса. Почешется да перестанет.", "A mosquito bite is no big deal. It will itch a bit and then will stop."}} 
		}
	}

return M