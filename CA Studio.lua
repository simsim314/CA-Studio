-- Signal which codes X
-- Goo convert signal into strucures. Goo form is block. 
-- Reflector & Duplicator. 
-- Converter from signal X -> signal Y
-- Drier, convert signal -> static object -> signal 
-- Create object and call them new object. 
-- Library of objects. 
-- CA studio: create new object 

local g = golly()
g.setrule("LifeHistory")
local SignalEntity = {}

function SignalEntity:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	self.x = 0 
	self.y = 0
	self.meta_function = ""
	self.dx = 1
	self.dy = 0
	self.w = 2
	self.h = 1 
	return o
end

function SignalEntity:evolve()
	self.x = self.x + self.dx
	self.y = self.y + self.dy
end 

local Signal = {signal_list = {}}

function Signal:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	self.signal_meta = ""
	self.signals = {}
	for i=1,10 do 
		r = SignalEntity:new(nil)
		r.x = -i * 5 + 5
		r.meta_function = i .. ":BaseSignal"
		self.signals[i] = r
	end

	return o
end

function Signal:apply(func)
	for _, sig in ipairs(self.signals) do
		func(sig)
	end
end 

function Signal:evolve()
	self:apply(SignalEntity.evolve)
end 
-- Has list of objects 
-- Each object can be evolved 
-- Each object has bounding box 
-- When boxes collide there are rules 
-- Any dynamic object can collide any object 
-- If the collision is by the rules there is an action applied to the object in the collision 

local CAStudio = {}

function CAStudio:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	self.object_list = {}
	return o
end 

function CAStudio:add(obj)
	table.insert(self.object_list, obj)
end 

function CAStudio:evolve()
	for _, obj in ipairs(self.object_list) do
		obj:evolve()
	end 
end 

function CAStudio:apply(func)
	for _, sig in ipairs(self.signals) do
		func(sig)
	end
end 

function Signal:draw()
	self:apply(SignalEntity.draw)
end 

function CAStudio:draw()
	for _, obj in ipairs(self.object_list) do
		obj:draw()
	end 
end 

----------------Visualization part-----------------


function SignalEntity:draw()
	g.setcell(self.x, self.y, 1)
	g.setcell(self.x + self.dx, self.y + self.dy, 5)
end 


x = Signal:new()
CAs = CAStudio:new()
CAs:add(x)

while true do
	CAs:draw()
	g.update()
	CAs:evolve()
	g.select(g.getrect())
	g.clear(0)
	g.select({})
end
