gravity = 2000
winW, winH = love.graphics.getWidth(), love.graphics.getHeight()
height = 600;
blocks = {};
players = {};
bullets = {};
background = {};
camera = {};
cronjobs = {};


--DECLARED IN OTHER PLACES:
	--testPlayer

function removeCron(cron)
	for i = 1, #cronjobs do
		if cronjobs[i] == cron then
			table.remove(cronjobs,i)
			break
		end
	end
end

function r()
	return love.math.random()
end