
if instance_exists(objLink) {
	objLink.visible = false
	if objLink.changingRooms == 0 {
		room_goto(0)
	}
}