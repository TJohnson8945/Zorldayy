
//Pick up hearts for health
var hearts = instance_place(x+hspeed, y+vspeed, objHearts) 
if hearts != noone {
	if hearts.image_index == 0 {
		currentHealth += 2
	} else if hearts.image_index == 1 {
		currentHealth += 1
	}
	
	instance_destroy(hearts)
}

//Set damage timer
if damageTrigger and damageTimer == 0 {
	damageTrigger = false
	damageTimer = damageTimerConstant
}

//Prevent current health from exceeding max health
if currentHealth > maxHealthConstant {
	currentHealth = maxHealthConstant
}

//Set death variable
if currentHealth <= 0 {
	death = true
}

//Do death thing (in progress)
if death {
	if !audio_is_playing(deathSound) {
		audio_stop_all()
		audio_play_sound(deathSound, 1, true)
	}
	show_message("You Died")
	game_restart()
}

if room == 2 and x > 4644 and x < 5597 and y > 735 and y < 1437 and !audio_is_playing(bossMusic) and instance_exists(objBoss) {
	audio_stop_all()
	audio_play_sound(bossMusic, 1, true)
}

if audio_is_playing(bossMusic) and !instance_exists(objBoss) and audio_sound_get_gain(bossMusic) != 0 {
	audio_sound_gain(bossMusic, 0, 250)
} else if audio_is_playing(bossMusic) and audio_sound_get_gain(bossMusic) == 0 {
	audio_stop_all()
}	

//Pick up sword
var newItem = instance_place(x, y, objSwords)

if newItem != noone and itemHeldDelay == 0 {
	itemSwitch = true
	itemHeld = getWeaponIndex(newItem)
}

//Set viewport bounding variables
var boundsData = setBounds(x, y, camera_get_view_x(view_get_camera(0)), camera_get_view_y(view_get_camera(0)), 
camera_get_view_width(view_get_camera(0)), camera_get_view_height(view_get_camera(0)), gridPeriodLength)

inLeftBound = boundsData[0]
inRightBound = boundsData[1]
inTopBound = boundsData[2]
inBottomBound = boundsData[3]
inBounds = boundsData[4]

//Timer for death and switching items
if damageTimer > 0 {
	damageTimer -=1
	
} if itemHeldDelay > 0 {
	itemHeldDelay -= 1

} if walkTime > 0 {
	walkTime -= 1

} if noItemTimer > 0 {
	noItemTimer -= 1

} if changingRooms > 0 {
	camera_set_view_pos(view_get_camera(0), cameraX1, cameraY1)
	camera_set_view_pos(view_get_camera(0), cameraX1, cameraY1)
	x = xValue
	y = yValue
	changingRooms -= 1
}

//Check if using item
if keyboard_check_pressed(useItemButton) and !usingItem and room != 0 {
	usingItem = true
	usingItemTrigger = true
	if itemHeld == 0 {
		noItemTimer = 30
	}
	
//Check if switching items
} if itemSwitch and itemHeldDelay == 0 {
	itemHeldDelay = itemHeldDelayConstant
	
} else {
	itemSwitch = false
}

//Set movement and direction
if !usingItem and itemHeldDelay == 0 {
	var movementData = setDirectionAndSpeed(mvmtSpeed, 
	barrierCollision, [facingLeft, facingRight, facingUp, facingDown], [left, right, up, down],
	[leftButton, rightButton, upButton, downButton], walkTime, tilemap, viewMoving)
	
	if !knockedBack {
		hspeed = movementData[0]
		vspeed = movementData[1]
	}
	
	left = movementData[2]
	right = movementData[3]
	up = movementData[4]
	down = movementData[5]
	moving = movementData[6]
	facingLeft = movementData[7]
	facingRight = movementData[8]
	facingUp = movementData[9]
	facingDown = movementData[10]
	knockedBack = movementData[12]
	
	if movementData[11] {
		walkTime = walkTimeConstant
	}
	
} else {
	hspeed = 0
	vspeed = 0
}

//Set camera variables
var camera = view_get_camera(0)
var cameraX = camera_get_view_x(camera)
var cameraY = camera_get_view_y(camera)
var cameraW = camera_get_view_width(camera)
var cameraH = camera_get_view_height(camera)

if !inBounds and viewMoving == 0 and changingRooms == 0 and room != 0 {
	viewMoving = 30	
	if !inLeftBound {
		vLeft = true
	} if !inRightBound {
		vRight = true
	} if !inTopBound {
		vUp = true
	} if !inBottomBound {
		vDown = true
	}
	
} else if inBounds and viewMoving == 0 {
	vDown = false
	vUp = false
	vRight = false
	vLeft = false
}

//Deactivate enemies when going to dungeon
if firstRoomStep {
	instance_deactivate_layer("Enemy_Layer")
	firstRoomStep = false
}

//Play music
if room == 2 and !audio_is_playing(dungeonMusic) and !audio_is_playing(bossMusic) {
	audio_stop_all()
	audio_play_sound(dungeonMusic, 1, true)	
} if room == 1 and !audio_is_playing(overworldMusic) {
	audio_stop_all()
	audio_play_sound(overworldMusic, 1, true)	
}

//Despawn enemies and spawn enemies in next room
if viewMoving == 30 {
	instance_deactivate_layer("Enemy_Layer")
	if vLeft {
		instance_activate_region(cameraX-cameraW, cameraY, cameraW, cameraH, true)
	} if vRight {
		instance_activate_region(cameraX+cameraW, cameraY, cameraW, cameraH, true)
	} if vUp {
		instance_activate_region(cameraX, cameraY-cameraH, cameraW, cameraH, true)
	} if vDown {
		instance_activate_region(cameraX, cameraY+cameraH, cameraW, cameraH, true)
	}
}

//Move camera when changing rooms
if viewMoving > 0 and changingRooms == 0 and room != 0 {
	viewMoving -= 1
	
	if vLeft {
		camera_set_view_pos(camera, cameraX - (cameraW+64)/30, cameraY)
	} if vRight {
		camera_set_view_pos(camera, cameraX + (cameraW+64)/30, cameraY)
	} if vUp {
		camera_set_view_pos(camera, cameraX, cameraY - (cameraH+64)/30)
	} if vDown {
		camera_set_view_pos(camera, cameraX, cameraY + (cameraH+64)/30)
	}
}

//Check for cheats
cheatCodes()
tilemap = layer_tilemap_get_id("Collision")