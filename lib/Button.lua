local Button = {}
Button.buttons = {}

function Button:new(image, funct, x, y, r, sx, sy, ox, oy, kx, ky)
	obj = {}
	setmetatable(obj, self)
    self.__index = self
    obj:load(image, funct, x, y, r, sx, sy, ox, oy, kx, ky)
    obj.container = self
    table.insert(self.buttons, obj)
	return obj
end

function Button:load(image, funct, x, y, r, sx, sy, ox, oy, kx, ky)
	if not image or not funct or not x or not y then error('invalid button') end
	if type(funct) ~= 'function' then error('invalid button: onclick is not a function') end
	self.image = love.graphics.newImage(image)
	self.name = image
	self.onclick = funct
	self.data = {
		x  = x,
		y  = y,
		r  = r,
		sx = sx or 1,
		sy = sy or 1,
		ox = ox or 0,
		oy = oy or 0,
		kx = kx,
		ky = ky
	}
end

function Button:mousepressed(mb, mx, my)
	if mb == 'l'
	and mx >= (self.data.x + self.data.ox) and mx < (self.data.x + self.data.ox) + self.image:getWidth() * self.data.sx
	and my >= (self.data.y + self.data.oy) and my < (self.data.y + self.data.oy) + self.image:getHeight() * self.data.sy then
		self.onclick()
		return true
	end
	return false
end

function Button:mousepressedAll(mb, mx, my)
	for i,button in ipairs(self.buttons) do
		if button:mousepressed(mb, mx, my) then
			print("Button clicked: "..button.name.." "..mx.."/"..my)
		end
	end
end

function Button:draw()
	love.graphics.draw(self.image, self.data.x, self.data.y, self.data.r, self.data.sx, self.data.sy, self.data.ox, self.data.oy, self.data.kx, self.data.ky)
end

function Button:drawAll()
	for i,button in ipairs(self.buttons) do
		button:draw()
	end
end

function Button:delete(deadbutton)
	local buttons = self.buttons
	if not deadbutton then
		buttons = self.container.buttons
		deadbutton = self
	end
	deadbutton.mousepressed = function() end
	deadbutton.draw = function() end
	for i,button in ipairs(buttons) do
		if button == deadbutton then
			table.remove(buttons, i)
			return
		end
	end
	error('button to delete not found')
end

return Button
