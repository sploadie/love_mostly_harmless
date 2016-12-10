clock = require ("clock")

function love.load()
  clock.start()
end

function love.update(dt)
    if pause then
    -- menu
    return
  end
  clock.update()
end

function love.draw()
  clock.draw()
end