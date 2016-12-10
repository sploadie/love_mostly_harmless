Game = require('game')
Animation = require('lib.Animation')
Button = require('lib.Button')
StartMenu = require('menu.menu')
UI = require("ui.ui")

function love.load()
		love.window.setMode(1280, 720, {msaa = 0})
		love.graphics.setBackgroundColor(255, 255, 255)
		Game.state = 'StartMenu'
		mainStart()
end

function mainStart()
	if Game.state == 'StartMenu' then
		StartMenu:start()
	elseif Game.state == 'Playing' then
		UI:start()
	end
end

function love.update(delta)
	if Game.state == 'StartMenu' then
		StartMenu:button_check()
	elseif Game.state == 'Playing' then
		UI:update(delta)
	end
end

function love.mousepressed(x, y, button)
	if Game.state == 'StartMenu' then
		StartMenu:button_click(x, y, button)
	elseif Game.state == 'Playing' then
		UI:mousepressed(x, y, button)
	end
end

function love.draw()
	if Game.state == 'StartMenu' then
		StartMenu:button_draw()
	elseif Game.state == 'Playing' then
		UI:draw()
	end
end
