clock = {}

function clock.start()
  love.graphics.setBackgroundColor(125, 87, 98)
  clock = love.graphics.newImage("clock.jpg")
  arrow = love.graphics.newImage("arrow.png")
  love.height = love.graphics.getHeight()
  love.width = love.graphics.getWidth()
  h = 0;
  m = 0;
  r2 = 0;
end

function clock.update(dt)
  m = m + dt
  if m > 60 * h then
    h = h + 1
  end
end

function clock.draw()
  local r = h * math.pi / 8
  r2 = (m % 60) * math.pi / 15
  love.graphics.print("Il est : " .. "00" + math.floor(h) .. " " .. "00" + math.floor(m), 150, 150)
  love.graphics.draw(clock, (love.height / 4), (love.width / 4), 0, 0.5 ,0.5)
  love.graphics.draw(arrow, (love.height / 4) + 125, (love.width / 4) + 125, r, 0.1, 0.1, 0, 240)
  love.graphics.draw(arrow, (love.height / 4) + 125, (love.width / 4) + 125, r2 / 2, 0.1, 0.1, 0, 240)
end