function basicInit()
	local block = {
		collision = collider:addRectangle(100,500,300,50),
		topcollision = collider:addRectangle(100,500,300,3)
	}
	blocks[1] = block

	background = {
		back = love.graphics.newImage("images/japanBack.png"),
		medium = love.graphics.newImage("images/japanMedium.png"),
		front = love.graphics.newImage("images/japanFront.png")
	}
end