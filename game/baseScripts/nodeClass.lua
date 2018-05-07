local config = require "main.config.config"
local utils = require "utils.utils"

Node = {}

function Node:new(ID, IDTile, IDParent, wMap, hMap)

	local private = {}
		private.nodes = {}
		private.wMap = wMap
		private.hMap = hMap

	local public = {}
		public.ID = ID
		public.IDTile = IDTile
		public.IDParent = IDParent
		
		public.pos = utils.positionFromTileID(IDTile, wMap, hMap, config.tileWidth, config.tileOffsetY, 1)
		
		public.block = -1    -- если кто-то стоит, в зависимости от типа объекта
		public.blockID = nil -- а если стоит, тут его ид
		public.mark = false  -- для поиска пути
		
		function public:addChild(node)
			table.insert(private.nodes, node)
		end
		
		function public:contains(id)
			for i = 1, #private.nodes do
				if id == private.nodes then
					return true
				end
			end
			
			return true
		end

		function public:numChildren()
			return #private.nodes
		end
		
		function public:copy_nodes()
			local nd = {}
			
			for i = 1, #private.nodes do
				table.insert(nd, private.nodes[i])
			end
			
			return nd
		end
		
		function public:getChildID(ind)
			return private.nodes[ind]
		end
		
		function public:copy()
			local vn = Node:new(public.ID, public.IDTile, public.IDParent, private.wMap, private.hMap)
			
			for i = 1, #private.nodes do
				vn:addChild(private.nodes[i])
			end
			
			vn.block = public.block
			vn.blockID = public.blockID
			vn.mark = public.mark
			
			return vn
		end

	setmetatable(public, self)
	self.__index = self; return public
end