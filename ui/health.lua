local health = {}

function health.draw()
	local min = 1
	local max = 220
	local complete = false
	-- love.graphics.setColor(0, 0, 0)
 --  	love.graphics.rectangle("fill", 565, 23, 220, 32)
 	love.graphics.setColor(223, 32, 0)
	if (Game.health) < min then Game.health = min end
	if (Game.health) > max then Game.health = max end
	love.graphics.rectangle("fill", 840, 23, Game.health, 32)
end

return health
