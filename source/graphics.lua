function graphicsDraw()



	love.graphics.setColor(255,255,255)
	love.graphics.translate(-camera.x/6,-camera.y/6)
	love.graphics.draw(background.back,-500,-100,0,3,3)

	love.graphics.origin()
	love.graphics.translate(-camera.x/3,-camera.y/3)
	love.graphics.draw(background.medium,-300,-100,0,3,3)

	love.graphics.origin()
	love.graphics.translate(-camera.x,-camera.y)

	-- local shapecount = 0
	-- for shape in collider:activeShapes() do
	--     shapecount = shapecount + 1
	-- end

	love.graphics.setColor(0,0,0)
	local tempground = 0
	if players[1].onGround then
		tempground = 1
	end

	local tempground2 = 0
	if players[2].onGround then
		tempground2 = 1
	end
	love.graphics.print(#cronjobs .. "   " .. tempground2 .. "   " .. players[1].xVel .. "   " .. players[1].yVel .. "   " .. #collider._active_shapes, 100,300)







	for i = 1, #blocks do
		love.graphics.setColor(255,255,255)
		blocks[i].collision:draw("fill")
		love.graphics.setColor(0,255,0)
		blocks[i].topcollision:draw("fill")
	end



	for i = 1, #players do
		love.graphics.setColor(255,255,255)
		players[i].collision:draw("fill")
		love.graphics.setColor(0,0,255)
		players[i].bottomCollision:draw("fill")
		love.graphics.setColor(255,0,0)
		players[i].hitbox:draw("fill")
	end

	for i = 1, #bullets do
		love.graphics.setColor(255,100,0)
		bullets[i].hitbox:draw("fill")
	end



	-- on the origin position. just trust me.
end

function graphicsInit()
	love.window.setMode(1080,720)
	love.graphics.setDefaultFilter("nearest","nearest")
	winW, winH = love.graphics.getWidth(), love.graphics.getHeight()
end