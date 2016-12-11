local agre = {}

function agre.draw()
	local min = 1
	local max = 220
	local complete = false
	aggrostruct = love.graphics.newImage("data/static/jauge_anger_structure.png")
	anger_warning = love.graphics.newImage("data/static/jauge_anger_warning.png")
	love.graphics.setColor(255, 165, 0)
	if (min + Game.aggro) > 0 and (min + Game.aggro) < 220 then
		love.graphics.rectangle("fill", 635, 23, min + Game.aggro, 20)
	elseif (min + Game.aggro) >= 220 then
		love.graphics.rectangle("fill", 635, 23, 220, 20)
	end
	love.graphics.setColor(255, 255, 255)
	if (min + Game.aggro) > 0 and (min + Game.aggro) < 220 then
		love.graphics.draw(aggrostruct, 623, 5, nil, 0.373, 0.373)
	elseif (min + Game.aggro) >= 220 then
		love.graphics.draw(aggrostruct, 623, 5, nil, 0.373, 0.373)
		love.graphics.draw(anger_warning, 853, 5, nil, 0.373, 0.373)
	end
end

return agre
