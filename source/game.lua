-- local testPlayer

function gameInit()
	testPlayer = playerInit()
end

function gameUpdate(dt)
	if keyDown("left") then
		playerMoveLeft(testPlayer,dt)
	end
	if keyDown("right") then
		playerMoveRight(testPlayer,dt)
	end
	if keyDown("up") then
		playerJump(testPlayer)
	end
	playerUpdate(testPlayer,dt)
end