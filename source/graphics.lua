function graphicsDraw()
	-- love.graphics.draw(player.image, player.x, player.y)
	love.graphics.translate(0,-200)


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

	-- on the origin position. just trust me.
end