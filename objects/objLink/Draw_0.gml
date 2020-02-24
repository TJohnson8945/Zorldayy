
draw_self()

if room != 0 {
	//Set damage animation
	if damageTimer > 0 {
		if damageTimer % 10 == 0 {
			image_blend = damageColor	
		} else if damageTimer % 5 == 0 {
			image_blend = startImageBlend
		}
	
	} else {
		image_blend = startImageBlend
	}

	//Set item switch animation
	if itemHeldDelay > 0 {
	
		if itemHeldDelay == itemHeldDelayConstant {
			sprite_index = sprLinkPickUpItem
			image_xscale = 1
			image_speed = 4
			image_index = 0
		}
	
	//Set item use animation
	} if usingItem and itemHeldDelay == 0 {
		moving = false
		hspeed = 0
		vspeed = 0
		var spriteData = setItemUseAnimation(x, y, itemHeld, currentHealth, 
		maxHealthConstant, facingLeft, facingRight, facingUp, facingDown, 
		itemUseAnimationSpeed, swordBlastSpeed, usingItemTrigger)
	
		sprite_index = spriteData[0]
		image_xscale = spriteData[2]
	
	
		if usingItemTrigger {
			usingItemTrigger = false
			image_index = spriteData[1]
			image_speed = spriteData[3]
		}
	
		if (image_index == image_number - 1) or (noItemTimer == 1) {
			usingItem = false
		}
	
	//Set walking animation
	} if moving and itemHeldDelay == 0 {
		var spriteData = setWalkingAnimation(up, down, left, right, walkingAnimationSpeed)
		sprite_index = spriteData[0]
		image_xscale = spriteData[2]
	
		if image_speed != walkingAnimationSpeed {
			image_index = spriteData[1]
			image_speed = spriteData[3]
		}
		
	//Set standing animation
	} if !moving and !usingItem and itemHeldDelay == 0 {
		var spriteData = setWalkingAnimation(facingUp, facingDown, facingLeft, facingRight, 0)
		sprite_index = spriteData[0]
		image_xscale = spriteData[2]
	
		if image_speed != 0 {
			image_index = spriteData[1]
			image_speed = spriteData[3]
		}
	}
}


//Debugging aid
/*
draw_set_alpha(1)
draw_set_color(c_white)
draw_set_font(font0)
draw_text(x, y+60, "Item Held: " + string(object_get_name(itemHeld)) + ", Barrier Collision: " + string(barrierCollision))
draw_text(x, y+25, "Coordinates: (" + string(x) + ", " + string(y) + "), Moving: " + string(moving) + ", In Bounds: " + string(inBounds))
*/