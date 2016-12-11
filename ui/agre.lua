local agre = {}

function agre.draw()
	local min = 1
	local max = 220
	local complete = false
	love.graphics.setColor(0, 0, 0)
  	love.graphics.rectangle("fill", 565, 23, 220, 32)
 	love.graphics.setColor(255, 165, 0)
	if (min + Game.aggro) > 0 and (min + Game.aggro) < 220 then
		love.graphics.rectangle("fill", 565, 23, min + Game.aggro, 32)
	elseif (min + Game.aggro) >= 220 then
		love.graphics.rectangle("fill", 565, 23, 220, 32)
	end
end

return agre
