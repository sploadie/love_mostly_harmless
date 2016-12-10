button = {}

function button_spawn(x, y, text, id)
	table.insert(button, {x = x, y= y, text = text, id = id, mouse_over = false})
end

function button_draw()
	for i,v in ipairs(button) do
		if v.mouse_over == false then
			love.graphics.setColor(0, 0, 0)
		else
			love.graphics.setColor(198, 0, 0)
		end
		love.graphics.setFont(medium)
		love.graphics.print(v.text, v.x, v.y)
	end
end

function button_click(x, y)
	for i,v in ipairs(button) do
		if x > v.x and
		x < v.x + medium:getWidth(v.text) and
		y > v.y and
		y < v.y + medium:getHeight(v.text) then
			if v.id == "quit" then
				love.event.push("quit")
			elseif v.id == "start" then
				gamestate = "playing"
			end
		end
	end
end

function button_check()
	for i,v in ipairs(button) do
		if mouse_x > v.x and
		mouse_x < v.x + medium:getWidth(v.text) and
		mouse_y > v.y and
		mouse_y < v.y + medium:getHeight(v.text) then
			v.mouse_over = true
		else
			v.mouse_over = false
		end
	end
end
