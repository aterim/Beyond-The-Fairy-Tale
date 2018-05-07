

local M = {}

 ---- TYPES:
 -- 0: weapons
 -- 1: shields
 -- 2: other

	M.DATA = {
		{
			id = 1, 
			icon = "eq_icon_001", 
			type = 0, 
			cards = {2, 3},		-- один тип заменяется другим
			name = {"Ветка", " ... "}, 
			description = {"Описание на русском", "Lopsjhjhj jhjk kiuh hh."} 
		},
		{
			id = 2, 
			icon = "eq_icon_002", 
			type = 2, 
			name = {"Кости", " ... "}, 
			description = {"Описание на русском", "Lopsjhjhj jhjk kiuh hh."} 
		},
	}

return M