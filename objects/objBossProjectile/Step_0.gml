
if instance_exists(objLink) {
	var targetX = objLink.x
	var targetY = objLink.y
	
} else {
	var targetX = x
	var targetY = y
}

move_towards_point(targetX, targetY, projectileSpeed)