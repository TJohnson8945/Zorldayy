///  picking a choice 
if room == 0 {
	if !audio_is_playing(menuMusic) {
		audio_stop_all()
		audio_play_sound(menuMusic, 1, true)
	}
	menu_move = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);

	menu_index += menu_move;

	if (menu_index < 0) menu_index = buttons - 1;
	if (menu_index > buttons - 1) menu_index = 0;

	last_selected = menu_index;

} else {
	currentRoom = room
}