ui = require ("ui")

function love.load()
  love.window.setMode(1280, 720)
  ui.start()
end

function love.update(dt)
	ui.update(dt)
end

function love.draw()
	ui.draw()
end
