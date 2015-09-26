function on_collide(dt, shape_a, shape_b, mtv_x, mtv_y)

	local playercollision = collisionIsShape(shape_a,shape_b,testPlayer.collision)
	local playerbottomcollision = collisionIsShape(shape_a,shape_b,testPlayer.bottomCollision)
	local blockCollision = collisionIsShape(shape_a,shape_b,block.collision)

	if playercollision ~= nil and blockCollision ~= nil then
		-- print(mtv_x)
		testPlayer.x = testPlayer.x + mtv_x
		testPlayer.y = testPlayer.y + mtv_y
	end

	if playerbottomcollision ~= nil then
		print("touchground before")
		if blockCollision ~= nil then
			print("touchground")
			testPlayer.onGround = true
		end
	end
end

function collision_stop(dt, shape_a, shape_b)

	local playercollision = collisionIsShape(shape_a,shape_b,testPlayer.collision)
	local playerbottomcollision = collisionIsShape(shape_a,shape_b,testPlayer.bottomCollision)
	local blockCollision = collisionIsShape(shape_a,shape_b,block.collision)

	if playercollision ~= nil and blockCollision ~= nil then
		-- print(mtv_x)
		-- testPlayer.x = testPlayer.x + mtv_x
		-- testPlayer.y = testPlayer.y + mtv_y
	end

	if playerbottomcollision ~= nil and blockCollision ~= nil then
		testPlayer.onGround = false
	end
end

function collisionInit()
	collider = HC(100,on_collide,collision_stop)
end

function collisionIsShape(shape_a,shape_b,wanted)
	local isWanted
	if shape_a == wanted then
		isWanted = shape_a
	end
	if shape_b == wanted then
		isWanted = shape_b
	end
	return isWanted
end

