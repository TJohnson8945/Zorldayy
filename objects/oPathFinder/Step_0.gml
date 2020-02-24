
if object_exists(objLink) {
	var targetX = objLink.x
	var targetY = objLink.y
	var linkAttacking = objLink.usingItem
	var linkFacingLeft = objLink.facingLeft
	var linkFacingRight = objLink.facingRight
	var linkFacingUp = objLink.facingUp
	var linkFacingDown = objLink.facingDown
	var linkCollision = place_meeting(x, y, objLink)
} else {
	var targetX = x
	var targetY = y
	var linkAttacking = false
	var linkFacingLeft = false
	var linkFacingRight = false
	var linkFacingUp = false
	var linkFacingDown = false
	var linkCollision = false
}

var blast = false
var stab = false
var burn = false
stepCount += 1

if stepCount % pathUpdateRate == 0 {
    var path = aStarGetPath(x, y, targetX, targetY)
    path_start(path, enemySpeed, 0, false)
}

linkLeft = targetX < x
linkRight = targetX > x
linkUp = targetY < y
linkDown = targetY > y

if linkCollision and damageTimer == 0 and !death { 
	if linkAttacking {
		if (linkLeft and linkFacingRight) or (linkRight and linkFacingLeft) 
		or (linkUp and linkFacingDown) or (linkDown and linkFacingUp) {
			damageTrigger = true
			stab = true
			
		} else if (damageTimer == 0) {
			dealDamageTrigger = true
		}
	
	} else if (damageTimer == 0) {
		dealDamageTrigger = true
	}
}

if place_meeting(x, y, objSwordBlast) and damageTimer == 0 {
	damageTrigger = true
	blast = true
}

if place_meeting(x, y, objFire) and damageTimer == 0 {
	damageTrigger = true
	burn = true
}

if damageTrigger {
	damageTimer = damageTimerConstant
	damageTrigger = false
	image_blend = damageColor
	alarm[1] = 10
	if !burn {
		path_speed = -path_speed*2
	} if stab {
		currentHealth -= objLink.itemHeld*2
	} else if blast {
		currentHealth -= objLink.itemHeld
	} else if burn {
		currentHealth -= 1/2
	}

} if dealDamageTrigger {
	damageTimer = damageTimerConstant
	dealDamageTrigger = false
	objLink.currentHealth -= attackDamage
	objLink.damageTrigger = true
}

if currentHealth <= 0 and !death and !boss {
	alarm[0] = 7
	death = true
}

if damageTimer > 0 {
	damageTimer -= 1
}
	