local Animation = {}

function Animation:new(args)
	obj = {}
	setmetatable(obj, self)
    self.__index = self
    obj:load(args)
	return obj
end

function Animation:load(args)
	if not args.num or not args.name then error('invalid animation') end
	self.time  = 0
	self.index = 1
	self.name  = args.name
	self.num   = args.num
	self.delay = args.delay or 0.5
	self.after = args.after
	self:setFrames(args.path or 'data/animations/'..args.name, args.ext or 'png', args.effect)
end

function Animation:setFrames(path, ext, effect)
	self.frames = {}
	local prefix = path..'/'..self.name..'_'
	for i = 1, self.num do
		local fullpath = prefix..string.format('%02d', i)..'.'..ext
		print('Fullpath created: '..fullpath)
		table.insert(self.frames, love.graphics.newImage(fullpath))
	end
	if effect and effect == 'pingpong' then
		for i = self.num - 1, 2, -1 do
			local fullpath = prefix..string.format('%02d', i)..'.'..ext
			print('Fullpath created: '..fullpath)
			table.insert(self.frames, love.graphics.newImage(fullpath))
		end
		self.num = (self.num - 1) * 2
	end
end

function Animation:update(dt)
	self.time = self.time + dt
	self.index = 1 + math.floor(self.time / self.delay)
	if self.index > self.num then
		if not self.after then
			self.time = 0
			self.index = 1
		elseif type(self.after) == 'function' then
			return self:after()
		elseif type(self.after) == 'table' then
			return self:load(self.after)
		elseif self.after == 'kill' then
			return self:kill()
		end
	end
	return true
end

function Animation:draw(x, y, r, sx, sy, ox, oy, kx, ky)
	love.graphics.setColor(255, 255, 255)
	love.graphics.draw(self.frames[self.index], x, y, r, sx, sy, ox, oy, kx, ky)
end

function Animation:kill()
	self.update = function() end
	self.draw = function() end
	self = nil
end

return Animation
