	-- right
	-- left
	-- up
	-- down
	-- none
function militaryCast(player,movenumber)
	player.canmove = false
	local casttime
	if movenumber == 1 then
		player.xVel = 2000
		player.xFriction = 8000
		for i = 1, 20 do
			local bullet = bulletInit()
			bullet.x = player.x
			bullet.y = player.y
			bulletSetSpeed(bullet,100 + love.math.random()*100)
			bullet.acceleration = love.math.random()*100
			bulletSetAngle(bullet,love.math.random()*30 - 15 + 180)
			table.insert(bullets,bullet)
		end
		casttime = cron.after(0.1, function()
			player.canmove = true
			removeCron(casttime)
		end)
	elseif movenumber == 2 then
		player.xVel = -2000
		player.xFriction = 8000
		for i = 1, 20 do
			local bullet = bulletInit()
			bullet.x = player.x
			bullet.y = player.y
			bulletSetSpeed(bullet,100 + love.math.random()*100)
			bullet.acceleration = love.math.random()*100
			bulletSetAngle(bullet,love.math.random()*30 - 15)
			table.insert(bullets,bullet)
		end
		casttime = cron.after(0.1, function()
			player.canmove = true
			removeCron(casttime)
		end)
	elseif movenumber == 3 then
		player.yVel = -1100
			local bullet = bulletInit()
			bullet.x = player.x
			bullet.y = player.y
			collider:remove(bullet.hitbox)
			bullet.hitbox = collider:addCircle(0,0,30)
			bullet.hitbox.parent = bullet
			bulletSetSpeed(bullet,500)
			bullet.acceleration = love.math.random()*100
			bullet.id = "nuke"
			bulletSetAngle(bullet,90)
			table.insert(bullets,bullet)
		casttime = cron.after(0.1, function()
			player.canmove = true
			removeCron(casttime)
		end)
	elseif movenumber == 4 then
		player.canmove = true
	elseif movenumber == 5 then
		casttime = cron.after(0.3, function()
			player.canmove = true
			for i = 1, 5 do
				local bullet = bulletInit()
				bullet.x = player.x + 32
				bullet.y = player.y
				bulletSetSpeed(bullet,300)
				bulletSetAngle(bullet,i*10 - 25)
				if player.direction == 0 then
					bulletSetAngle(bullet,i*10 - 25 + 180)
					bullet.x = player.x - 32
				end
				table.insert(bullets,bullet)
			end
			removeCron(casttime)
		end)
	elseif movenumber == 6 then
		player.currentspell = 10
		casttime = cron.every(0.05, function()
			local bullet = bulletInit()
			bullet.x = player.x
			bullet.y = player.y
			local randval = love.math.random()
			if player.militaryBarrage % 11 == 0 then
				bullet.hitbox:scale(4)
				bulletSetSpeed(bullet,200 + r()*100)
				bullet.y = player.y - 10
			elseif player.militaryBarrage % 5 == 0 then
				bullet.hitbox:scale(2)
				bulletSetSpeed(bullet,300 + r()*100)
				bullet.y = player.y + 20
			elseif player.militaryBarrage % 3 == 0 then
				bullet.hitbox:scale(1)
				bulletSetSpeed(bullet,200 + r()*100)
				bullet.y = player.y + 10
			else
				bullet.hitbox:scale(1)
				bulletSetSpeed(bullet,100 + r()*100)
				bullet.y = player.y + 10
			end
			bullet.y = bullet.y - (player.militaryBarrage % 20)*7
			player.militaryBarrage = player.militaryBarrage + 1
			bulletSetAngle(bullet,player.direction * 180 +180)
			table.insert(bullets,bullet)
		end)
		player.casting = casttime
	elseif movenumber == 10 then
		player.currentspell = 10
		casttime = cron.every(0.1, function()
			local bullet = bulletInit()
			bullet.x = player.x + love.math.random()*16 - 8
			bullet.y = player.y + love.math.random()*16 - 8
			bulletSetSpeed(bullet,300+ love.math.random()*10)
			bulletSetAngle(bullet,player.militaryAim)
			table.insert(bullets,bullet)
		end)
		player.casting = casttime
	end
	table.insert(cronjobs,casttime)
end

function militaryCastingUpdate(player,dt,keys)
	if player.currentspell == 10 then
		if player.militaryAim > 360 then
			player.militaryAim = player.militaryAim - 360
		end
		if player.militaryAim < 0 then
			player.militaryAim = player.militaryAim + 360
		end
		if keys.right then
			if player.militaryAim < 170 then
				player.militaryAim = player.militaryAim - 200*dt
			else
				player.militaryAim = player.militaryAim + 200*dt
			end
		end
		if keys.left then
			if player.militaryAim <= 180 and player.militaryAim > 2 then
				player.militaryAim = player.militaryAim + 200*dt
			else
				player.militaryAim = player.militaryAim - 200*dt
			end
		end
		if keys.up then
			if player.militaryAim < 90 or player.militaryAim > 270 then
				player.militaryAim = player.militaryAim - 200*dt
			else
				player.militaryAim = player.militaryAim + 200*dt
			end
		end
		if keys.down then
			if player.militaryAim > 90 and player.militaryAim < 270 then
				player.militaryAim = player.militaryAim - 200*dt
			else
				player.militaryAim = player.militaryAim + 200*dt
			end
		end
	end

	if not keys.slowattack then
		if player.currentspell > 5 then
			removeCron(player.casting)
			player.currentspell = 0
			player.canmove = true
		end
	end
end