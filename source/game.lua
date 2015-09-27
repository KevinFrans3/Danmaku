-- local testPlayer

function gameInit()
	local testPlayer = playerInit()
	players[1] = testPlayer;

	local testPlayer2 = playerInit()
	players[2] = testPlayer2;
end

function gameUpdate(dt)
	if keyDown("left") then
		playerMoveLeft(players[1],dt)
	end
	if keyDown("right") then
		playerMoveRight(players[1],dt)
	end
	if keyPressed("up") then
		playerJump(players[1])
	end
	if keyDown("focus") then
		players[1].focus = true
	else
		players[1].focus = false
	end

	for i = 1, #players do
		playerUpdate(players[i],dt)
	end
end