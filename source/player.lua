function playerInit()
	local player = { -- nice and organised.
		x = 0,
		y = 600,
		speed = 400,
		yVel = 0,
		jump = -700,
		jumpsleft = 2,
		image = love.graphics.newImage("images/hamster.png"), -- let's just re-use this sprite.
		collision = collider:addRectangle(0,0,32,32),
	}
	return player;
end

function playerMoveLeft(player,dt)
	player.x = player.x - player.speed*dt
end

function playerMoveRight(player,dt)
	player.x = player.x + player.speed*dt
end

function playerJump(player)
	if player.jumpsleft > 0 then
		print(player.jumpsleft .. player.yVel)
		if player.yVel >= 0 then
			player.jumpsleft = player.jumpsleft - 1
			player.yVel = player.jump
		end
	end
end

function playerUpdate(player,dt)
	--processing any jumps
	if player.yVel ~= 0 then -- we're probably jumping
		player.y = player.y + player.yVel * dt -- dt means we wont move at
		player.yVel = player.yVel + gravity * dt
		if player.y > height then -- we hit the ground again
			player.yVel = 0
			player.y = height
		end
	else
		player.jumpsleft = 2
	end

	player.collision:moveTo(player.x,player.y)
end