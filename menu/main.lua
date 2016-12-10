require "menu"

gift = {}

function love.load()
	medium = love.graphics.newFont(45)
	gamestate = "start_menu"

	love.graphics.setBackgroundColor(255, 255, 255)

	button_spawn(love.graphics.getWidth() / 2 - 135, love.graphics.getHeight() / 2 + 25, "Start Game", "start")
	button_spawn(love.graphics.getWidth() / 2 - 150, love.graphics.getHeight() / 2 + 85, "Leave Game", "quit")
end

function love.update(dt)
	mouse_x = love.mouse.getX()
	mouse_y = love.mouse.getY()
	if gamestate == "playing" then

	elseif gamestate == "start_menu" then
		button_check()
	end
end

function love.draw()
	if gamestate == "playing" then
		if key == 'escape' then
			gamestate = "pause"
	elseif gamestate == "start_menu" then
		button_draw()
	end
end

function love.mousepressed(x, y)
	if gamestate == "start_menu" then
		button_click(x, y)
	end
end
