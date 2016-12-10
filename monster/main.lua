Animation = require('lib.Animation')

function love.load()
   love.window.setMode(1280, 720, {msaa = 0})
   monster = Animation:new{ name = 'fluffy_agace', num = 6, delay = 0.05, effect = 'pingpong' }
   monster1 = Animation:new{ name = 'fluffy_amuse', num = 6, delay = 0.05, effect = 'pingpong' }
   monster2 = Animation:new{ name = 'fluffy_caresse', num = 6, delay = 0.05, effect = 'pingpong' }
   monster3 = Animation:new{ name = 'fluffy_content', num = 6, delay = 0.05, effect = 'pingpong' }
   monster4 = Animation:new{ name = 'fluffy_endormi', num = 6, delay = 0.05, effect = 'pingpong' }
   monster5 = Animation:new{ name = 'fluffy_ennui', num = 6, delay = 0.05, effect = 'pingpong' }
   monster6 = Animation:new{ name = 'fluffy_monsterize', num = 9, delay = 0.05, effect = 'pingpong' }
   monster7 = Animation:new{ name = 'fluffy_musique', num = 6, delay = 0.05, effect = 'pingpong' }
   monster8 = Animation:new{ name = 'fluffy_neutre', num = 6, delay = 0.05, effect = 'pingpong' }
   monster9 = Animation:new{ name = 'fluffy_triste', num = 6, delay = 0.05, effect = 'pingpong' }
end

function love.update(dt)
   monster:update(dt)
   monster1:update(dt)
   monster2:update(dt)
   monster3:update(dt)
   monster4:update(dt)
   monster5:update(dt)
   monster6:update(dt)
   monster7:update(dt)
   monster8:update(dt)
   monster9:update(dt)
   -- print('Delay: '..monster.delay)
end

function love.draw()
   monster:draw(50, 50, 0, 0.1, 0.1)
   monster1:draw(150, 50, 0, 0.1, 0.1)
   monster2:draw(250, 50, 0, 0.1, 0.1)
   monster3:draw(350, 50, 0, 0.1, 0.1)
   monster4:draw(450, 50, 0, 0.1, 0.1)
   monster5:draw(550, 50, 0, 0.1, 0.1)
   monster6:draw(650, 50, 0, 0.1, 0.1)
   monster7:draw(750, 50, 0, 0.1, 0.1)
   monster8:draw(850, 50, 0, 0.1, 0.1)
   monster9:draw(950, 50, 0, 0.1, 0.1)
end
