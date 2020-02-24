
if !trigger {
	sprite_index = sprBomb
	image_index = 3
	alarm[0] = 5
	trigger = true
	objLink.currentHealth -= 1
	objLink.damageTrigger = true
}