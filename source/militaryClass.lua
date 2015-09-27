function militaryCast(player,movenumber)
	if movenumber == 1 then
		player.canmove = false
		local casttime = cron.after(1, function()
			player.canmove = true
			for i = 1, 5 do
				local bullet = bulletInit()
				bullet.x = player.x
				bullet.y = player.y
				bulletSetSpeed(bullet,100)
				bulletSetAngle(bullet,i*10)
				print(bullet.xVel)
				table.insert(bullets,bullet)
			end
		end)
		table.insert(cronjobs,casttime)
	elseif movenumber == 2 then

	elseif movenumber == 3 then

	elseif movenumber == 4 then

	elseif movenumber == 5 then

	end

end