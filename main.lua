Animation = require('lib.Animation')

idleAnimation = {
   name = 'dragon',
   num = 9,
   delay = 0.2
}

function love.load()
   monster = Animation:new{
      name = 'dragon',
      num = 9,
      delay = 0.1,
      effect = 'pingpong',
      after = idleAnimation
   }
end

function love.update(dt)
   monster:update(dt)
   -- print('Delay: '..monster.delay)
end

function love.draw()
   monster:draw(50, 50)
end
