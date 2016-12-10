local clock = {}
-- clock = {}

function clock.start()
  love.graphics.setBackgroundColor(125, 87, 98)
  clock = love.graphics.newImage("ui/horloge_structure.png")
  arrow = love.graphics.newImage("ui/horloge_grosse_aiguille.png")
  arrowp = love.graphics.newImage("ui/horloge_tit_aiguille.png")
  love.height = love.graphics.getHeight()
  love.width = love.graphics.getWidth()
  h = 0;
  END = 0;
  m = 0;
  r2 = 0;
end

function clock.update(delta)
  m = m + delta
  if m > 60 * h then
    h = h + 1
  end
  return m
end

function clock.draw(x, y)
  local r = h * math.pi / 8
  r2 = (m % 60) * math.pi / 15
  love.graphics.draw(clock, x + 50, y + 65, 0, 0.4 ,0.4)
  love.graphics.draw(arrow, x+ 435, y +160, r, 0.4, 0.4, 73, 10)
  love.graphics.draw(arrowp, x + 435, y + 160, r2 / 2, 0.4, 0.4, 9, 9)
end

return clock