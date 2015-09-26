HC = require "HardonCollider"
KeyMap = require "modules.keymap"

keymapSource = require "source.KeyMapHandle"
globalvars = require "source.globalvars"
game = require "source.game"
graphics = require "source.graphics"
playerSource = require "source.player"
collision = require "source.collision"
basicstage = require "source.basicstage"



function love.load()
	collisionInit()
	gameInit()
	keyInit()
	basicInit()
end

function love.update(dt)
	collider:update(dt)
	gameUpdate(dt)
	keyUpdate(dt)
end

function love.draw()
	graphicsDraw()
end


