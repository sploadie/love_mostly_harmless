local agre = {}

function agre.draw()
	min = 1
	max = 220
	complete = false
	love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle("fill", 565, 23, 220, 32)
 	love.graphics.setColor(255, 0, 0)
  love.graphics.rectangle("fill", 565, 23, min + Game.aggro, 32)
end

return agre