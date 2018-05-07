
local M = {}

	M.bgColor = vmath.vector4(30/255, 35/255, 41/255, 0)
	
	M.isMobile = false
	
	M.currentLevel = nil  -- ид текущего лвла, на котором происходит все безобразие
	M.heroID = nil
	M.battleScreen = nil

	M.language = 2   -- 1: rus, 2: eng

	-- размеры дефолтного экрана
	M.defaultWidth = 0
	M.defaultHeight = 0
	
	-- устанавливаются при старте
	M.width = 0
	M.height = 0
	M.halfWidth = 0
	M.halfHeight = 0
	
	M.ratio = 1
	M.ratio_max = 1
	M.scale = 1
	M.zoom = 1
	M.countWidthTile = 6  -- условное количество тайлов, укладывающихся по ширине
	
	M.spineScale = 0.24 * 1.6 -- 0.9
	
	-- настройки для мапы
	M.tileBorder = 1 -- дырки между тайлами
	M.tileWidth = 292 + M.tileBorder   -- размеры КРЫШКИ гекса
	M.tileHeight = 253
	M.tileSide = M.tileWidth / math.sqrt(3)
	M.tileScaleY = M.tileHeight / (2 * M.tileSide)
	M.tileOffsetY = M.tileSide * 1.5 * M.tileScaleY + M.tileBorder
	
	--M.map_distance = 1   -- дальность прорисовки карты
	M.vignette_effect = 1   -- виньетка
	
	M.cameraOffsetY = 80 -- смещение камеры относительно центра вниз
	
	M.__zoom = 1
	M.getRatio = function()
		M.__zoom = M.__zoom  + (M.zoom - M.__zoom) * 0.00005
		
		return M.ratio / M.scale * M.__zoom
	end
	
	M.inScreen = function(x, y, coef)
		coef = coef or 1
	
		local dx = M.tileWidth * 2 * M.getRatio()
		local dy = M.tileHeight * 2 * M.getRatio()
		
		if x < (-M.halfWidth - dx) * coef then return false end
		if x >  (M.halfWidth + dx) * coef then return false end
		if y < (-M.halfHeight - dy) * coef then return false end
		if y >  (M.halfHeight + dy) * coef then return false end
		
		return true
	end
	
	--
	M.saveName = "PTSS_SAVE_7"
	M.nameBeginLevel = "Test"  -- Самый-самый первый игровой уровень Test
	 
	-- game
	M.countCardsInHand = 4
	M.countDeletedCards = 12

return M