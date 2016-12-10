StartMenu = require "menu"

gift = {}

function love.load()
	-- medium = love.graphics.newFont(45)
	gamestate = "start_menu"

	love.graphics.setBackgroundColor(255, 255, 255)
	StartMenu:button_spawn(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2 - 70, "Start Game", "start")
	StartMenu:button_spawn(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, "Leave Game", "quit")
end

function love.update(dt)
	mouse_x = love.mouse.getX()
	mouse_y = love.mouse.getY()
	if gamestate == "playing" then

	elseif gamestate == "start_menu" then
		StartMenu:button_check()
	end
end

function love.draw()
	if gamestate == "playing" then

	elseif gamestate == "start_menu" then
		StartMenu:button_draw()
	end
end

function love.mousepressed(x, y)
	if gamestate == "start_menu" then
		StartMenu:button_click(x, y)
	end
end
