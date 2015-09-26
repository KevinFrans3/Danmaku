function graphicsDraw()
	-- love.graphics.draw(player.image, player.x, player.y)
	love.graphics.translate(0,-200)

	love.graphics.setColor(255,255,255)
	testPlayer.collision:draw("fill")
	block.collision:draw("fill")

	love.graphics.setColor(0,0,255)
	testPlayer.bottomCollision:draw("fill")

	-- on the origin position. just trust me.
end