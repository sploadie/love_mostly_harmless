clock = require("clock")

function love.load()
  clock.start()
end

function love.update(dt)
  clock.update()
end

function love.draw()
  clock.draw()
end