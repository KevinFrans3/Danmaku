-- local testPlayer

function gameInit()
	local testPlayer = playerInit()
	players[1] = testPlayer;

	local testPlayer2 = playerInit()
	players[2] = testPlayer2;
end

function gameUpdate(dt)


	local keys = {
			left = keyDown("left"),
			right = keyDown("right"),
			up = keyDown("up"),
			down = keyDown("down"),
			focus = keyDown("focus"),
			slowattack = keyDown("slowattack"),
			fastattack = keyDown("fastattack"),
			debug = keyDown("debug"),
		}

	if keys.left and keys.debug then
		playerMoveLeft(players[2],dt)
	elseif keys.left then
		playerMoveLeft(players[1],dt)
	end

	if keys.right and keys.debug then
		playerMoveRight(players[2],dt)
	elseif keys.right then
		playerMoveRight(players[1],dt)
	end

	if keyPressed("up") and keys.debug then
		playerJump(players[2])
	elseif keyPressed("up") then
		playerJump(players[1])
	end



	if keyPressed("fastattack") then
		if keys.debug then
			if keys.right then
				playerCast(players[2],1)
			elseif keys.left then
				playerCast(players[2],2)
			elseif keys.up then
				playerCast(players[2],3)
			elseif keys.down then
				playerCast(players[2],4)
			else
				playerCast(players[2],5)
			end
		else
			if keys.right then
				playerCast(players[1],1)
			elseif keys.left then
				playerCast(players[1],2)
			elseif keys.up then
				playerCast(players[1],3)
			elseif keys.down then
				playerCast(players[1],4)
			else
				playerCast(players[1],5)
			end
		end
	end

	if keyPressed("slowattack") then
		if keys.debug then
			if keys.right then
				playerCast(players[2],6)
			elseif keys.left then
				playerCast(players[2],7)
			elseif keys.up then
				playerCast(players[2],8)
			elseif keys.down then
				playerCast(players[2],9)
			else
				playerCast(players[2],10)
			end
		else
			if keys.right then
				playerCast(players[1],6)
			elseif keys.left then
				playerCast(players[1],7)
			elseif keys.up then
				playerCast(players[1],8)
			elseif keys.down then
				playerCast(players[1],9)
			else
				playerCast(players[1],10)
			end
		end
	end

	playerCastingUpdate(players[1],dt,keys)


	if keys.focus then
		players[1].focus = true
		players[2].focus = true
	else
		players[1].focus = false
		players[2].focus = false
	end

	for i = 1, #players do
		playerUpdate(players[i],dt)
	end
	for i = 1, #bullets do
		bulletUpdate(bullets[i],dt)
	end
	for i = 1, #bullets do
		if(bulletOffScreen(bullets[i])) then
			collider:remove(bullets[i].hitbox)
			table.remove(bullets,i)
			break
		end
	end
end