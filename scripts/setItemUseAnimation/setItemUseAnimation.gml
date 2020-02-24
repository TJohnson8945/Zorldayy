	
var linkX = argument0
var linkY = argument1
var itemHeld = argument2
var hp = argument3
var maxHp = argument4
var facingLeft = argument5
var facingRight = argument6
var facingUp = argument7
var facingDown = argument8
var animationSpeed = argument9
var swordBlastSpeed = argument10
var usingItem = argument11

var noItem = 0
var wood = 1
var white = 2
var magic = 3
var rod = 4

//[Sprite Index, Image Index, Image X Scale, Image Speed]
var spriteArray

if facingRight {
	spriteArray[2] = 1
	
	linkX += 64
	
	if itemHeld == noItem {
		spriteArray[0] = sprLinkUseItem
		spriteArray[1] = 1
		spriteArray[3] = 0

	} else if itemHeld == wood {
		spriteArray[0] = sprLinkSwordWoodenSdwys
		spriteArray[1] = 0
		spriteArray[3] = animationSpeed
		spawnSwordBlast(hp, maxHp, linkX, linkY, 4, 1, 1, swordBlastSpeed, 0, usingItem, itemHeld)

	} else if itemHeld == white {
		spriteArray[0] = sprLinkSwordWhiteSdwys
		spriteArray[1] = 0
		spriteArray[3] = animationSpeed
		spawnSwordBlast(hp, maxHp, linkX, linkY, 6, 1, 1, swordBlastSpeed, 0, usingItem, itemHeld)
		
	} else if itemHeld == magic {
		spriteArray[0] = sprLinkSwordMagicSdwys
		spriteArray[1] = 0
		spriteArray[3] = animationSpeed
		spawnSwordBlast(hp, maxHp, linkX, linkY, 7, 1, 1, swordBlastSpeed, 0, usingItem, itemHeld)
	
	} else if itemHeld == rod {
		spriteArray[0] = sprLinkRodMagicSdwys
		spriteArray[1] = 0
		spriteArray[3] = animationSpeed
		spawnSwordBlast(hp, maxHp, linkX, linkY, 5, 1, 1, swordBlastSpeed, 0, usingItem, itemHeld)
	}
			
} else if facingLeft {
	spriteArray[2] = -1
	
	linkX -= 64
	
	if itemHeld == noItem {
		spriteArray[0] = sprLinkUseItem
		spriteArray[1] = 1
		spriteArray[3] = 0
		
	} else if itemHeld == wood {
		spriteArray[0] = sprLinkSwordWoodenSdwys
		spriteArray[1] = 0
		spriteArray[3] = animationSpeed
		spawnSwordBlast(hp, maxHp, linkX, linkY, 4, -1, 1, -swordBlastSpeed, 0, usingItem, itemHeld)

	} else if itemHeld == white {
		spriteArray[0] = sprLinkSwordWhiteSdwys
		spriteArray[1] = 0
		spriteArray[3] = animationSpeed
		spawnSwordBlast(hp, maxHp, linkX, linkY, 6, -1, 1, -swordBlastSpeed, 0, usingItem, itemHeld)
		
	} else if itemHeld == magic {
		spriteArray[0] = sprLinkSwordMagicSdwys
		spriteArray[1] = 0
		spriteArray[3] = animationSpeed
		spawnSwordBlast(hp, maxHp, linkX, linkY, 7, -1, 1, -swordBlastSpeed, 0, usingItem, itemHeld)
	
	} else if itemHeld == rod {
		spriteArray[0] = sprLinkRodMagicSdwys
		spriteArray[1] = 0
		spriteArray[3] = animationSpeed
		spawnSwordBlast(hp, maxHp, linkX, linkY, 5, -1, 1, -swordBlastSpeed, 0, usingItem, itemHeld)
	}
	
} else if facingUp {
	spriteArray[2] = 1
	
	linkY -= 64
	
	if itemHeld == noItem {
		spriteArray[0] = sprLinkUseItem
		spriteArray[1] = 2
		spriteArray[3] = 0
		
	} else if itemHeld == wood {
		spriteArray[0] = sprLinkSwordWoodenUp
		spriteArray[1] = 0
		spriteArray[3] = animationSpeed
		spawnSwordBlast(hp, maxHp, linkX, linkY, 0, 1, 1, 0, -swordBlastSpeed, usingItem, itemHeld)

	} else if itemHeld == white {
		spriteArray[0] = sprLinkSwordWhiteUp
		spriteArray[1] = 0
		spriteArray[3] = animationSpeed
		spawnSwordBlast(hp, maxHp, linkX, linkY, 2, 1, 1, 0, -swordBlastSpeed, usingItem, itemHeld)
	
	} else if itemHeld == magic {
		spriteArray[0] = sprLinkSwordMagicUp
		spriteArray[1] = 0
		spriteArray[3] = animationSpeed
		spawnSwordBlast(hp, maxHp, linkX, linkY, 3, 1, 1, 0, -swordBlastSpeed, usingItem, itemHeld)
	
	} else if itemHeld == rod {
		spriteArray[0] = sprLinkRodMagicUp
		spriteArray[1] = 0
		spriteArray[3] = animationSpeed
		spawnSwordBlast(hp, maxHp, linkX, linkY, 1, 1, 1, 0, -swordBlastSpeed, usingItem, itemHeld)
	}
		
} else if facingDown {
	spriteArray[1] = 0
	spriteArray[2] = 1
	
	linkY += 64
	
	if itemHeld == noItem {
		spriteArray[0] = sprLinkUseItem
		spriteArray[3] = 0
		
	} else if itemHeld == wood {
		spriteArray[0] = sprLinkSwordWoodenDown
		spriteArray[3] = animationSpeed
		spawnSwordBlast(hp, maxHp, linkX, linkY, 0, 1, -1, 0, swordBlastSpeed, usingItem, itemHeld)

	} else if itemHeld == white {
		spriteArray[0] = sprLinkSwordWhiteDown
		spriteArray[3] = animationSpeed
		spawnSwordBlast(hp, maxHp, linkX, linkY, 2, 1, -1, 0, swordBlastSpeed, usingItem, itemHeld)
	
	} else if itemHeld == magic {
		spriteArray[0] = sprLinkSwordMagicDown
		spriteArray[1] = 0
		spriteArray[3] = animationSpeed
		spawnSwordBlast(hp, maxHp, linkX, linkY, 3, 1, -1, 0, swordBlastSpeed, usingItem, itemHeld)
	
	} else if itemHeld == rod {
		spriteArray[0] = sprLinkRodMagicDown
		spriteArray[1] = 0
		spriteArray[3] = animationSpeed
		spawnSwordBlast(hp, maxHp, linkX, linkY, 1, 1, -1, 0, swordBlastSpeed, usingItem, itemHeld)
	}
}

return spriteArray