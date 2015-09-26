-- local testPlayer

function gameInit()
	local testPlayer = playerInit()
	players[1] = testPlayer;
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

	for i = 1, #players do
		playerUpdate(testPlayer,dt)
	end
end