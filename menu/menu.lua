Menu = {}
Menu.buttons = {}
Menu.font = love.graphics.newFont(45)

function Menu:button_spawn(x, y, text, id, font)
	local font = font or self.font
	local x = x - font:getWidth(text)/2
	table.insert(self.buttons, {x = x, y = y, text = text, id = id, font = font, mouse_over = false})
end

function Menu:button_draw()
	for i,v in ipairs(self.buttons) do
		local font = v.font or self.font
		love.graphics.setFont(font)
		if v.mouse_over == false then
			love.graphics.setColor(0, 0, 0)
		else
			love.graphics.setColor(198, 0, 0)
		end
		love.graphics.print(v.text, v.x, v.y)
	end
end

function Menu:button_click(x, y)
	for i,v in ipairs(self.buttons) do
		local font = v.font or self.font
		love.graphics.setFont(font)
		if x > v.x and
		x < v.x + font:getWidth(v.text) and
		y > v.y and
		y < v.y + font:getHeight(v.text) then
			if v.id == "quit" then
				love.event.push("quit")
			elseif v.id == "start" then
				gamestate = "playing"
			end
		end
	end
end

function Menu:button_check()
	for i,v in ipairs(self.buttons) do
		local font = v.font or self.font
		love.graphics.setFont(font)
		if mouse_x > v.x and
		mouse_x < v.x + font:getWidth(v.text) and
		mouse_y > v.y and
		mouse_y < v.y + font:getHeight(v.text) then
			v.mouse_over = true
		else
			v.mouse_over = false
		end
	end
end

return Menu
