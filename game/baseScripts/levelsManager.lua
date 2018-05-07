local config = require "main.config.config"

local M = {}

local saveData = {}

M.first = true

function M.loadSave(saveSlot)
	saveSlot = saveSlot or "slot01"

	local my_file_path = sys.get_save_file(config.saveName, config.saveName.."game_save_"..saveSlot)

	if M.first == true then
		sys.save(my_file_path, {})
		M.first = false
		
		saveData = {}
		
		print("CLEAR SAVE")
	else
		saveData = sys.load(my_file_path)
	end
	
	if not next(saveData) then
	    saveData.levels = {}							-- тут хранятся все уровни: тайлы, объекты, пути.
	    saveData.currentLevel = config.nameBeginLevel	-- далее хранятся другие характеристики, которые подлежат сохранению 
	    
	    saveData.hero_data = {equipments = {0, 0, 0, 0, 0}}
	    saveData.swipe_msg = {}
	end
end

function M.save(saveSlot)
	saveSlot = saveSlot or "slot01"
	
	local my_file_path = sys.get_save_file(config.saveName, config.saveName.."game_save_"..saveSlot)
	
	if not sys.save(my_file_path, saveData) then
	    print("Error: Game was not saved!")
	else 

	end
end

function M.isSavedLevel()
	return saveData.levels[saveData.currentLevel] ~= nil
end

function M.setCurrentLevel(levelName)
	saveData.currentLevel = levelName
end

function M.getCurrentLevel()
	return saveData.currentLevel
end

function M.getHeroData()
	return saveData.hero_data
end

function M.addCurrentSwiper(swiper)
	table.insert(saveData.swipe_msg, swiper)
end

function M.findSwiper(dialog_id)
	for i = 1, #saveData.swipe_msg do
		for j = 1, #saveData.swipe_msg[i], 2 do
			if saveData.swipe_msg[i][j] == dialog_id then
				local new_dlg = saveData.swipe_msg[i][j + 1]
				
				--table.remove(saveData.swipe_msg, i)
				
				return new_dlg, i
			end
		end
	end
	
	return nil, nil
end

function M.deleteSwiper(dialog_ids)
	for i = 1, #dialog_ids do
		local _,i = M.findSwiper(dialog_ids[i])
		
		if i ~= nil then
			table.remove(saveData.swipe_msg, i)
		end
	end
end

function M.buildLevel(levelName)
	local code_str = sys.load_resource("/levels/"..levelName..".lua")

	return assert(loadstring(code_str))()
end

	local function deepcopy(orig)
	    local orig_type = type(orig)
	    local copy
	    if orig_type == 'table' then
	        copy = {}
	        for orig_key, orig_value in next, orig, nil do
	            copy[deepcopy(orig_key)] = deepcopy(orig_value)
	        end
	        setmetatable(copy, deepcopy(getmetatable(orig)))
	    else -- number, string, boolean, etc
	        copy = orig
	    end
	    return copy
	end
	
function M.mirror(obj, sub)
	--obj = {}
	obj.heroStart = sub.heroStart

	obj.width = sub.width
	obj.heigth = sub.heigth
	
	obj.tiles = {}
	obj.nodes = {}
	
	for i = 1, #sub.tiles do
		table.insert(obj.tiles, {
			id = -1, tid = sub.tiles[i].tid, position = sub.tiles[i].position, 
						gid = sub.tiles[i].gid, frame = sub.tiles[i].frame, opened = sub.tiles[i].opened, objects = {}
		})
		
		for j = 1, #sub.tiles[i].objects do
			table.insert(obj.tiles[i].objects, {
				id = -1, type = sub.tiles[i].objects[j].type,  position = sub.tiles[i].objects[j].position, 
				dialog = sub.tiles[i].objects[j].dialog, reflection = sub.tiles[i].objects[j].reflection
				})
		end
	end
	
	--sub.nodes[i]:copy()
	for i = 1, #sub.nodes do
		local children = {}
		
		table.insert(obj.nodes, 
			{ID = sub.nodes[i].ID, IDTile = sub.nodes[i].IDTile, IDParent = sub.nodes[i].IDParent,
				nodes = {}, pos = {x = 0, y = 0},
				block = sub.nodes[i].block, blockID = sub.nodes[i].blockID, mark = sub.nodes[i].mark
			}
		)
		
		obj.nodes[i].pos.x = sub.nodes[i].pos.x
		obj.nodes[i].pos.y = sub.nodes[i].pos.y
		
		for j = 1, #sub.nodes[i].nodes do
			table.insert(obj.nodes[i].nodes, sub.nodes[i].nodes[j])
		end
	end
	
end


function M.save_current(data)
	saveData.levels[saveData.currentLevel] = {}
	M.mirror(saveData.levels[saveData.currentLevel], data)
	M.save()
end

function M.current_level_data()
	return saveData.levels[saveData.currentLevel]
end

function M.buildCurrentLevel()
	return M.buildLevel(saveData.currentLevel)
	--M.loadLevel(saveData.currentLevel)
end

function M.createLevel()
	saveData.levels[saveData.currentLevel] = {}
	saveData.levels[saveData.currentLevel].heroStart = 0
	saveData.levels[saveData.currentLevel].width = 0
	saveData.levels[saveData.currentLevel].height = 0
	saveData.levels[saveData.currentLevel].tiles = {}
	saveData.levels[saveData.currentLevel].nodes = {}
	return saveData.levels[saveData.currentLevel] 
	--M.loadLevel(saveData.currentLevel)
end


return M