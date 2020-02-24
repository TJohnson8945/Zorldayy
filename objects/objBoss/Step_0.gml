event_inherited();

if hspeed == 0 {
	hspeed = bossSpeed
}

if place_meeting(x, y, objSolidParent) {
	hspeed = -hspeed
}

if vspeed == 0 {
	vspeed = bossSpeed
}

if place_meeting(x, y, objSolidParent) {
	vspeed = -vspeed
}

if attackSpeed > 0 {
	attackSpeed -= 1

} else {
	attackSpeed	= random(attackChance)
	instance_create_depth(x, y, -2, objBossProjectile)
}

if currentHealth <= 0 {
	instance_create_depth(x, y, -1, objMeat)
	instance_destroy(self)
}