function bulletInit()
	local bullet = {
		x = 0,
		y = 0,
		speed = 3,
		xVel = 3,
		yVel = 0,
		angle = 0,
		hitbox = collider:addCircle(0,0,10)
	}
	bullet.hitbox.parent = bullet

	return bullet
end

function bulletUpdate(bullet,dt)
	bullet.x = bullet.x + bullet.xVel*dt
	bullet.y = bullet.y + bullet.yVel*dt

	bullet.hitbox:moveTo(bullet.x,bullet.y)
end

function bulletSetAngle(bullet,angle)
	bullet.angle = angle
	bulletCalculateVelocity(bullet)
end

function bulletSetSpeed(bullet,speed)
	bullet.speed = speed
	bulletCalculateVelocity(bullet)
end

function bulletCalculateVelocity(bullet)
	bullet.xVel = math.cos((math.pi / 180) * bullet.angle) * bullet.speed
	bullet.yVel = math.sin((math.pi / 180) * bullet.angle) * bullet.speed
end