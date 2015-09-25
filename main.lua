HC = require "HardonCollider"
KeyMap = require "modules.keymap"

keymapSource = require "source.KeyMapHandle"
globalvars = require "source.globalvars"
game = require "source.game"
graphics = require "source.graphics"
playerSource = require "source.player"
collision = require "source.collision"



function love.load()
	collisionInit()
	gameInit()
	keyInit()
end

function love.update(dt)
	keyUpdate(dt)
	collider:update(dt)
	gameUpdate(dt)
end

function love.draw()
	graphicsDraw()
end


