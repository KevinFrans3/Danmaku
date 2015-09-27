function keyInit()
	KeyMap:addMapping({"up","down","left","right","fire","focus"})
	KeyMap:bind( "up" , {"key", "w", "up"} )
	KeyMap:bind( "up" , {"joy" , "dpup" , "up" } )
	KeyMap:bind( "down" , {"key", "s", "down"} )
	KeyMap:bind( "down" , {"joy" , "dpdown" , "down" } )
	KeyMap:bind( "left" , {"key", "a", "left"} )
	KeyMap:bind( "left" , {"joy" , "dpleft" , "left" } )
	KeyMap:bind( "right" , {"key", "d", "right"} )
	KeyMap:bind( "right" , {"joy" , "dpright" , "right" } )
	KeyMap:bind( "fire" , {"key", "z"} )
	KeyMap:bind( "fire" , {"joy" , "a" } )
	KeyMap:bind( "focus" , {"key", "lshift"} )
	KeyMap:bind( "focus" , {"joy" , "b" } )

end

function keyUpdate(dt)
	KeyMap:update(dt)
end

function keyDown(string)
	return KeyMap:isDown(string)
end

function keyPressed(string)
	return KeyMap:isPushed(string)
end