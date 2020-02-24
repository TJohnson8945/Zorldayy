/// starting a NEW Game and Exiting 

if room == 0 {
	if instance_exists(objLink) {
		objLink.visible = true
	}
	switch(menu_index) {
		case 0:
			room_goto(currentRoom)
			break;
		case 1:
			game_end();
			break;
	}
}
