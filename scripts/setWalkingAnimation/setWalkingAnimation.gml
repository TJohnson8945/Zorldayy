
var up = argument0
var down = argument1
var left = argument2
var right = argument3
var animationSpeed = argument4

//[Sprite Index, Image Index, Image X Scale, Image Speed]
var spriteArray
	
if left {
	spriteArray[0] = sprLinkSdwys
	spriteArray[2] = -1
	
} else if right {
	spriteArray[0] = sprLinkSdwys
	spriteArray[2] = 1
	
} else if up {
	spriteArray[0] = sprLinkUp
	spriteArray[2] = 1
	
} else if down {
	spriteArray[0] = sprLinkDwn
	spriteArray[2] = 1
}

spriteArray[1] = 0
spriteArray[3] = animationSpeed

return spriteArray