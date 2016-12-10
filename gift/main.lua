function love.load()
   gift = {
      image = love.graphics.newImage('gift.png'),
      x = 50,
      y = 50,
      drag = {
         on = false,
         startx = 0,
         starty = 0
      }
   }
end

function love.mousepressed(mx, my, button)
   if button == 'l'
   and mx >= gift.x and mx < gift.x + gift.image:getWidth()
   and my >= gift.y and my < gift.y + gift.image:getHeight() then
      gift.drag.on = true
      gift.drag.startx = mx
      gift.drag.starty = my
   end
   print("Mouse pressed: "..button.." "..mx.."/"..my)
   print("Gift dragged: "..tostring(gift.drag.on))
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
