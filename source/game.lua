-- local testPlayer

function gameInit()
	local testPlayer = playerInit()
	players[1] = testPlayer;

	local testPlayer2 = playerInit()
	players[2] = testPlayer2;
end

function gameUpdate(dt)
	if keyDown("left") and keyDown("debug") then
		playerMoveLeft(players[2],dt)
	elseif keyDown("left") then
		playerMoveLeft(players[1],dt)
	end

	if keyDown("right") and keyDown("debug") then
		playerMoveRight(players[2],dt)
	elseif keyDown("right") then
		playerMoveRight(players[1],dt)
	end

	if keyPressed("up") and keyDown("debug") then
		playerJump(players[2])
	elseif keyPressed("up") then
		playerJump(players[1])
	end

	if keyPressed("fastattack") then
		if keyDown("right") then
			playerCast(players[1],1)
		elseif keyDown("left") then
			playerCast(players[1],2)
		elseif keyDown("up") then
			playerCast(players[1],3)
		elseif keyDown("down") then
			playerCast(players[1],4)
		else
			playerCast(players[1],5)
		end
	end


	if keyDown("focus") then
		players[1].focus = true
	else
		players[1].focus = false
	end

	for i = 1, #players do
		playerUpdate(players[i],dt)
	end
	for i = 1, #bullets do
		bulletUpdate(bullets[i],dt)
	end
end