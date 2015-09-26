function keyInit()
	KeyMap:addMapping({"up","down","left","right","fire"})
	KeyMap:bind( "up" , {"key", "w", "up"} )
	KeyMap:bind( "up" , {"joy" , "dpup" , "up" } )
	KeyMap:bind( "down" , {"key", "s", "down"} )
	KeyMap:bind( "down" , {"joy" , "dpdown" , "down" } )
	KeyMap:bind( "left" , {"key", "a", "left"} )
	KeyMap:bind( "left" , {"joy" , "dpleft" , "left" } )
	KeyMap:bind( "right" , {"key", "d", "right"} )
	KeyMap:bind( "right" , {"joy" , "dpright" , "right" } )
	KeyMap:bind( "fire" , {"key", " "} )
	KeyMap:bind( "fire" , {"joy" , "a" } )

end

function keyUpdate(dt)
	KeyMap:update(dt)
	if(KeyMap.isPushed("up")) then
		print("pressed up")
	end
end

function keyDown(string)
	return KeyMap:isDown(string)
end

function keyPressed(string)
	return KeyMap:isPushed(string)
end