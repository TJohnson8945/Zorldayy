

if keyboard_check(vk_control) {
	
	if keyboard_check_pressed(ord("H")) {
		currentHealth = maxHealthConstant
	}
	
	if keyboard_check_pressed(ord("K")) {
		instance_deactivate_layer("Enemy_Layer")	
	}
	
}