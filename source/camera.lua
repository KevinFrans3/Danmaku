function cameraInit()
	camera = {
		x = 0,
		y = 0,
		scale = 1,
		speed = 5
	}
end

function cameraUpdate(dt)

	local middleX = 0;
	local middleY = 0;
	for i = 1,#players do
		middleX = middleX + players[i].x
		middleY = middleY + players[i].y
	end
	middleX = middleX / #players
	middleY = middleY / #players

	camera.x = camera.x - (camera.x - (middleX - winW / 2)) * dt * camera.speed
	camera.y = camera.y - (camera.y - (middleY - winH / 2)) * dt * camera.speed
end