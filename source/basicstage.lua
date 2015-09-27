function basicInit()
	local block = {
		collision = collider:addRectangle(100,500,300,50),
		topcollision = collider:addRectangle(100,500,300,3)
	}
	blocks[1] = block
end