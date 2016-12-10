gift = {}

function love.load()
   gift.x = 50
   gift.y = 50
   gift.drag = {}
   gift.drag.on = false
   gift.drag.startx = 0
   gift.drag.starty = 0
   gift.image = love.graphics.newImage('gift.png')
end

function love.mousepressed(mx, my, button)
   if button == 'l'
   and mx >= gift.x and mx < gift.x + gift.image:getWidth()
   and my >= gift.y and my < gift.y + gift.image:getHeight() then
      gift.drag.on = true
      gift.drag.startx = mx
      gift.drag.starty = my
   end
   print(gift.drag.on)
   print(button)
   print(mx)
   print(my)
end

function love.mousereleased(mx, my, button)
   if button == 'l' then
      gift.drag.on = false
   end
end

function love.update(dt)
   if gift.drag.on then
      local mx, my = love.mouse.getPosition()
      gift.x = gift.x + mx - gift.drag.startx
      gift.y = gift.y + my - gift.drag.starty
      gift.drag.startx = mx
      gift.drag.starty = my
   end
end

function love.draw()
   love.graphics.draw(gift.image, gift.x, gift.y)
end
