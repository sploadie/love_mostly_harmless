function love.load()
	local img = love.graphics.newImage("food_particle.png")
	pSystem = love.graphics.newParticleSystem(img, 42)
	pSystem:getDirection(6.28)
	pSystem:setParticleLifetime(1,5)
	pSystem:setLinearAcceleration(-20, -20, 20, 20)
	pSystem:setSpeed(100)
	pSystem:setSpin(2, 10, 1)
end

function love.draw()
	love.graphics.draw(pSystem, love.mouse.getX(), love.mouse.getY())
end

function love.mousePressed()
	if love.mouse.isDown("l") then
		pSystem:emit(32)
	end
end

function love.update(dt)
	pSystem:update(dt)
	love.mousePressed()
end
