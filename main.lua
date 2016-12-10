Animation = require('lib.Animation')

function love.load()
   love.window.setMode(1280, 720, {msaa = 0})
   monster = Animation:new{ name = 'fluffy_agace', num = 6, delay = 0.05, effect = 'pingpong' }
end

function love.update(dt)
   monster:update(dt)
   -- print('Delay: '..monster.delay)
end

function love.draw()
   monster:draw(50, 50, 0, 0.1, 0.1)
end
