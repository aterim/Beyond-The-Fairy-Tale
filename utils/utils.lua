local config = require "main.config.config"

local M = {}

--M.selected_node = nil

function M.hashToString(hashValue)
	local str = tostring(hashValue)

	return string.sub(str, 8, #str-1)
end

function M.positionFromTileID(ID, wMap, hMap, tWidth, tOffsetY, cameraRatio)
	local yy = math.floor(ID / wMap)
	local xx = math.floor(ID - hMap * yy)
	
	local offsetX = 0
	if yy % 2 ~= 0 then 
		offsetX = tWidth * 0.5
	end
	
	cameraRatio = cameraRatio or 1
	
	return vmath.vector3(xx * tWidth - offsetX, -yy * tOffsetY / cameraRatio, 0)
end

function M.positionXFromTileID(ID, wMap, hMap)
	local yy = math.floor(ID / wMap)
	local xx = math.floor(ID - hMap * yy)
	
	local offsetX = 0
	if yy % 2 ~= 0 then 
		offsetX = config.tileWidth * 0.5
	end
	
	cameraRatio = cameraRatio or 1
	
	return xx * config.tileWidth - offsetX
end

-- for ui

function M.re_position(node, scale_node)

	if scale_node == nil then
		scale_node = true
	end

	local pos = gui.get_position(node)

	local w_ratio = (config.defaultWidth / config.width)
	local h_ratio = (config.defaultHeight / config.height)

	if w_ratio > h_ratio then
		local new_h = config.width * h_ratio --(config.defaultHeight / w_ratio) * w_ratio
		
		print("###", new_h, config.height)
		
		--local coeff = (pos.y - config.defaultHeight * 0.5) / config.defaultHeight		
		--pos.y = pos.y + (new_h - config.defaultHeight) * 0.5 * coeff
		
		--if pos.y == 94 then
			-- pos.y = (pos.y / config.defaultHeight) * config.height * (w_ratio + h_ratio) * 0.5
			local offset = config.height * (w_ratio + h_ratio) * 0.5 - config.defaultHeight
			
			pos.y = (pos.y ~= 0) and (pos.y + offset * ( (pos.y > config.defaultHeight*0.5) and 1 or -1 )) or 0
			--pos.y = 44
			print(pos.y, config.height * (w_ratio + h_ratio) * 0.5) 
		--end
	else
		local new_w = (config.defaultWidth / config.ratio) * h_ratio
		--local coeff = pos.x > config.defaultWidth * 0.5 and 1 or -1
		--if pos.x == config.defaultWidth * 0.5 then coeff = 0 end
		
		local coeff = (pos.x - config.defaultWidth * 0.5) / config.defaultWidth
		
		--local coeff = pos.x / config.defaultWidth
		
		pos.x = pos.x + (new_w - config.defaultWidth) * 0.5 * coeff
	end
	
	
	gui.set_position(node, pos)
	
	if scale_node == true then
	
		if w_ratio < h_ratio then
			--local max_scale = (w_ratio > h_tatio) and w_ratio or h_ratio
			local scale_def = gui.get_scale(node).z
			local scale = (1/w_ratio * config.ratio + (config.isMobile and 0.1 or 0.0)) * scale_def
			
			scale = scale_def * config.ratio_max / config.ratio
			gui.set_scale(node, vmath.vector3(scale, scale, scale))
		else
			local scale_def = gui.get_scale(node).z
			local scale = (1/w_ratio * config.ratio + (config.isMobile and 0.1 or 0.0)) * scale_def
			
			gui.set_scale(node, vmath.vector3(scale, scale, scale))
		end
	end
end

	local function custom_pick_node(node, x, y, width, height)
		
		width = width or 0
		height = height or 0
		local wh = gui.get_size(node)
	
		if wh.x == 0 or wh.y == 0 then
			
			local parent = gui.get_parent(node)
			local pos = gui.get_position(node)
			
			width = width * 0.5
			height = height * 0.5
			
			while parent ~= nil do
				local prntxy = gui.get_position(parent)
				pos.x = pos.x + prntxy.x
				pos.y = pos.y + prntxy.y
				parent = gui.get_parent(parent)
			end
			
			if pos.x + width < x then return false end
			if pos.x - width > x then return false end
			if pos.y + height < y then return false end
			if pos.y - height > y then return false end
			
			return true
			
		else
			return gui.pick_node(node, x, y) 
		end
		
		return false
	end

function M.button_reaction(self, node, action, up_fnc, down_fnc, selected_node, parameters)
	
	if action.pressed == false and action.released ~= true then
		return false
	end
		
	local scale = 1
	if parameters then
		scale = parameters.scale or 1
		--width = parameters.width or 0
		--height = parameters.height or 0
	end

	if gui.pick_node(node, action.x, action.y) then
	--if custom_pick_node(node, action.x, action.y, width, height) then
		if action.pressed then

			--[[
			if M.selected_node ~= nil then
				gui.set_scale(M.selected_node, vmath.vector3(scale, scale, scale))
			end
			--]]

			gui.set_scale(node, vmath.vector3(0.92 * scale, 0.92 * scale, scale))
			selected_node[1] = node
			if down_fnc ~= nil then
				down_fnc(self, node, parameters)
			end
			
		end

		if action.released then
		
			if selected_node[1] ~= 0 then
				gui.set_scale(selected_node[1], vmath.vector3(scale, scale, scale))
			end
	
			gui.set_scale(node, vmath.vector3(scale, scale, scale))
			
			if up_fnc ~= nil and selected_node[1] ~= 0 then
				--parameters.hit = true
				up_fnc(self, node, parameters)
			end
			
			selected_node[1] = 0
		end
		
		return true
	else
			if selected_node[1] == 0 then
				return false
			end
			
			if selected_node[1] == node then
				gui.set_scale(node, vmath.vector3(scale, scale, scale))
				--if up_fnc ~= nil then up_fnc(self, node, parameters) end
				selected_node[1] = 0
			end
			
	end

	return false
end


return M