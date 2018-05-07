

LTimer = {}

function LTimer:new(fps)
	local private = {}
		private.events = {}
		private.time = 0
		private.delta = 1 / (fps or 60)
		
	local public = {}
	
		public.pause = false
	
		function public:get_timeout(dt, cb_func)
			table.insert(private.events, {now = private.time, dt = dt, cb = cb_func})
		end
		
		function public:update()
			public.update_dt(private.delta)
		end
		
		function public:update_dt(dt)
			if public.pause or private.events == nil then
				return
			end
			
			private.time = private.time + dt
			
			local i = 1
			
			while i <= #private.events do
				if private.time - (private.events[i].now + private.events[i].dt) >= 0  then
					if private.events[i].cb then
						private.events[i].cb()
					end
					
					if private.events == nil then
						return
					end
					table.remove(private.events, i)
					
					if #private.events == 0 then
						private.time = 0
					end
				else
					i = i + 1
				end
			end
		end
		
		function public:clear_all()
			while #private.events > 0 do
				table.remove(private.events, 1)
			end
			private.events = nil
		end
	
	setmetatable(public, self)
	self.__index = self
	return public
end