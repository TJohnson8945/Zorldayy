if vLeft {
	instance_deactivate_region(cameraX+cameraW, cameraY, cameraW, cameraH, true, true)
} if vRight {
	instance_deactivate_region(cameraX-cameraW, cameraY, cameraW, cameraH, true, true)
} if vUp {
	instance_deactivate_region(cameraX, cameraY+cameraH, cameraW, cameraH, true, true)
} if vDown {
	instance_deactivate_region(cameraX, cameraY-cameraH, cameraW, cameraH, true, true)
}