local health = {}

function health.draw()
	local min = 1
	local max = 220
	local complete = false
	healthstruct = love.graphics.newImage("data/static/jauge_life_structure.png")
 	love.graphics.setColor(223, 32, 0)
	if (Game.health) < min then Game.health = min end
	if (Game.health) > max then Game.health = max end
	love.graphics.rectangle("fill", 1006, 23, Game.health, 20)
	love.graphics.setColor(255, 255, 255)
	love.graphics.draw(healthstruct, 950, 5, nil, 0.373, 0.373)
end

return health
