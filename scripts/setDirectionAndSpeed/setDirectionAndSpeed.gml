
var movementSpeed = argument0
var isCollision = argument1
var currentDirection = argument2
var lastMovement = argument3
var buttons = argument4
var walkTime = argument5
var tilemap = argument6
var viewMoving = argument7

var vsp = 0
var hsp = 0

//Grid based movement
if walkTime == 0 {
	var left = false
	var	right = false
	var up = false
	var down = false
} else {
	var left = lastMovement[0]
	var	right = lastMovement[1]
	var up = lastMovement[2]
	var down = lastMovement[3]
}

//Check keyboard presses [hspeed, vspeed, Left, Right, Up, Down, Moving, Facing Left, Facing Right, Facing Up, Facing Down]
var movementData
movementData[2] = false
movementData[3] = false
movementData[4] = false
movementData[5] = false
movementData[6] = false
movementData[7] = false
movementData[8] = false
movementData[9] = false
movementData[10] = false
movementData[11] = false
	
//Collect user input
if walkTime == 0 and room != 0 {
	if keyboard_check(buttons[2]) {
		up = true
		movementData[11] = true
	} if keyboard_check(buttons[3]) {
		down = true
		movementData[11] = true
	} if keyboard_check(buttons[0]) {
		left = true
		movementData[11] = true
	} if keyboard_check(buttons[1]) {
		right = true
		movementData[11] = true
	}
}

//Set basic controls
if up {
	vsp = -movementSpeed
	movementData[4] = true
	movementData[9] = true
} if down {
	vsp = movementSpeed
	movementData[5] = true
	movementData[10] = true
} if left {
	hsp = -movementSpeed
	movementData[2] = true
	movementData[7] = true
} if right {
	hsp = movementSpeed
	movementData[3] = true
	movementData[8] = true	
}

//Advanced control logic

//Left and right or up and down cancels movement
if (left and right) or (up and down) {
	left = false
	right = false
	up = false
	down = false
	
//No movement cancels all direction
} if !(left or right or up or down) {
	movementData[2] = false
	movementData[3] = false
	movementData[4] = false
	movementData[5] = false
	movementData[7] = currentDirection[0]
	movementData[8] = currentDirection[1]
	movementData[9] = currentDirection[2]
	movementData[10] = currentDirection[3]
	vsp = 0
	hsp = 0
	
//Movement variable
} else {
	movementData[6] = true
}

//No movement during collision
if isCollision {
	movementData[6] = false	
}

//Adjust direction variables 
if (left and up) or (right and up) {
	movementData[9] = false

} if (left and down) or (right and down) {
	movementData[10] = false
}

var colliding = false

//Horizontal Collision
if (hsp > 0) bbox_side = bbox_right; else bbox_side = bbox_left;
if (tilemap_get_at_pixel(tilemap,bbox_side + hsp, bbox_top) != 0) or (tilemap_get_at_pixel(tilemap, bbox_side + hsp, bbox_bottom) != 0)
 or place_meeting(x, y, objDoors) {
	if (hsp > 0) x = x - (x mod 64) + 63 - (bbox_right - x);
	else x = x - (x mod 64) - (bbox_left - x);
	hsp = 0;	
	colliding = true
}
//Vertical Collision
if (vsp > 0) bbox_side = bbox_bottom; else bbox_side = bbox_top;
if (tilemap_get_at_pixel(tilemap, bbox_left, bbox_side + vsp) != 0) or (tilemap_get_at_pixel(tilemap, bbox_right, bbox_side + vsp) != 0)
 or place_meeting(x, y, objDoors) {
	if (vsp > 0) y = y - (y mod 64) + 63 - (bbox_bottom - y);
	else y = y - (y mod 64) - (bbox_top - y);
	vsp = 0;
	colliding = true
}

if instance_exists(oPathFinder) {
	angle = point_direction(oPathFinder.x, oPathFinder.y, x, y)

	if damageTimer > 1.8*room_speed and !colliding {
		direction = angle
		speed = 8
		movementData[12] = true
	} else {
		direction = 0
		speed = 0
		movementData[12] = false
	}
} else {
	movementData[12] = false
}

if viewMoving > 0 {
	vsp = 0
	hsp = 0
}

//Add modified coordinate values

movementData[0] = hsp
movementData[1] = vsp

return movementData