HC = require "HardonCollider"
KeyMap = require "modules.keymap"

keymapSource = require "source.KeyMapHandle"
globalvars = require "source.globalvars"
game = require "source.game"
graphics = require "source.graphics"
playerSource = require "source.player"
collision = require "source.collision"
basicstage = require "source.basicstage"
bulletSource = require "source.bullet"
cameraSoure = require "source.camera"

militaryClass = require "source.militaryClass"



function love.load()
	graphicsInit()
	collisionInit()
	gameInit()
	keyInit()
	basicInit()
	cameraInit()
end

function love.update(dt)
	collider:update(dt)
	gameUpdate(dt)
	keyUpdate(dt)
	cameraUpdate(dt)
end

function love.draw()
	graphicsDraw()
end


