local ui = {}
ui.food = {}
local clock = require ("ui.clock")
local agre = require ("ui.agre")
local health = require ("ui.health")
function ui:start()
	i = 0
	clock.start()
	background = love.graphics.newImage("ui/backgroundlow.png")
	dialogBox = love.graphics.newImage("data/static/dialogue.png")
	uiImage = love.graphics.newImage("ui/UI.png")
	ret = 0
	balle = Button:new('data/animations/ball/baballe.png', function() end, 950, 450, 0, 0.1, 0.1)
	self:foodStart()
   	monster = Animation:new{ name = 'fluffy_amuse', num = 6, delay = 0.05, effect = 'pingpong' }

end

function ui:foodStart()
	ui.food.bonbon = Button:new('ui/food/food_candy.png', function()
		Game:addEffect(30, -0.4)
		Game:addEffect(nil, 0.2, nil, 30)
		Game:addDmgMult(0.3)
	end, 25, 25, 0, 0.3, 0.3)
	ui.food.choco = Button:new('ui/food/food_choco.png', function()
		Game:addDmgMult(0.2)
	end, 25, 125, 0, 0.3, 0.3)
	ui.food.carotte = Button:new('ui/food/food_carot.png', function()
		Game:addEffect(30, 0.4)
		Game:addEffect(nil, -0.2, nil, 30)
		Game:addDmgMult(0.1)
	end, 25, 225, 0, 0.3, 0.3)
end

function ui:update(delta)
	Game:updateAggro(delta)
	clock.update(delta)
	monster:update(delta)
end

function ui:mousepressed(x, y, button)
	Button:mousepressedAll(button, x, y)
end

function ui:draw()
	love.graphics.setColor(255, 255, 255)
	love.graphics.draw(background,0,0,0)
	-- love.graphics.setColor(255, 222, 117, 200)
	-- love.graphics.rectangle("fill", 200, 525, 900, 115)
	love.graphics.setColor(255, 255, 255)
	love.graphics.draw(dialogBox,150,530,0)
	clock.draw(20 ,0)
	agre.draw()
	health.draw()
	-- Monster
	monster:draw(600, 310, 0, 0.2, 0.2)
	-- Buttons
	Button:drawAll()
end

return ui
