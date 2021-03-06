function on_collide(dt, shape_a, shape_b, mtv_x, mtv_y)

	local playercollision = collisionIsShapeTable(shape_a,shape_b,players,"collision")
	local playerbottomcollision = collisionIsShapeTable(shape_a,shape_b,players,"bottomCollision")
	local blockCollision = collisionIsShapeTable(shape_a,shape_b,blocks,"collision")
	local blockTopCollision = collisionIsShapeTable(shape_a,shape_b,blocks,"topcollision")
	local bulletCollision = collisionIsShapeTable(shape_a,shape_b,bullets,"hitbox")

	if playercollision ~= nil and blockCollision ~= nil then
		-- print(mtv_x)
		playercollision.parent.x = playercollision.parent.x + mtv_x
		if mtv_y < 0 then
			playercollision.parent.y = playercollision.parent.y + mtv_y
		end
	end

	if playerbottomcollision ~= nil then
		if blockTopCollision ~= nil then
			playerbottomcollision.parent.onGround = true
		end
	end

	if bulletCollision ~= nil and blockCollision ~= nil then
		for i = 1, #bullets do
			if bullets[i].hitbox == bulletCollision then
				local bulletx = bullets[i].x
				local bullety = bullets[i].y
				local bulletid = bullets[i].id
				collider:remove(bulletCollision)
				table.remove(bullets,i)
				if bulletid == "nuke" then
					for x = 1, 32 do
						local bullet = bulletInit()
						bullet.x = bulletx
						bullet.y = bullety
						bulletSetSpeed(bullet,100 + love.math.random()*100)
						bullet.acceleration = love.math.random()*100
						bulletSetAngle(bullet,x * (360/32))
						table.insert(bullets,bullet)
					end
				end
				break
			end
		end
	end
end

function collision_stop(dt, shape_a, shape_b)

	local playercollision = collisionIsShapeTable(shape_a,shape_b,players,"collision")
	local playerbottomcollision = collisionIsShapeTable(shape_a,shape_b,players,"bottomCollision")
	local blockCollision = collisionIsShapeTable(shape_a,shape_b,blocks,"collision")
	local blockTopCollision = collisionIsShapeTable(shape_a,shape_b,blocks,"topcollision")

	if playercollision ~= nil and blockCollision ~= nil then
		-- print(mtv_x)
		-- testPlayer.x = testPlayer.x + mtv_x
		-- testPlayer.y = testPlayer.y + mtv_y
	end

	if playerbottomcollision ~= nil and blockTopCollision ~= nil then
		print("leaveground")
		playerbottomcollision.parent.onGround = false
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

-- WANTED IS AN ARRAY
function collisionIsShapeTable(shape_a,shape_b,wanted,key)
	local isWanted
	for i = 1, #wanted do
		if shape_a == wanted[i][key] then
			isWanted = shape_a
		end
		if shape_b == wanted[i][key] then
			isWanted = shape_b
		end
	end
	return isWanted
end

