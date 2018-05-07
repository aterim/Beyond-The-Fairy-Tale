
local M = {}

function M.get_object_factory(type, battle)
	
	local postfix = battle and "" or "_mini"
	
	if type == 19 then
		return "mapTravelFactory" --"mapTravelFactory"
	elseif type >= 20 and type < 40 then
		return "spruceFactory"
	elseif type >= 100 then
		return "decorFactory"

	--elseif type == 4 then
	--	return "spruceBigFactory"
	--elseif type == 5 then
	--	return "spruceOldFactory"
	--elseif type == 6 then
	--	return "spruceYoungFactory"
	elseif type == 50 then
		return "wolfFactory"..postfix
	elseif type == 51 then
		print("++", "appleTreeFactory"..postfix)
		return "appleTreeFactory"..postfix
	elseif type == 52 then
		return "gnusFactory"..postfix
	end

	return "appleTreeFactory"
end

function M.get_tile_factory(num)
	--local num = tonumber(name:sub(6, 9))
	
	if num < 29 then
		return "tilesFactory"
	else
		return "tilesFactory2"
	end
end

return M